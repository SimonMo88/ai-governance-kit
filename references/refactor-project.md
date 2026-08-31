# Refactor an entire project under repository governance

Use this mode only when the user clearly requests a whole-project or
repository-wide refactor. Resolve the repository root before editing. If the
requested scope is a folder rather than the whole repository, use
[refactor-folder.md](refactor-folder.md).

## Scope contract

- Recursively inventory and review every eligible project-owned source, test,
  configuration, script, and maintained documentation file in the repository.
- “Refactor the entire repository” means complete review coverage and justified
  improvements wherever material findings exist. It does not require changing a
  healthy file, normalizing every file, or mechanically rewriting the project.
- Follow repository-declared exclusions. By default, exclude dependency trees,
  generated code and documentation, vendored code, caches, build and coverage
  output, binaries, snapshots, lockfiles, recorded data, migrations, and local
  environment state. Inspect one only when repository authority or a concrete
  finding makes it necessary; do not edit generated or third-party content as if
  it were project-owned source.
- Preserve observable behavior, public interfaces, import paths, serialized and
  persisted formats, schemas, command-line contracts, configuration contracts,
  and compatibility requirements unless the user explicitly authorizes a
  breaking or behavioral change.
- Preserve unrelated worktree changes. Do not commit, upgrade dependencies,
  perform destructive cleanup, change production state, or mutate external
  systems unless separately authorized.

## Load applicable authority

Read, in order:

1. root and applicable nested `AGENTS.md` files;
2. the repository's context router;
3. engineering-quality and domain-structure authorities;
4. product and operational invariants;
5. testing and verification requirements;
6. security policy for every relevant trust boundary;
7. owner documentation for each major scope.

Repository-specific rules override generic examples in this kit. A child scope
may strengthen but must not weaken parent rules. If active governance still
contains unresolved placeholders or lacks enough authority to judge a scope,
report that gap instead of inventing policy.

## Establish a repository baseline

Before editing:

- record worktree state so pre-existing and unrelated changes remain
  distinguishable;
- identify tracked and intentionally maintained files using repository manifests,
  ignore rules, and documented ownership rather than an unrestricted filesystem
  walk;
- group eligible files by owner, domain, feature, or architectural boundary;
- identify public entry points, cross-boundary dependencies, tests, generated
  sources of truth, and focused validation commands for each group;
- run the smallest useful baseline checks when practical and record pre-existing
  failures;
- identify the observable behavior, public contracts, durable formats, and
  compatibility requirements that must remain stable;
- classify concrete findings by severity and responsibility rather than applying
  mechanical style changes.

Do not claim that every file was reviewed unless the inventory supports that
claim. Do not treat a passing test count as proof that boundaries, concurrency,
authorization, accessibility, failure behavior, or durable integrity are safe.

## Refactor in bounded stages

Create a finite worklist from the inventory and process one cohesive ownership
area at a time. Prioritize meaningful improvements:

- clarify names, control flow, and complex decisions;
- separate mixed responsibilities at real domain or architectural boundaries;
- keep business decisions out of interface, transport, persistence, and external
  adapters;
- reduce private cross-domain imports and expose deliberate public interfaces;
- validate untrusted input and handle expected failures explicitly;
- remove dead code and misleading abstractions only after confirming they are
  unused;
- add or update focused tests for changed behavior and extracted rules;
- update maintained configuration and documentation when ownership or contracts
  change.

Keep behavior stable unless the user explicitly requested otherwise. Do not
compress code, split files arbitrarily, create generic dumping grounds, apply
speculative abstractions, or run an indiscriminate formatter across the
repository merely to create changes.

After each stage:

1. format only files changed in that stage;
2. run its focused static analysis and tests;
3. review the diff for contract changes and unrelated edits;
4. record fixed findings, deferred findings, and validation results before
   proceeding.

If the repository is too large to review responsibly in the available run,
finish the current coherent stage and report exact completed and remaining
inventory groups. Do not imply whole-project completion or trade validation
depth for superficial file coverage.

## Completion criteria

The project refactor is complete only when:

- every eligible inventory group and file was reviewed;
- every material in-scope finding was fixed or explicitly reported with a
  reason;
- public behavior, contracts, data formats, and required history were preserved;
- focused checks passed after each changed stage;
- staged verification passed when the repository defines it;
- the complete repository gate passed, or its precise environmental or
  pre-existing blocker was reported;
- no unrelated file was modified.

The final report must list the inventory method and exclusions, reviewed and
changed areas, material improvements, focused and repository-wide validation,
pre-existing failures, deferred findings, remaining risks, and any scope that
could not be reviewed. A partial check or incomplete inventory must never be
reported as a complete whole-project refactor.
