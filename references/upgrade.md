# Upgrade existing governance

Use this mode when agent instructions or engineering authorities already exist.
An upgrade is a merge and clarification exercise, not a template overwrite.

## Reconfirm line and file length policies

Inspect the repository's current formatter, linter, editor, and written
line-length and file-size settings. Present what is currently configured, then
ask the four length questions required by `SKILL.md` and wait for the user's
answers.
Give concrete 80-, 100-, and 120-character examples, explain strict versus loose
behavior with a representative passing and over-limit line, and ask whether
documentation files, documentation comments, and docstrings are included or
omitted. Present 300, 500, and 1,000 lines as illustrative maximum file lengths,
explain how over-limit files should be split or excepted, and identify the
treatment of machine-owned files. Never treat an existing setting as renewed
owner approval.

Update the engineering authority and `.ai-governance/state.md` with the selected
character maximum, file-line maximum, enforcement mode, documentation treatment,
file exclusions, and exception process. Update
`.ai-governance/enforcement.md` with the current executable or manual coverage.
If the selected policy is not enforced, report the gap; the upgrade does not
authorize changing enforcement tooling.

Before editing active governance, create and verify the pre-change version
required by `versioning-and-revert.md`.

## Keep local governance history out of Git

Ensure the adopting repository's root `.gitignore` ignores
`/.ai-governance/`. If the root `.gitignore` is absent, create it. If an
existing effective rule already ignores the root `.ai-governance` folder, keep
that rule and do not add a duplicate. Otherwise append the root-anchored
`/.ai-governance/` rule while preserving the file's existing content and line
ending style.

Treat the root `.gitignore` as an affected governance file for the pre-change
version. Verify the result with Git's ignore checking when Git is available;
otherwise inspect the final root rule directly and report that limitation.

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
Confirm the character-limit and file-line-limit decisions agree across the
engineering authority, state, and enforcement record.
Confirm the root `.gitignore` exists and ignores `/.ai-governance/` without a
duplicate rule.
Run governance-specific checks followed by the repository's complete gate. Report
the previous and new authority map, preserved local rules, removed duplication,
unenforced policy, the version that can restore the prior governance, and any
follow-up that requires owner judgment.

An upgrade does not authorize enforcement changes. Report discovered executable
coverage and drift, then ask: **Governance instructions are upgraded. Would you
like to assess and improve executable enforcement now?** Run
`assess-enforcement.md` only when the user explicitly accepts that separate
action.
