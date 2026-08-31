# Governance enforcement record

This record supports repeatable assessment and drift detection. The repository's
live configuration and authorities remain authoritative.

- Last assessment: `<UTC_TIMESTAMP>`
- Migration mode: `<PRESERVE_ADD_UPDATE_REPLACE_MANUAL_OR_NONE>`
- Selected capabilities: `<CAPABILITIES_OR_NONE>`
- Last rollback version: `<VERSION_IDENTIFIER_OR_NONE>`
- User language: `<LANGUAGE>`

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
