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
editor settings and any file-size checks, then ask the user all four questions
below and wait for their answers:

1. What maximum number of characters should one line contain? Give examples such
   as 80 characters for compact code, 100 for a balanced limit, and 120 for
   wider codebases.
2. Should the character limit be strict or loose? Explain that strict means an
   applicable line over the limit fails the configured check unless it matches
   an explicit repository exception, while loose means the limit is a
   readability target and a justified longer line does not fail verification
   solely because of length.
3. Should documentation be included in the character count or omitted? Explain
   that inclusion covers maintained documentation files, documentation comments,
   and docstrings, while omission exempts all three from the limit.
4. What maximum number of lines should one maintained file contain? Present 300,
   500, and 1,000 lines as illustrative choices rather than defaults. Explain
   that files over the selected maximum must be split around meaningful
   responsibilities or covered by a documented repository exception. Generated,
   vendored, lock, snapshot, and other machine-owned files need an explicit
   inclusion or exclusion decision.

Use a concrete example when presenting the choices. With a 100-character limit,
strict mode rejects an applicable 101-character code line; loose mode treats the
same line as a review decision and permits it when wrapping would reduce
readability. If documentation is included, a 101-character maintained Markdown
or docstring line receives the same treatment; if omitted, that documentation
line is not evaluated against the limit.

For the file limit, explain that a selected maximum of 500 lines makes a
501-line maintained file over the limit. The right response is a meaningful
split or an approved exception, never compressed or less-readable code.

Always ask even when the repository already has a configured value. Present the
discovered setting as context rather than treating it as renewed owner approval.
Record the answers in the engineering authority and `.ai-governance/state.md`,
and record the actual executable or manual coverage in
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
