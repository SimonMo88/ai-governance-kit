# Governance enforcement record

This record supports repeatable assessment and drift detection. The repository's
live configuration and authorities remain authoritative.

- Last assessment: `<UTC_TIMESTAMP>`
- Migration mode: `<PRESERVE_ADD_UPDATE_REPLACE_MANUAL_OR_NONE>`
- Selected capabilities: `<CAPABILITIES_OR_NONE>`
- Last rollback version: `<VERSION_IDENTIFIER_OR_NONE>`
- User language: `<LANGUAGE>`

## Line-length coverage

- Selected maximum: `<CHARACTER_COUNT>`
- Selected mode: `<STRICT_OR_LOOSE>`
- Documentation treatment: `<INCLUDED_OR_OMITTED>`
- Enforcing or advisory mechanism: `<COMMAND_TOOL_MANUAL_REVIEW_OR_NONE>`
- Gate or review location: `<PATH_COMMAND_OR_NONE>`
- Explicit exclusions: `<PATHS_CONTENT_TYPES_OR_NONE>`
- Last verified: `<UTC_TIMESTAMP_OR_NOT_VERIFIED>`

For strict mode, record evidence that an applicable over-limit line fails the
named check and that the check runs in the promised gate. For loose mode, record
where the target is communicated or reviewed and do not describe it as a failing
gate. Apply the recorded documentation inclusion or omission consistently.

## File-length coverage

- Selected maximum: `<FILE_LINE_COUNT>`
- Included files: `<MAINTAINED_FILE_TYPES_OR_PATHS>`
- Excluded machine-owned files: `<GENERATED_VENDORED_LOCK_SNAPSHOT_OR_NONE>`
- Enforcing or advisory mechanism: `<COMMAND_TOOL_MANUAL_REVIEW_OR_NONE>`
- Gate or review location: `<PATH_COMMAND_OR_NONE>`
- Approved exceptions: `<PATHS_WITH_OWNER_RATIONALE_AND_REVIEW_CONDITION_OR_NONE>`
- Last verified: `<UTC_TIMESTAMP_OR_NOT_VERIFIED>`

Record evidence when an over-limit eligible file fails a named check. When the
limit is review-only, describe it as manual coverage rather than a failing gate.

## Capability map

For each applicable capability, record its state, adopted command or manual
review, where it runs, governing authority, evidence, confidence, and last
successful verification. Use repository-relative paths and exact command names.

## Intentional decisions

Record exclusions, manual-review rules, approved replacements, and exceptions.
Every exception needs an owner, precise scope, rationale, and review or expiry
condition.

## Drift comparison

On reassessment, compare live evidence with this record. Report disappeared or
changed commands, checks no longer invoked by CI, expired exceptions, and
adopted rules no longer represented in the complete gate. An unchanged
repository should require no edits.
