# Shared audit contract

Use this contract for every file, folder, and project audit. An audit measures
and reviews a resolved scope, reports exclusions and uncertainty, and previews a
governed refactor. It does not authorize application-source changes.

## Resolve the request

Resolve the exact file, folder, or repository root before inspecting it. Accept
an optional `--extensions` argument containing comma-separated extensions:

```text
--extensions .ts,.tsx
```

Normalize missing leading dots, surrounding whitespace, case where the
filesystem permits it, and duplicates. Reject empty or malformed entries. When
the option is omitted, inspect every otherwise eligible file type.

Files matching the normalized extensions are **target files**. A file outside
the filter may be read as **context only** when it is necessary to understand a
target, but list it separately and do not change it without scope-expansion
approval.

## Inventory eligible files

Use tracked and intentionally maintained files, repository manifests, ignore
rules, and documented ownership. Do not use an unrestricted filesystem walk.
Record the worktree state before running checks so unrelated and later changes
remain distinguishable.

Exclude dependencies, vendored code, generated code and documentation, caches,
build and coverage output, binaries, snapshots, lockfiles, recorded data, data
exports, local environment state, and other machine-owned content. Exclude
migrations unless repository authority requires their inspection.

Exclude every JSON file from audit statistics, line and file limits,
maintainability findings, and refactor plans. List its path, filesystem size when
safe to obtain, and `JSON excluded by policy`. Do not load large JSON. A small,
recognized project manifest may be read narrowly to discover project structure
or commands, but it remains excluded from findings and refactoring.

If `--extensions` includes `.json`, report it as ignored. If no eligible
extension remains, stop with a clear excluded result and do not imply that an
audit ran.

Do not load secrets, populated environment files, credentials, private keys,
tokens, private exports, or other content excluded by the repository's security
policy. For a potentially sensitive finding, report only path, location,
measurement, and a redaction notice.

## Load authority and establish measurements

Read applicable agent instructions, the repository context router, engineering
quality, architecture, product invariants, testing, security when relevant, and
the nearest owner documentation. Repository authority overrides this generic
contract.

Discover line and file limits, exceptions, ownership boundaries, and real
format, analysis, test, build, staged-verification, and complete-gate commands.
If required policy is unresolved, report it instead of inventing a value.

Run baseline checks only when their non-writing behavior is understood. Never
run a formatter in write mode during an audit. Compare worktree state before and
after checks, report skipped checks and their reason, and never delete generated
artifacts without authorization. A skipped or partial check is not passing
evidence.

## Required report

Give the audit a lightweight identifier derived from its scope, normalized
extension filter, relevant worktree state, and governance state. Use the same
identifier when asking for refactor approval.

Every report contains these sections, using `None found` or `Not assessed` when
appropriate rather than silently omitting one:

1. scope, normalized extensions, and audit identifier;
2. governance preflight;
3. target inventory;
4. read-only context files;
5. exclusions and reasons;
6. measured statistics;
7. tool-reported findings;
8. AI-reviewed findings;
9. findings needing confirmation;
10. unassessed areas and coverage limits;
11. proposed refactor batches;
12. risks and requested scope expansion;
13. validation plan;
14. refactor approval status;
15. commit preference.

Report discovered, eligible, context, and excluded file counts; counts by
extension and ownership area; reliable physical, code, comment, and blank line
counts; largest eligible files; governed file and line violations; thresholds
and their sources; exceptions; test distribution; public entry points; inbound,
outbound, and cross-boundary dependencies; reliably established cycles; real
validation commands; and observed baseline failures.

Review responsibility, naming, control flow, validation, failure handling,
retries, boundary violations, dead-code candidates, unused exports, debug and
commented-out code, TODOs, misleading abstractions, meaningful duplication,
test gaps, and stale ownership documentation. Metrics are evidence, not an
instruction to compress code or split it without a meaningful boundary.

Label each result as **Measured**, **Tool-reported**, **AI-reviewed**, **Needs
confirmation**, **Not assessed**, or **Excluded**. Never present AI judgement as
an exact measurement.

For a large project, calculate mechanical statistics over the complete eligible
inventory, group review by ownership or domain, and state exactly which groups
were and were not reviewed. Never imply complete review from partial coverage.

## Refactor preview and approvals

Build cohesive proposed batches. For each batch list its priority, risk,
confidence, findings, intended changes, expected changed and new files,
contracts to preserve, tests and validation, dependencies, deferred findings,
and any scope expansion.

After the report, ask separately:

1. whether the user authorizes the proposed refactor for this audit identifier;
2. whether each successfully completed refactor batch should be committed.

Questions, silence, governance clarification, or approval of one batch do not
authorize other source changes. Approval covers only the audited scope,
normalized extensions, named batches, and relevant worktree state.

When a later refactor begins, compare the live worktree and governance with the
audited state. Refresh affected findings after relevant drift and request new
approval if the plan materially changes. Never silently add paths, extensions,
or batches.

If batch commits are requested, format and validate the batch, stage only its
task-owned files or hunks, run staged verification when defined, commit it with
a focused message, and verify the commit contents before continuing. Do not
commit a failing or inseparable batch, create empty commits, use broad staging,
amend, squash, push, or open a pull request without separate authorization.

If batch commits are declined, complete and validate approved batches but leave
all changes uncommitted. Give the user a suggested commit breakdown at the end.

Governance placeholder changes are never silently included in a source-refactor
commit. Ask whether to commit them as a separate governance batch or leave them
uncommitted.
