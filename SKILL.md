---
name: ai-governance
description: Manage AI Governance Kit, introduce or upgrade governance, assess enforcement, or refactor code under local authorities.
---

# AI governance

Use the mode implied by the request:

- **Manage installation** checks, updates, repairs, rolls back, or removes this
  installed skill. Read
  [references/manage-installation.md](references/manage-installation.md).
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

Recognize `status`, `doctor`, `update`, `rollback`, `repair`, and `uninstall` as
installation-management requests. Recognize `refactor folder <path>` and
`refactor project` as the bounded refactoring modes above. If the user requests
only `refactor`, ask whether they mean one folder or the entire repository before
editing files.

## Required line and file length decisions

Before every bootstrap or upgrade, inspect any existing formatter, linter, and
editor settings and any file-size checks, then ask the user these two questions
and wait for both answers:

1. What is the maximum number of lines allowed in a code file? Present 300, 500,
   and 1,000 lines as illustrative choices rather than defaults.
2. What is the maximum number of characters allowed on a line of code? Present
   80, 100, and 120 characters as illustrative choices rather than defaults.

Both selected limits are strict. The agent must follow them during implementation
and verification even when the repository has no automated check. An applicable
code file or code line over its limit must be corrected or covered by an explicit
repository exception. Documentation files, documentation comments, docstrings,
generated files, vendored code, lockfiles, snapshots, and other machine-owned
content are excluded from both limits automatically.

Use concrete examples when presenting the choices. With a 100-character limit,
an applicable 101-character code line fails verification. With a 500-line
limit, an applicable 501-line code file is over the limit.

For the file limit, explain that a selected maximum of 500 lines makes a
501-line maintained file over the limit. The right response is a meaningful
split or an approved exception, never compressed or less-readable code.

Always ask both questions even when the repository already has configured
values. Present the discovered settings as context rather than treating them as
renewed owner approval. Record the answers and automatic exclusions in the
engineering authority and `.ai-governance/state.md`, and record the actual
executable coverage in
`.ai-governance/enforcement.md`.

Before every bootstrap, upgrade, or approved enforcement change, read and follow
[references/versioning-and-revert.md](references/versioning-and-revert.md). Use
the same reference when the user asks to list, inspect, or revert governance
versions.

Every bootstrap and upgrade must keep its local governance history out of source
control. Ensure the adopting repository's root `.gitignore` ignores
`/.ai-governance/`. Create the root `.gitignore` when it does not exist, and do
not add a duplicate rule when an existing rule already ignores that root folder.

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
