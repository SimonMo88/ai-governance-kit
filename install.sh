#!/bin/sh

set -eu

REPOSITORY="${AI_GOVERNANCE_REPOSITORY:-SimonMo88/ai-governance-kit}"
DATA_DIR="${AI_GOVERNANCE_DATA_DIR:-${XDG_DATA_HOME:-$HOME/.local/share}/ai-governance-kit}"
BIN_DIR="${AI_GOVERNANCE_BIN_DIR:-$HOME/.local/bin}"
CODEX_SKILL_DIR="${AI_GOVERNANCE_CODEX_SKILL_DIR:-$HOME/.agents/skills}"
CLAUDE_SKILL_DIR="${AI_GOVERNANCE_CLAUDE_SKILL_DIR:-$HOME/.claude/skills}"
TARGET="${AI_GOVERNANCE_TARGET:-}"

say() {
  printf '%s\n' "$*"
}

fail() {
  printf 'AI Governance installer: %s\n' "$*" >&2
  exit 1
}

# Reject broad destinations because uninstall later removes this root recursively.
case "$DATA_DIR" in
  ""|/|"$HOME"|"$HOME/")
    fail "the installation directory is too broad"
    ;;
esac

usage() {
  cat <<'EOF'
Install AI Governance Kit.

Options:
  --target both     Install for Codex and Claude Code (default)
  --target codex    Install for Codex only
  --target claude   Install for Claude Code only
EOF
}

while [ "$#" -gt 0 ]; do
  case "$1" in
    --target)
      [ "$#" -ge 2 ] || fail "--target needs both, codex, or claude"
      TARGET=$2
      shift 2
      ;;
    -h|--help) usage; exit 0 ;;
    *) fail "unknown option '$1'" ;;
  esac
done

case "$TARGET" in
  "")
    if [ -r "$DATA_DIR/targets" ]; then
      TARGET=$(sed -n '1p' "$DATA_DIR/targets")
    else
      TARGET=both
    fi
    ;;
esac

case "$TARGET" in
  both|codex|claude) ;;
  *) fail "--target must be both, codex, or claude" ;;
esac

require_command() {
  command -v "$1" >/dev/null 2>&1 || fail "$1 is required"
}

safe_skill_link() {
  skill_dir=$1
  skill_link="$skill_dir/ai-governance"

  # Managed links may be refreshed, but real paths and unrelated links must
  # survive installation untouched.
  if [ -e "$skill_link" ] && [ ! -L "$skill_link" ]; then
    fail "$skill_link already exists and is not managed by this installer"
  fi
  if [ -L "$skill_link" ]; then
    existing_target=$(readlink "$skill_link" || true)
    case "$existing_target" in
      "$DATA_DIR"/*|"$DATA_DIR/current") ;;
      *) fail "$skill_link points to a different installation" ;;
    esac
  fi

  mkdir -p "$skill_dir"
  rm -f "$skill_link"
  ln -s "$DATA_DIR/current" "$skill_link"
}

check_managed_link_destination() {
  link_path=$1
  if [ -e "$link_path" ] && [ ! -L "$link_path" ]; then
    fail "$link_path already exists and is not managed by this installer"
  fi
  if [ -L "$link_path" ]; then
    existing_target=$(readlink "$link_path" || true)
    case "$existing_target" in
      "$DATA_DIR"/*|"$DATA_DIR/current") ;;
      *) fail "$link_path points to a different installation" ;;
    esac
  fi
}

# Complete every ownership preflight before downloading or changing any path.
check_managed_link_destination "$BIN_DIR/ai-governance"
case "$TARGET" in
  both)
    check_managed_link_destination "$CODEX_SKILL_DIR/ai-governance"
    check_managed_link_destination "$CLAUDE_SKILL_DIR/ai-governance"
    ;;
  codex) check_managed_link_destination "$CODEX_SKILL_DIR/ai-governance" ;;
  claude) check_managed_link_destination "$CLAUDE_SKILL_DIR/ai-governance" ;;
esac

require_command tar
require_command shasum

temporary_dir=$(mktemp -d "${TMPDIR:-/tmp}/ai-governance.XXXXXX")
trap 'rm -rf "$temporary_dir"' EXIT HUP INT TERM
archive_path="$temporary_dir/ai-governance-kit.tar.gz"
checksum_path="$temporary_dir/ai-governance-kit.tar.gz.sha256"

if [ -n "${AI_GOVERNANCE_ARCHIVE:-}" ]; then
  # Tests and offline installs may provide a trusted local archive explicitly.
  cp "$AI_GOVERNANCE_ARCHIVE" "$archive_path"
  if [ -n "${AI_GOVERNANCE_CHECKSUM:-}" ]; then
    cp "$AI_GOVERNANCE_CHECKSUM" "$checksum_path"
  fi
else
  require_command curl
  release_base="https://github.com/$REPOSITORY/releases/latest/download"
  say "Downloading the newest tested version..."
  curl -fsSL "$release_base/ai-governance-kit.tar.gz" -o "$archive_path"
  curl -fsSL "$release_base/ai-governance-kit.tar.gz.sha256" -o "$checksum_path"
fi

if [ -f "$checksum_path" ]; then
  expected_checksum=$(sed -n '1{s/[[:space:]].*//;p;}' "$checksum_path")
  actual_checksum=$(shasum -a 256 "$archive_path" | sed 's/[[:space:]].*//')
  [ "$expected_checksum" = "$actual_checksum" ] ||
    fail "the downloaded file did not pass its safety check"
fi

package_dir="$temporary_dir/package"
mkdir -p "$package_dir"
tar -xzf "$archive_path" -C "$package_dir" --strip-components=1

for required_file in \
  VERSION \
  SKILL.md \
  install.sh \
  bin/ai-governance \
  references/bootstrap.md \
  references/audit.md \
  references/audit-project.md \
  references/refactor-file.md
do
  [ -r "$package_dir/$required_file" ] || fail "the release is incomplete: missing $required_file"
done

version=$(sed -n '1p' "$package_dir/VERSION")
case "$version" in
  ''|*[!0-9A-Za-z.-]*) fail "the release has an invalid version" ;;
esac

versions_dir="$DATA_DIR/versions"
version_dir="$versions_dir/$version"
mkdir -p "$versions_dir"

if [ ! -d "$version_dir" ]; then
  # Populate a temporary version completely before its atomic move makes the
  # immutable version directory available to current and previous links.
  staged_version="$versions_dir/.installing-$version-$$"
  mv "$package_dir" "$staged_version"
  chmod +x "$staged_version/install.sh" "$staged_version/bin/ai-governance"
  mv "$staged_version" "$version_dir"
fi

for required_file in \
  VERSION \
  SKILL.md \
  install.sh \
  bin/ai-governance \
  references/bootstrap.md \
  references/audit.md \
  references/audit-project.md \
  references/refactor-file.md
do
  [ -r "$version_dir/$required_file" ] ||
    fail "the installed version is incomplete: missing $required_file"
done

# Preserve the displaced current version before atomically switching current.
if [ -L "$DATA_DIR/current" ]; then
  current_target=$(readlink "$DATA_DIR/current")
  if [ "$current_target" != "$version_dir" ]; then
    rm -f "$DATA_DIR/previous"
    ln -s "$current_target" "$DATA_DIR/previous"
  fi
elif [ -e "$DATA_DIR/current" ]; then
  fail "$DATA_DIR/current exists and is not a managed link"
fi

new_current="$DATA_DIR/.current-$$"
ln -s "$version_dir" "$new_current"
rm -f "$DATA_DIR/current"
mv "$new_current" "$DATA_DIR/current"

mkdir -p "$BIN_DIR"
cli_link="$BIN_DIR/ai-governance"
rm -f "$cli_link"
ln -s "$DATA_DIR/current/bin/ai-governance" "$cli_link"

case "$TARGET" in
  both)
    safe_skill_link "$CODEX_SKILL_DIR"
    safe_skill_link "$CLAUDE_SKILL_DIR"
    ;;
  codex) safe_skill_link "$CODEX_SKILL_DIR" ;;
  claude) safe_skill_link "$CLAUDE_SKILL_DIR" ;;
esac

printf '%s\n' "$TARGET" > "$DATA_DIR/targets"

say ""
say "AI Governance Kit v$version installed successfully."
say "Terminal command: $cli_link"
say ""
say "Next steps:"
say "  ai-governance status"
say "  ai-governance doctor"
say ""
say 'Then open a project in Codex or Claude and ask: /ai-governance bootstrap'
