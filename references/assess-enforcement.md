# Assess and improve governance enforcement

Use this mode only when the user explicitly asks to assess or improve executable
governance enforcement. Bootstrap and upgrade may offer it, but must not start it
automatically.

## Communication contract

Lead every assessment, choice, warning, preview, approval request, and result
with simple language in the user's chosen human language when supported. Keep
commands, paths, and tool identifiers exact. For each recommendation explain,
before technical detail:

1. the concrete outcome;
2. why it matters and who benefits;
3. what workflow or files change;
4. runtime, dependency, maintenance, strictness, and migration costs;
5. the gap that remains if declined and whether manual review is reasonable.

Be persuasive about verified benefits without pressure or exaggerated coverage.

## Read-only discovery

Discovery and preview are read-only. Inspect the repository's own package,
build, workspace, and task definitions; formatter, analyzer, compiler, test,
audit, packaging, hook, staged-file, CI, release, and custom-check configuration;
root and scoped AI instructions; engineering, testing, security, architecture,
and product authorities; baselines, exclusions, exceptions, owners, and expiry
rules; and documented commands. Confirm referenced commands exist where safe.

Use the repository's architectural vocabulary. Do not assume a language,
framework, runtime, package manager, application shape, or directory layout.
Inspect capabilities rather than preferred tool names:

- formatting;
- static analysis, linting, type checking, or compilation;
- focused tests and applicable contract or integration tests;
- production build or packaging;
- dependency and security auditing;
- documentation quality;
- structural and architecture-boundary checks;
- staged or changed-file verification;
- CI enforcement;
- the complete repository verification gate.

Compare live evidence with `.ai-governance/enforcement.md` when it exists. Alert
the user to existing tooling before proposing anything. Detect disappeared or
changed commands, expired exceptions, policy without an executable check, and
checks present locally but absent from CI or present in CI but unavailable
locally.

## Coverage scorecard

Before proposing edits, show every capability as **Covered**, **Partial**,
**Missing**, **Not applicable**, **Manual review**, or **Blocked**. For each one
show the existing command or tool, adopted rule supported, where it runs
(developer workflow, pre-commit, CI, release, or manual review), evidence and
confidence, gap or overlap, and whether remediation adds, modifies, replaces, or
removes anything. Never hide important gaps behind one percentage and never call
a documented rule enforced without an executable check.

## Capability-by-capability choices

Default to **keep existing tooling and fill selected gaps**. Let the user select
individual capabilities and, for each, choose preserve, update in place, add a
complementary check, replace, record for manual review, or cancel. Offer
replacement only for an explicit conflict, obsolescence, or user preference.
Preserve effective and stronger baselines, public command names, and existing
callers by default.

Do not add a runtime or package manager solely for governance. Before any
dependency choice, disclose maintenance, security, licensing, runtime, and
lockfile impact. Prefer project-native checks and compose them without duplicate
work. Baselines cover reviewed existing debt only; exceptions require an owner,
precise scope, rationale, and review or expiry condition.

## Mandatory dry run and approval

Dry run is the default and mandatory. Before writing, show:

- every file to create, modify, move, or remove, with readable diffs or an
  equivalent preview;
- every command, hook, CI job, dependency, and command-order change;
- checks and local rules that remain unchanged;
- purpose, developer and CI impact, runtime cost, conflicts, uncertainty, and
  manual follow-up for each change;
- the governance version that will restore every affected file.

Ask for explicit approval of the selected plan. A preview is not approval.
Replacement or removal needs separate explicit confirmation naming the exact
target and consequence. Cancel or declined choices leave the repository
unchanged.

## Apply, version, and verify

After approval, follow `versioning-and-revert.md` before editing. Snapshot every
affected instruction, verification program, configuration, hook, CI file, and
capability record; record new files as absent; verify snapshot digests. Restrict
rollback to that approved manifest, preview restoration, create a rescue
snapshot, and preserve unrelated changes.

Apply only approved capability choices. Then:

1. validate changed configuration and focused checker tests;
2. run each newly integrated native command independently;
3. run the composed complete gate;
4. confirm local and CI entry points invoke intended checks without duplication;
5. rerun discovery and compare it with the approved scorecard;
6. update `.ai-governance/enforcement.md` with selections, adopted commands,
   manual rules, exclusions, replacements, evidence, and the verified map;
7. report passed, failed, blocked, manual, and unverified capabilities
   separately.

Claim enforcement as active only when the check executes successfully, or name
the sole environmental blocker precisely. Rerunning against unchanged policy
and tooling must propose no edits; any later difference is drift to explain, not
an automatic overwrite.

## Behavioral coverage to test

When changing this workflow, exercise fixtures or realistic forward tests for:
no tooling; a strong unchanged baseline; partial and overlapping coverage;
selective approval and total decline; conflict and replacement; missing
documented commands; local/CI divergence; dependency acceptance and rejection;
blocked verification; unsupported ecosystems resolving safely to manual review;
idempotent reruns; later drift; and rollback while unrelated changes exist.
Include Java, Python, Go, .NET, JavaScript, mixed-language, and repositories that
do not use frontend/backend boundaries. Distinguish instruction-level forward
tests from deterministic executable tests.
