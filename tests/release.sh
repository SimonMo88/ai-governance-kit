#!/bin/sh

set -eu

PROJECT_ROOT=$(CDPATH= cd -- "$(dirname "$0")/.." && pwd)
TEST_ROOT=$(mktemp -d "${TMPDIR:-/tmp}/ai-governance-release-test.XXXXXX")
trap 'rm -rf "$TEST_ROOT"' EXIT HUP INT TERM

fail() {
  printf 'FAIL: %s\n' "$*" >&2
  exit 1
}

assert_contains() {
  file=$1
  expected=$2
  grep -F "$expected" "$file" >/dev/null || fail "expected output to contain: $expected"
}

make_fixture() {
  # Real release orchestration runs against deterministic git and GitHub fakes;
  # unrelated checks are minimal successful scripts inside each isolated root.
  fixture_root=$1
  mkdir -p "$fixture_root/bin" "$fixture_root/scripts" "$fixture_root/tests"
  cp "$PROJECT_ROOT/scripts/release.sh" "$fixture_root/scripts/release.sh"
  printf '0.1.0\n' > "$fixture_root/VERSION"
  printf '#!/bin/sh\nexit 0\n' > "$fixture_root/install.sh"
  printf '#!/bin/sh\nexit 0\n' > "$fixture_root/bin/ai-governance"
  printf '#!/bin/sh\nexit 0\n' > "$fixture_root/tests/readme-links.sh"
  printf '#!/bin/sh\nexit 0\n' > "$fixture_root/tests/install-and-cli.sh"

  cp "$PROJECT_ROOT/tests/fixtures/release-git.sh" "$fixture_root/bin/git"
  cp "$PROJECT_ROOT/tests/fixtures/release-gh.sh" "$fixture_root/bin/gh"
  chmod +x "$fixture_root/bin/git" "$fixture_root/bin/gh"
}

SUCCESS_ROOT="$TEST_ROOT/success"
make_fixture "$SUCCESS_ROOT"
SUCCESS_LOG="$TEST_ROOT/success.log"
COMMAND_LOG="$TEST_ROOT/commands.log"
if ! (
  cd "$SUCCESS_ROOT"
  printf '0.2.0\nyes\n' |
    PATH="$SUCCESS_ROOT/bin:$PATH" RELEASE_COMMAND_LOG="$COMMAND_LOG" \
      sh scripts/release.sh > "$SUCCESS_LOG" 2>&1
); then
  cat "$SUCCESS_LOG" >&2
  fail "valid exact-version release failed"
fi
[ "$(sed -n '1p' "$SUCCESS_ROOT/VERSION")" = "0.2.0" ] ||
  fail "successful release did not update VERSION"
assert_contains "$COMMAND_LOG" "commit -m chore: release v0.2.0 -- VERSION"
assert_contains "$COMMAND_LOG" "push origin main"
assert_contains "$COMMAND_LOG" "tag -a v0.2.0 -m Release v0.2.0"
assert_contains "$COMMAND_LOG" "push origin v0.2.0"
assert_contains "$SUCCESS_LOG" "GitHub will build the files and generate the release notes."
assert_contains "$SUCCESS_LOG" "patch: 0.1.1"
assert_contains "$SUCCESS_LOG" "minor: 0.2.0"
assert_contains "$SUCCESS_LOG" "major: 1.0.0"

PATCH_ROOT="$TEST_ROOT/patch"
make_fixture "$PATCH_ROOT"
(
  cd "$PATCH_ROOT"
  printf 'patch\nyes\n' |
    PATH="$PATCH_ROOT/bin:$PATH" RELEASE_COMMAND_LOG="$TEST_ROOT/patch-commands.log" \
      sh scripts/release.sh > "$TEST_ROOT/patch.log" 2>&1
)
[ "$(sed -n '1p' "$PATCH_ROOT/VERSION")" = "0.1.1" ] ||
  fail "patch shortcut chose the wrong version"

CANCEL_ROOT="$TEST_ROOT/cancel"
make_fixture "$CANCEL_ROOT"
(
  cd "$CANCEL_ROOT"
  printf '0.2.0\nno\n' |
    PATH="$CANCEL_ROOT/bin:$PATH" RELEASE_COMMAND_LOG="$TEST_ROOT/cancel-commands.log" \
      sh scripts/release.sh > "$TEST_ROOT/cancel.log" 2>&1
)
[ "$(sed -n '1p' "$CANCEL_ROOT/VERSION")" = "0.1.0" ] ||
  fail "cancelled release changed VERSION"

INVALID_ROOT="$TEST_ROOT/invalid"
make_fixture "$INVALID_ROOT"
if (
  cd "$INVALID_ROOT"
  printf '0.1.0\n' |
    PATH="$INVALID_ROOT/bin:$PATH" RELEASE_COMMAND_LOG="$TEST_ROOT/invalid-commands.log" \
      sh scripts/release.sh > "$TEST_ROOT/invalid.log" 2>&1
); then
  fail "release accepted an unchanged version"
fi
[ "$(sed -n '1p' "$INVALID_ROOT/VERSION")" = "0.1.0" ] ||
  fail "invalid release changed VERSION"
assert_contains "$TEST_ROOT/invalid.log" "new version must be greater than 0.1.0"

grep -F -- '--generate-notes' "$PROJECT_ROOT/.github/workflows/release.yml" >/dev/null ||
  fail "GitHub release workflow no longer generates release notes"

printf 'All release checks passed.\n'
