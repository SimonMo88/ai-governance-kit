---
name: ai-governance
description: Introduce or upgrade stack-neutral AI governance, explicitly assess and improve executable governance enforcement, or refactor a folder or repository against its local authorities.
---

# AI governance

Use the mode implied by the request:

- **Bootstrap** introduces AI governance to an existing project. Read
  [references/bootstrap.md](references/bootstrap.md).
- **Upgrade** improves an existing governance setup. Read
  [references/upgrade.md](references/upgrade.md).
- **Assess and improve enforcement** inventories executable verification,
  explains coverage, and offers separately approved improvements. Read
  [references/assess-enforcement.md](references/assess-enforcement.md).
- **Refactor folder** reviews and refactors a user-specified folder. Read
  [references/refactor-folder.md](references/refactor-folder.md).
- **Refactor project** reviews and refactors all eligible project-owned files in
  the repository. Read
  [references/refactor-project.md](references/refactor-project.md).

If the request combines modes, bootstrap or upgrade governance before using it
to refactor code.

Before every bootstrap or upgrade, read and follow
[references/versioning-and-revert.md](references/versioning-and-revert.md). Use
the same reference when the user asks to list, inspect, or revert governance
versions.

## Shared constraints

- Treat the target repository as authoritative about its product, architecture,
  stack, commands, and existing instructions.
- Preserve unrelated changes and existing local policy unless the user explicitly
  authorizes replacing it.
- Inspect before editing. Distinguish current behavior from plans, examples,
  generated output, and historical notes.
- Do not invent verification commands, architectural boundaries, product
  invariants, or enforcement that does not exist.
- Make authorization boundaries visible. A governance request does not authorize
  dependency upgrades, production changes, destructive cleanup, commits, or
  external mutations unless they were also requested.
- Report what changed, what was verified, what remains uncertain, and any policy
  that is documented but not executable.
- Never bootstrap or upgrade active governance until its affected existing files
  have been captured and verified under `.ai-governance/versions/`.
- Bootstrap and upgrade never add, change, replace, or remove enforcement. End
  them by reporting its status and offering the separate assessment action.

The stack-neutral template files are stored beside this skill. Adapt them to the
target repository; do not copy placeholders into an active governance setup.
