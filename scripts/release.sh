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
current_version=$(sed -n '1p' VERSION)

validate_version() {
  version_to_validate=$1
  case "$version_to_validate" in
    ''|*[!0-9.]*|.*|*.|*..*) return 1 ;;
  esac

  old_ifs=$IFS
  IFS=.
  set -- $version_to_validate
  IFS=$old_ifs
  [ "$#" -eq 3 ] || return 1
  [ "$1" = "0" ] || [ "${1#0}" = "$1" ] || return 1
  [ "$2" = "0" ] || [ "${2#0}" = "$2" ] || return 1
  [ "$3" = "0" ] || [ "${3#0}" = "$3" ] || return 1
}

version_is_greater() {
  awk -v current="$1" -v target="$2" '
    BEGIN {
      split(current, current_parts, ".")
      split(target, target_parts, ".")
      for (part_number = 1; part_number <= 3; part_number++) {
        if (target_parts[part_number] > current_parts[part_number]) exit 0
        if (target_parts[part_number] < current_parts[part_number]) exit 1
      }
      exit 1
    }
  '
}

validate_version "$current_version" || fail "VERSION must contain a version such as 0.2.0"

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

patch_version=$(awk -F. '{ print $1 "." $2 "." $3 + 1 }' VERSION)
minor_version=$(awk -F. '{ print $1 "." $2 + 1 ".0" }' VERSION)
major_version=$(awk -F. '{ print $1 + 1 ".0.0" }' VERSION)

printf '\nCurrent version: %s\n' "$current_version"
printf 'Suggested versions:\n'
printf '  patch: %s\n' "$patch_version"
printf '  minor: %s\n' "$minor_version"
printf '  major: %s\n' "$major_version"
printf 'Choose patch, minor, major, or enter an exact version: '
read -r version_choice
case "$version_choice" in
  patch) version=$patch_version ;;
  minor) version=$minor_version ;;
  major) version=$major_version ;;
  *) version=$version_choice ;;
esac
validate_version "$version" || fail "enter a version with three numeric parts, such as 0.2.0"
version_is_greater "$current_version" "$version" || fail "new version must be greater than $current_version"
tag="v$version"

if git rev-parse "$tag" >/dev/null 2>&1; then
  fail "tag $tag already exists locally"
fi
if git ls-remote --exit-code --tags origin "refs/tags/$tag" >/dev/null 2>&1; then
  fail "tag $tag already exists on origin"
fi

version_changed=true
version_committed=false
restore_uncommitted_version() {
  if [ "$version_changed" = true ] && [ "$version_committed" = false ]; then
    printf '%s\n' "$current_version" > VERSION
  fi
}
trap restore_uncommitted_version EXIT
trap 'exit 1' HUP INT TERM

printf '%s\n' "$version" > VERSION

printf 'Running release checks...\n'
sh -n install.sh bin/ai-governance tests/*.sh scripts/release.sh
sh tests/readme-links.sh
sh tests/install-and-cli.sh
git diff --check

printf '\nReady to release AI Governance Kit %s.\n' "$tag"
printf 'Base commit: %s\n' "$local_head"
printf 'This will commit VERSION, push main, and push the release tag.\n'
printf 'GitHub will build the files and generate the release notes.\n'
printf 'Continue? [y/N] '
read -r answer
case "$answer" in
  y|Y|yes|YES) ;;
  *) printf 'Release cancelled. Nothing was changed.\n'; exit 0 ;;
esac

git commit -m "chore: release $tag" -- VERSION
version_committed=true

if ! git push origin main; then
  printf 'The release commit was created locally but could not be pushed.\n' >&2
  printf 'After fixing the problem, run: git push origin main\n' >&2
  exit 1
fi

git tag -a "$tag" -m "Release $tag"
if ! git push origin "$tag"; then
  printf 'The tag was created locally but could not be pushed.\n' >&2
  printf 'After fixing the problem, run: git push origin %s\n' "$tag" >&2
  exit 1
fi

printf '\nRelease started successfully.\n'
printf 'Find it with: gh run list --workflow release.yml --limit 1\n'
printf 'View it with: gh release view %s --web\n' "$tag"
