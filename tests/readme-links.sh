#!/bin/sh

set -eu

PROJECT_ROOT=$(CDPATH= cd -- "$(dirname "$0")/.." && pwd)

for relative_path in \
  assets/ai-governance-kit-banner.jpg \
  docs/installation.md \
  docs/commands.md \
  docs/workflows.md \
  docs/troubleshooting.md \
  docs/releasing.md \
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

for workflow_file in \
  SKILL.md \
  ADOPTION.md \
  references/bootstrap.md \
  references/upgrade.md
do
  grep -Fq '/.ai-governance/' "$PROJECT_ROOT/$workflow_file" || {
    printf 'Missing root .ai-governance ignore rule: %s\n' "$workflow_file" >&2
    exit 1
  }
done

grep -Fq 'root `.gitignore`' "$PROJECT_ROOT/references/versioning-and-revert.md" || {
  printf 'Versioning workflow does not include the root .gitignore.\n' >&2
  exit 1
}

printf 'All documented file links exist.\n'
