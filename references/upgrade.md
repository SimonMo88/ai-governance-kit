# Upgrade existing governance

Use this mode when agent instructions or engineering authorities already exist.
An upgrade is a merge and clarification exercise, not a template overwrite.

Before editing active governance, create and verify the pre-change version
required by `versioning-and-revert.md`.

## Establish the baseline

Inventory:

- all root and scoped agent-instruction files;
- the authorities they reference;
- duplicated, contradictory, stale, or unreachable guidance;
- active enforcement and verification commands;
- local exceptions and the code or automation that depends on them;
- repository-specific rules that must remain local.

Map which document owns each directive before changing filenames, moving policy,
or deleting duplication.

## Compare by capability

Assess whether the existing setup provides:

- concise root routing;
- smallest-relevant-context guidance;
- engineering quality and change hygiene;
- testing ownership and honest verification reporting;
- security and trust-boundary rules;
- current architecture and dependency ownership;
- explicit product and operational invariants;
- scoped instructions near frontend, backend, data, integrations, or other owned
  areas;
- executable enforcement for high-value rules;
- a documented exception process;
- safe folder-scoped refactoring instructions.

Do not normalize filenames or wording when the existing structure already serves
the capability clearly.

## Merge safely

- Preserve stronger existing rules.
- Resolve contradictions in favor of the repository's approved authority and the
  user's current instruction.
- Move duplicated policy into one owner and replace copies with links.
- Keep product and stack specifics in the adopting repository; neutrality applies
  to this distributable kit, not to a project's own accurate documentation.
- Keep historical reports separate from current authority.
- Never delete an old instruction until its callers, links, automation, and unique
  directives have been accounted for.
- Record intentional deviations from the kit as local decisions, not template
  defects.

## Prove the upgrade

Check links, paths, command names, scope discovery, and unresolved placeholders.
Run governance-specific checks followed by the repository's complete gate. Report
the previous and new authority map, preserved local rules, removed duplication,
unenforced policy, the version that can restore the prior governance, and any
follow-up that requires owner judgment.
