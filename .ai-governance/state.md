# Active AI governance state

- Kit version: `<KIT_VERSION>`
- Current governance operation: `<OPERATION_IDENTIFIER>`
- Rollback version for current governance: `<VERSION_IDENTIFIER>`
- Last operation: `<BOOTSTRAP_UPGRADE_OR_REVERT>`
- Last reviewed on: `<UTC_DATE>`
- Local governance owner: `<OWNER_OR_TEAM>`

## Owner-selected line-length policy

- Maximum line length: `<CHARACTER_COUNT>`
- Enforcement mode: `<STRICT_OR_LOOSE>`
- Documentation treatment: `<INCLUDED_OR_OMITTED>`
- Approved exceptions: `<PATHS_CONTENT_TYPES_OR_NONE>`

## Owner-selected file-length policy

- Maximum lines in one maintained file: `<FILE_LINE_COUNT>`
- Included files: `<MAINTAINED_FILE_TYPES_OR_PATHS>`
- Excluded machine-owned files: `<GENERATED_VENDORED_LOCK_SNAPSHOT_OR_NONE>`
- Approved exceptions: `<PATHS_WITH_OWNER_RATIONALE_AND_REVIEW_CONDITION_OR_NONE>`

## Authority map

- Root agent instructions: `<PATH>`
- Context router: `<PATH>`
- Engineering quality: `<PATH>`
- Testing and verification: `<PATH>`
- Security and data handling: `<PATH>`
- Current architecture: `<PATH>`
- Product and operational invariants: `<PATH>`
- Scoped authorities: `<PATHS_OR_NOT_APPLICABLE>`

## Verification contract

- Format changed files: `<COMMAND>`
- Static analysis: `<COMMAND>`
- Focused tests: `<COMMANDS>`
- Governance checks: `<COMMANDS_OR_NOT_APPLICABLE>`
- Complete repository gate: `<COMMAND>`

## History

Append each bootstrap, upgrade, enforcement change, or revert with its version
identifier, rescue version when applicable, material changes, preserved local
decisions, validation, and unresolved gaps.

Executable coverage, adopted commands, manual-review rules, and drift evidence
belong in `enforcement.md`; do not report prose policy as executable enforcement.

- `2026-08-31T14-26-19Z-multiline-documentation-blocks`: upgraded
  `ENGINEERING_QUALITY.md` to require vertical block-style documentation while
  preserving native line-oriented documentation. The immutable pre-change
  version with the same identifier is the rollback version. No stack-specific
  checker was added because adopting repositories own executable enforcement.

- `2026-08-31T14-30-48Z-line-length-policy`: upgraded bootstrap and upgrade
  workflows to require an explicit owner decision about maximum line length,
  strict or loose enforcement, and whether documentation is included or omitted.
  The immutable pre-change version with the same identifier is the rollback
  version. No enforcement tooling was changed.
