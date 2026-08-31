# Governance version manifest

- Version identifier: `2026-08-31T14-26-19Z-multiline-documentation-blocks`
- Created at: `2026-08-31T14:26:19Z`
- Reason: add a stack-neutral rule requiring vertical documentation blocks
- Mode: upgrade
- Active governance version superseded: unresolved template placeholder

## Governed files

- `ENGINEERING_QUALITY.md`: present; SHA-256 `1ec909808b78e2fa32c1a5acf88f1da6ed907dff2d7cc25d6f8ec48cf733b5e7`
- `.ai-governance/state.md`: present; SHA-256 `c6dbb9056d068bcfe4424d51053cc1fc87c223ed3c283fb93e0b8c8fccfaa1c2`

## Pre-existing worktree changes

- `.ai-governance/state.md` had uncommitted changes before this version. Its exact
  current content was captured before the task appended a history entry.
- Other pre-existing changes were excluded because this upgrade does not modify
  them: `.ai-governance/README.md`, `.ai-governance/enforcement.md`, `ADOPTION.md`,
  `README.md`, `SKILL.md`, `assets/`, `references/assess-enforcement.md`,
  `references/bootstrap.md`, `references/upgrade.md`, and
  `references/versioning-and-revert.md`.

## Scope exclusions and limitations

- This version does not modify application code or add a stack-specific checker.
- The kit remains stack-neutral and Markdown-only; adopting repositories own the
  formatter, linter, or checker that enforces this rule.
- The active-version fields in `.ai-governance/state.md` remain unresolved kit
  placeholders and are not replaced with repository-specific facts.
