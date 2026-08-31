#!/bin/sh

set -eu

PROJECT_ROOT=$(CDPATH= cd -- "$(dirname "$0")/.." && pwd)
TEST_ROOT=$(mktemp -d "${TMPDIR:-/tmp}/ai-governance-test.XXXXXX")
trap 'rm -rf "$TEST_ROOT"' EXIT HUP INT TERM

PACKAGE_PARENT="$TEST_ROOT/package-parent"
PACKAGE_ROOT="$PACKAGE_PARENT/ai-governance-kit"
ARCHIVE="$TEST_ROOT/ai-governance-kit.tar.gz"
CHECKSUM="$TEST_ROOT/ai-governance-kit.tar.gz.sha256"
DATA_DIR="$TEST_ROOT/data"
BIN_DIR="$TEST_ROOT/bin"
CODEX_DIR="$TEST_ROOT/codex"
CLAUDE_DIR="$TEST_ROOT/claude"
CURRENT_VERSION=$(sed -n '1p' "$PROJECT_ROOT/VERSION")
UPDATED_VERSION=$(awk -F. '{ print $1 "." $2 "." $3 + 1 }' "$PROJECT_ROOT/VERSION")

fail() {
  printf 'FAIL: %s\n' "$*" >&2
  exit 1
}

assert_contains() {
  value=$1
  expected=$2
  case "$value" in
    *"$expected"*) ;;
    *) fail "expected output to contain: $expected" ;;
  esac
}

mkdir -p "$PACKAGE_ROOT"
cp -R \
  "$PROJECT_ROOT/.ai-governance" \
  "$PROJECT_ROOT/assets" \
  "$PROJECT_ROOT/bin" \
  "$PROJECT_ROOT/docs" \
  "$PROJECT_ROOT/references" \
  "$PROJECT_ROOT/scopes" \
  "$PACKAGE_ROOT/"
cp \
  "$PROJECT_ROOT/ADOPTION.md" \
  "$PROJECT_ROOT/AGENTS.md" \
  "$PROJECT_ROOT/AI_CONTEXT.md" \
  "$PROJECT_ROOT/ENGINEERING_QUALITY.md" \
  "$PROJECT_ROOT/README.md" \
  "$PROJECT_ROOT/SECURITY.md" \
  "$PROJECT_ROOT/SKILL.md" \
  "$PROJECT_ROOT/TESTING.md" \
  "$PROJECT_ROOT/VERSION" \
  "$PROJECT_ROOT/install.sh" \
  "$PACKAGE_ROOT/"

tar -czf "$ARCHIVE" -C "$PACKAGE_PARENT" ai-governance-kit
shasum -a 256 "$ARCHIVE" > "$CHECKSUM"

export AI_GOVERNANCE_ARCHIVE="$ARCHIVE"
export AI_GOVERNANCE_CHECKSUM="$CHECKSUM"
export AI_GOVERNANCE_DATA_DIR="$DATA_DIR"
export AI_GOVERNANCE_BIN_DIR="$BIN_DIR"
export AI_GOVERNANCE_CODEX_SKILL_DIR="$CODEX_DIR"
export AI_GOVERNANCE_CLAUDE_SKILL_DIR="$CLAUDE_DIR"

CONFLICT_ROOT="$TEST_ROOT/conflict"
mkdir -p "$CONFLICT_ROOT/codex/ai-governance"
if AI_GOVERNANCE_DATA_DIR="$CONFLICT_ROOT/data" \
  AI_GOVERNANCE_BIN_DIR="$CONFLICT_ROOT/bin" \
  AI_GOVERNANCE_CODEX_SKILL_DIR="$CONFLICT_ROOT/codex" \
  AI_GOVERNANCE_CLAUDE_SKILL_DIR="$CONFLICT_ROOT/claude" \
  sh "$PROJECT_ROOT/install.sh" > "$TEST_ROOT/conflict.log" 2>&1
then
  fail "installer accepted an unrelated existing skill directory"
fi
[ ! -e "$CONFLICT_ROOT/data" ] || fail "a failed preflight changed the installation directory"

install_output=$(sh "$PROJECT_ROOT/install.sh")
assert_contains "$install_output" "installed successfully"
[ -x "$BIN_DIR/ai-governance" ] || fail "CLI link was not installed"
[ -r "$CODEX_DIR/ai-governance/SKILL.md" ] || fail "Codex skill link is incomplete"
[ -r "$CLAUDE_DIR/ai-governance/SKILL.md" ] || fail "Claude skill link is incomplete"

status_output=$("$BIN_DIR/ai-governance" status)
assert_contains "$status_output" "AI Governance Kit v$CURRENT_VERSION"
assert_contains "$status_output" "Codex: installed"
assert_contains "$status_output" "Claude Code: installed"

doctor_output=$("$BIN_DIR/ai-governance" doctor)
assert_contains "$doctor_output" "Installation: healthy"

prompt_output=$("$BIN_DIR/ai-governance" prompt refactor folder src/payments)
assert_contains "$prompt_output" "refactor folder src/payments"

audit_file_output=$("$BIN_DIR/ai-governance" prompt audit file src/payments/service.ts)
assert_contains "$audit_file_output" "audit file src/payments/service.ts"

audit_folder_output=$("$BIN_DIR/ai-governance" prompt audit folder src/payments \
  --extensions ' TS, .tsx,ts ')
assert_contains "$audit_folder_output" "--extensions .ts,.tsx"

audit_project_output=$("$BIN_DIR/ai-governance" prompt audit project --extensions .ts,.json)
assert_contains "$audit_project_output" "audit project --extensions .ts,.json"

refactor_file_output=$("$BIN_DIR/ai-governance" prompt refactor file \
  src/payments/service.ts --extensions ts)
assert_contains "$refactor_file_output" "Run the matching audit first"

refactor_project_output=$("$BIN_DIR/ai-governance" prompt refactor project)
assert_contains "$refactor_project_output" "ask for approval before editing"

if "$BIN_DIR/ai-governance" prompt audit file \
  > "$TEST_ROOT/missing-audit-path.log" 2>&1
then
  fail "audit file accepted a missing path"
fi
if "$BIN_DIR/ai-governance" prompt audit project --extensions '.ts,' \
  > "$TEST_ROOT/empty-extension.log" 2>&1
then
  fail "extension parsing accepted an empty entry"
fi
if "$BIN_DIR/ai-governance" prompt audit project --extensions '.ts,/json' \
  > "$TEST_ROOT/invalid-extension.log" 2>&1
then
  fail "extension parsing accepted an invalid value"
fi
if "$BIN_DIR/ai-governance" prompt audit project --extensions '.' \
  > "$TEST_ROOT/dot-extension.log" 2>&1
then
  fail "extension parsing accepted a bare dot"
fi
if "$BIN_DIR/ai-governance" prompt audit project --unknown value \
  > "$TEST_ROOT/unknown-option.log" 2>&1
then
  fail "audit project accepted an unknown option"
fi

help_output=$("$BIN_DIR/ai-governance" help)
assert_contains "$help_output" "prompt audit file <path>"
assert_contains "$help_output" "prompt refactor file <path>"

rm -f "$CODEX_DIR/ai-governance"
ln -s "$DATA_DIR/missing" "$CODEX_DIR/ai-governance"
if "$BIN_DIR/ai-governance" doctor > "$TEST_ROOT/doctor-broken.log" 2>&1; then
  fail "doctor accepted a broken skill link"
fi
"$BIN_DIR/ai-governance" repair --target codex >/dev/null
[ -r "$CODEX_DIR/ai-governance/SKILL.md" ] || fail "repair did not restore the Codex link"

printf '%s\n' "$UPDATED_VERSION" > "$PACKAGE_ROOT/VERSION"
UPDATED_ARCHIVE="$TEST_ROOT/ai-governance-kit-$UPDATED_VERSION.tar.gz"
UPDATED_CHECKSUM="$TEST_ROOT/ai-governance-kit-$UPDATED_VERSION.tar.gz.sha256"
tar -czf "$UPDATED_ARCHIVE" -C "$PACKAGE_PARENT" ai-governance-kit
shasum -a 256 "$UPDATED_ARCHIVE" > "$UPDATED_CHECKSUM"
AI_GOVERNANCE_ARCHIVE="$UPDATED_ARCHIVE" \
  AI_GOVERNANCE_CHECKSUM="$UPDATED_CHECKSUM" \
  "$BIN_DIR/ai-governance" update >/dev/null

updated_status=$("$BIN_DIR/ai-governance" status)
assert_contains "$updated_status" "AI Governance Kit v$UPDATED_VERSION"
"$BIN_DIR/ai-governance" rollback >/dev/null
rolled_back_status=$("$BIN_DIR/ai-governance" status)
assert_contains "$rolled_back_status" "AI Governance Kit v$CURRENT_VERSION"

printf 'yes\n' | "$BIN_DIR/ai-governance" uninstall >/dev/null
[ ! -e "$DATA_DIR" ] || fail "uninstall left the managed data directory behind"
[ ! -e "$CODEX_DIR/ai-governance" ] || fail "uninstall left the Codex link behind"
[ ! -e "$CLAUDE_DIR/ai-governance" ] || fail "uninstall left the Claude link behind"

printf 'All installer and CLI checks passed.\n'
