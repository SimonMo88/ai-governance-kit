# Repository working agreements

These instructions apply throughout the repository. A more deeply nested
`AGENTS.md` may add rules for its directory but must not weaken these rules.

## Authorities

- [`AI_CONTEXT.md`](./AI_CONTEXT.md) routes agents to the smallest applicable
  authority and source set.
- [`ENGINEERING_QUALITY.md`](./ENGINEERING_QUALITY.md) defines engineering
  quality and maintainability requirements.
- [`TESTING.md`](./TESTING.md) defines test strategy and required verification.
- [`SECURITY.md`](./SECURITY.md) defines security and data-handling requirements.
- [`docs/architecture.md`](./docs/architecture.md) defines current ownership,
  boundaries, and dependency direction.
- [`docs/product-invariants.md`](./docs/product-invariants.md) defines behavior
  that changes must preserve.

Before changing a subsystem, read its nearest `AGENTS.md` and every authority it
explicitly requires.

Before any implementation change, read `ENGINEERING_QUALITY.md`,
`docs/product-invariants.md`, and `TESTING.md`. Read `SECURITY.md` whenever work
touches a trust boundary, authentication, authorization, secrets, personal or
sensitive data, files, imports, external systems, dependencies, or durable
history.

## Working rules

- Preserve unrelated worktree changes. Modify and stage only files belonging to
  the current task.
- Inspect existing behavior and ownership before proposing or implementing a
  change.
- Write code a competent maintainer can understand and safely modify without
  asking its author.
- Keep changes cohesive. Split mixed responsibilities into independently
  reviewable batches.
- Use the repository's established naming, formatting, and commit conventions.
- Do not bypass required quality checks or weaken tests to obtain a passing run.
- Add an exception to a rule only through the repository's documented exception
  process, with an owner, rationale, scope, and review or expiry condition.
- Format only files changed by the task using `<FORMAT_CHANGED_FILES_COMMAND>`.
- Run focused validation while working.
- Run `<STAGED_VERIFICATION_COMMAND>` before a commit when staged verification
  exists.
- Run `<FULL_VERIFICATION_COMMAND>` before calling the overall change complete.
- Report commands that were run, failures, environmental limits, and remaining
  uncertainty precisely. A narrower check does not prove the full gate passed.

## Change boundaries

- Read-only requests do not authorize edits, commits, external messages, or
  changes to remote systems.
- Diagnosis does not authorize implementation unless the request includes a
  fix.
- Do not perform destructive operations, apply production changes, or mutate
  external data without explicit authorization.
- Never commit secrets, credentials, private data, generated artifacts, or local
  environment state unless the repository explicitly defines them as source.
