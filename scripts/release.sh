#!/bin/sh

set -eu

PROJECT_ROOT=$(CDPATH= cd -- "$(dirname "$0")/.." && pwd)
cd "$PROJECT_ROOT"

fail() {
  printf 'Release stopped: %s\n' "$*" >&2
  exit 1
}

require_command() {
  command -v "$1" >/dev/null 2>&1 || fail "$1 is required"
}

require_command git
require_command gh

[ -r VERSION ] || fail "VERSION is missing"
version=$(sed -n '1p' VERSION)
case "$version" in
  ''|*[!0-9A-Za-z.-]*) fail "VERSION contains an invalid version" ;;
esac
tag="v$version"

branch=$(git branch --show-current)
[ "$branch" = "main" ] || fail "switch to main before releasing (current branch: $branch)"

[ -z "$(git status --porcelain)" ] || fail "commit or remove all worktree changes before releasing"

git remote get-url origin >/dev/null 2>&1 || fail "the origin remote is missing"
gh auth status >/dev/null 2>&1 || fail "sign in to GitHub with 'gh auth login'"

printf 'Checking origin/main...\n'
git fetch origin main --tags

local_head=$(git rev-parse HEAD)
remote_head=$(git rev-parse origin/main)
[ "$local_head" = "$remote_head" ] || fail "local main must exactly match origin/main"

if git rev-parse "$tag" >/dev/null 2>&1; then
  fail "tag $tag already exists locally"
fi
if git ls-remote --exit-code --tags origin "refs/tags/$tag" >/dev/null 2>&1; then
  fail "tag $tag already exists on origin"
fi

printf 'Running release checks...\n'
sh -n install.sh bin/ai-governance tests/*.sh scripts/release.sh
sh tests/readme-links.sh
sh tests/install-and-cli.sh
git diff --check

printf '\nReady to release AI Governance Kit %s.\n' "$tag"
printf 'Commit: %s\n' "$local_head"
printf 'This will create and push the tag. GitHub will build the release files.\n'
printf 'Continue? [y/N] '
read -r answer
case "$answer" in
  y|Y|yes|YES) ;;
  *) printf 'Release cancelled. Nothing was changed.\n'; exit 0 ;;
esac

git tag -a "$tag" -m "Release $tag"
if ! git push origin "$tag"; then
  printf 'The tag was created locally but could not be pushed.\n' >&2
  printf 'After fixing the problem, run: git push origin %s\n' "$tag" >&2
  exit 1
fi

printf '\nRelease started successfully.\n'
printf 'Find it with: gh run list --workflow release.yml --limit 1\n'
printf 'View it with: gh release view %s --web\n' "$tag"
