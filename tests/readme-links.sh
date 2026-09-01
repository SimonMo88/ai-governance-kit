#!/bin/sh

set -eu

PROJECT_ROOT=$(CDPATH= cd -- "$(dirname "$0")/.." && pwd)

# These are user-facing navigation targets promised by the root README.
for relative_path in \
  assets/ai-governance-kit-banner.jpg \
  assets/governance-chaos.png \
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

# Skill routing depends on every workflow reference remaining installable.
for relative_path in \
  references/manage-installation.md \
  references/bootstrap.md \
  references/upgrade.md \
  references/assess-enforcement.md \
  references/audit.md \
  references/audit-file.md \
  references/audit-folder.md \
  references/audit-project.md \
  references/refactor-file.md \
  references/refactor-folder.md \
  references/refactor-project.md
do
  [ -e "$PROJECT_ROOT/$relative_path" ] || {
    printf 'Missing SKILL target: %s\n' "$relative_path" >&2
    exit 1
  }
done

# Bootstrap and upgrade must all preserve local governance history consistently.
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

grep -Fq 'JSON excluded by policy' "$PROJECT_ROOT/references/audit.md" || {
  printf 'Audit workflow does not preserve the JSON exclusion.\n' >&2
  exit 1
}

grep -Fq 'whether to apply' "$PROJECT_ROOT/references/audit-project.md" || {
  printf 'Project audit does not require governance-write approval.\n' >&2
  exit 1
}

for refactor_workflow in \
  references/refactor-file.md \
  references/refactor-folder.md \
  references/refactor-project.md
do
  grep -Fq 'audit before editing' "$PROJECT_ROOT/$refactor_workflow" || {
    printf 'Refactor workflow does not require an audit: %s\n' \
      "$refactor_workflow" >&2
    exit 1
  }
done

grep -Fq 'whether each successfully completed refactor batch should be committed' \
  "$PROJECT_ROOT/references/audit.md" || {
    printf 'Audit workflow does not ask for the batch-commit preference.\n' >&2
    exit 1
  }

printf 'All documented file links exist.\n'
