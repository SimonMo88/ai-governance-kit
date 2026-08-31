# Refactor a folder under repository governance

Use this mode only when the user supplies or clearly identifies a target folder.
Resolve its exact path before editing.

## Scope contract

- Recursively inspect every eligible source, test, and maintained documentation
  file in the target folder.
- “Refactor all files” means review every eligible file and improve every
  justified finding. It does not require a cosmetic edit to a healthy file.
- Exclude generated output, vendored dependencies, caches, build artifacts,
  binaries, snapshots, lockfiles, recorded data, and migrations unless the user
  explicitly includes them or repository authority requires them.
- Do not edit outside the target folder by default. If a correct boundary change
  requires moving code or updating consumers, public exports, tests, schemas, or
  configuration elsewhere, identify the exact expansion and obtain authorization
  before making it.
- Do not commit unless requested.

## Load applicable authority

Read, in order:

1. root and ancestor `AGENTS.md` files;
2. the repository's context router;
3. engineering-quality and domain-structure authorities;
4. product or operational invariants;
5. testing requirements;
6. security policy when any trust boundary is involved;
7. the nearest scoped instructions and owner documentation.

Repository-specific rules override generic examples in this kit. A child scope
may strengthen but must not weaken parent rules.

## Establish a baseline

Before editing:

- record worktree state so unrelated edits remain distinguishable;
- inventory eligible files, public entry points, inbound and outbound imports,
  tests, and focused validation commands;
- run the smallest useful baseline checks when practical;
- identify observable behavior, public contracts, persisted formats, and
  compatibility requirements that must remain stable;
- classify findings by responsibility rather than applying mechanical style
  changes.

Do not treat a passing test count as proof that boundaries, concurrency,
authorization, accessibility, failure behavior, or durable integrity are safe.

## Refactor in cohesive batches

Prioritize meaningful improvements:

- clarify names, control flow, and complex decisions;
- separate mixed responsibilities at real domain or architectural boundaries;
- keep business decisions out of interface, transport, persistence, and external
  adapters;
- reduce private cross-domain imports and expose deliberate public interfaces;
- validate untrusted input and handle expected failures explicitly;
- remove dead code and misleading abstractions after confirming they are unused;
- add or update focused tests for changed behavior and extracted rules;
- update maintained documentation when ownership or contracts change.

Keep behavior stable unless the user explicitly requested a behavioral change.
Do not compress code, split files arbitrarily, create generic dumping grounds, or
introduce abstractions merely to satisfy metrics.

After each batch, format only changed files and run focused checks. Review the
diff before continuing so later batches do not hide regressions.

## Completion criteria

The folder refactor is complete only when:

- every eligible file was reviewed;
- every material in-scope finding was fixed or explicitly reported with a reason;
- public behavior, contracts, data formats, and required history were preserved;
- focused checks pass;
- the complete repository gate passes, or its precise external or pre-existing
  blocker is reported;
- no unrelated file was modified;
- the final report lists reviewed files, changed files, validation, remaining
  risks, and any out-of-scope boundary work.
