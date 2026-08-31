# Bootstrap governance in an existing project

Use this mode when a project has no coherent AI instructions or the user asks to
introduce AI-assisted development.

## Confirm line and file length policies

After inspecting existing formatter, linter, editor, and file-size settings, ask
the four length questions required by `SKILL.md` and wait for the user's answers.
Show concrete 80-, 100-, and 120-character examples, explain strict versus loose
behavior with a representative passing and over-limit line, and ask whether
documentation files, documentation comments, and docstrings are included or
omitted. Present 300, 500, and 1,000 lines as illustrative maximum file lengths,
explain how an over-limit file should be split or excepted, and identify the
treatment of machine-owned files. Do not choose defaults on the user's behalf.

Record the selected character maximum, file-line maximum, enforcement mode,
documentation treatment, file exclusions, and exception process in the
engineering authority and `.ai-governance/state.md`. Record whether current
tooling actually enforces each selection in `.ai-governance/enforcement.md`.

Before editing active governance, create and verify the pre-change version
required by `versioning-and-revert.md`. Record would-be new files as absent.

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

## Discover the repository

Inspect read-only before editing:

- existing agent instructions, contributor guidance, coding standards, security
  policy, test documentation, and architecture notes;
- repository roots, applications, services, packages, libraries, and generated
  areas;
- build, format, static-analysis, test, audit, and release commands defined by
  the project;
- automation and enforcement in hooks, CI, linters, compilers, tests, policy
  tools, and build configuration;
- current architectural ownership and dependency direction;
- product, data, security, compatibility, and operational invariants supported
  by code, tests, schemas, or approved documentation.

Do not infer current capability from a roadmap, example, mock, schema, route, or
passing test count alone.

## Introduce the authority structure

Merge the kit with existing documentation rather than creating duplicate
authorities. The desired shape is:

```text
root AGENTS.md
  -> context router
  -> engineering quality
  -> testing and verification
  -> security and data handling
  -> current architecture
  -> product and operational invariants
  -> scoped AGENTS.md files near owned code
```

Use the fewest files that keep ownership clear. An existing authority may retain
its established filename if the root router links to it unambiguously.

Customize frontend and backend scopes only when those boundaries exist. Use the
repository's actual architectural vocabulary when it uses different boundaries.

## Connect policy to execution

Declare only commands that exist and run successfully or whose environmental
requirements are documented. Identify prose rules that have no automated
enforcement and label them as review requirements rather than presenting them as
gates.

Prefer the stack's existing native mechanisms. Do not add dependencies or replace
working tools merely to imitate the source kit.

Bootstrap does not authorize enforcement changes. Report discovered executable
coverage and gaps, then ask: **Governance instructions are installed. Would you
like to assess and improve executable enforcement now?** Run
`assess-enforcement.md` only when the user explicitly accepts that separate
action.

## Validate adoption

- Search the adopted files for unresolved placeholders and source-project terms.
- Check every link and referenced path.
- Confirm scoped instructions are discoverable from the code they govern.
- Run focused governance checks and the repository's complete verification gate.
- If no complete gate exists, document that gap and the independent commands
  actually run.
- Summarize newly authoritative rules separately from recommendations or future
  enforcement work.
- Confirm `.ai-governance/state.md` points to the pre-change version and records
  the resulting authority map.
- Confirm the root `.gitignore` exists and ignores `/.ai-governance/` without a
  duplicate rule.
- Confirm the selected character limit, file-line limit, strict or loose mode,
  documentation treatment, file exclusions, and exception process agree across
  the engineering authority, state, and enforcement record.
