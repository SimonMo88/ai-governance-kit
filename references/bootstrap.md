# Bootstrap governance in an existing project

Use this mode when a project has no coherent AI instructions or the user asks to
introduce AI-assisted development.

Before editing active governance, create and verify the pre-change version
required by `versioning-and-revert.md`. Record would-be new files as absent.

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
