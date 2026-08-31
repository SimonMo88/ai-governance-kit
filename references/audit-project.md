# Audit an entire project

Use this mode only for a repository-wide audit. Read and follow
[audit.md](audit.md), then complete the governance preflight below before
measuring compliance or proposing refactor batches.

## Governance placeholder preflight

Inspect active root and scoped agent instructions, the context router,
engineering quality, testing, security, architecture, product invariants,
`.ai-governance/state.md`, `.ai-governance/enforcement.md`, and applicable owner
documentation for unresolved decisions.

Classify known tokens such as `<MAX_LINE_LENGTH>`, `<MAX_FILE_LINES>`,
`<FORMAT_CHANGED_FILES_COMMAND>`, and `<FULL_VERIFICATION_COMMAND>` as definite
placeholder candidates. Treat `TODO`, `TBD`, `REPLACE_ME`, and arbitrary angle
brackets as possible candidates that require contextual confirmation. Exclude
clearly labelled examples, kit templates, generated documentation, vendored
content, and immutable governance history from active-policy findings.

Block only when a confirmed active gap can affect scope, exclusions, limits,
architecture, invariants, security, ownership, exceptions, or validation. List
non-blocking gaps with the reason they do not affect the audit.

For every blocker, show its file, location, effect, requested user decision,
files that would change, and proposed interpretation. Do not use the user's
answer as implicit write approval. Ask whether to apply the presented governance
answers and continue.

After approval, read and follow
[versioning-and-revert.md](versioning-and-revert.md), capture the affected active
governance, update the authoritative Markdown plus `.ai-governance/state.md` and
`.ai-governance/enforcement.md` where applicable, show the changes, and re-scan.
Continue only after every blocker is supplied, confirmed not applicable,
confirmed non-active, or resolved by another authority.

Governance-write approval does not authorize application refactoring. Ask for
refactor approval only after the completed project audit and batch preview.

## Project coverage

Inventory the complete eligible repository and group it by ownership, domain,
feature, or architectural boundary. Calculate mechanical measurements across
the complete eligible inventory. Review in bounded groups and list exact
completed and remaining groups when full AI review cannot be completed safely.
