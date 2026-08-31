# Refactor one file under repository governance

Use this mode only when the user identifies one file. Resolve its exact path,
read [audit-file.md](audit-file.md), and run that audit before editing.

Present the audit identifier and proposed batches, then ask whether the user
authorizes the refactor and whether successful batches should be committed. Do
not edit until refactor approval is explicit. Revalidate the audited worktree
before the first write.

Keep changes inside the file by default. If a correct change requires an
extraction or updates to consumers, exports, tests, schemas, configuration, or
another extension, identify the exact expansion and obtain approval first.

Preserve observable behavior and public contracts unless the user explicitly
authorizes a change. Format and run focused checks after each approved batch,
then run the repository's required final verification or report its precise
blocker. Follow the audit's selected commit behavior and never include unrelated
worktree changes.
