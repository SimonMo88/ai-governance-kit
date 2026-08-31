#!/bin/sh

set -eu

PROJECT_ROOT=$(CDPATH= cd -- "$(dirname "$0")/.." && pwd)

for relative_path in \
  assets/ai-governance-kit-banner.jpg \
  docs/installation.md \
  docs/commands.md \
  docs/workflows.md \
  docs/troubleshooting.md \
  ADOPTION.md
do
  [ -e "$PROJECT_ROOT/$relative_path" ] || {
    printf 'Missing README target: %s\n' "$relative_path" >&2
    exit 1
  }
done

for relative_path in \
  references/manage-installation.md \
  references/bootstrap.md \
  references/upgrade.md \
  references/assess-enforcement.md \
  references/refactor-folder.md \
  references/refactor-project.md
do
  [ -e "$PROJECT_ROOT/$relative_path" ] || {
    printf 'Missing SKILL target: %s\n' "$relative_path" >&2
    exit 1
  }
done

printf 'All documented file links exist.\n'
