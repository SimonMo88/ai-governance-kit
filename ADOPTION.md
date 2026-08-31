# Adoption guide

For AI-driven adoption, use the bootstrap or upgrade mode in `SKILL.md`. This
guide defines the shared installation outcome.

Before changing existing governance, follow
`references/versioning-and-revert.md`: copy `.ai-governance/` into the adopting
repository, snapshot every affected governance file, record absent files, and
verify the snapshot manifest and digests.

Before bootstrap or upgrade edits begin, the adopter must answer:

1. the maximum characters in one line, with 80, 100, and 120 presented as
   illustrative choices rather than defaults;
2. whether enforcement is strict or loose, after seeing examples of how each
   mode treats a line over the character limit;
3. whether documentation files, documentation comments, and docstrings are
   included in or omitted from the character limit; and
4. the maximum lines in one maintained file, with 300, 500, and 1,000 presented
   as illustrative choices rather than defaults, plus the treatment of
   generated, vendored, lock, snapshot, and other machine-owned files.

The agent must inspect and disclose existing settings, ask all four questions,
and wait. Existing configuration is evidence, not permission to skip the choice.

## 1. Copy the universal authorities

Copy the root Markdown files and `docs/` templates into the adopting repository.
Merge with existing authorities instead of overwriting them.

## 2. Add only the scopes that exist

Place the frontend and backend `AGENTS.md` templates at the roots of the code they
govern. Rename neither file. Repositories with multiple applications or services
may use multiple scoped files, each strengthened with local ownership rules.

Delete a scope that does not exist. Do not invent a frontend/backend split when
the repository uses a different architecture.

## 3. Remove source-specific information

Search the copied kit for:

```text
<
>
TODO
example
```

Review every hit. Replace placeholders with repository facts and remove examples
that could be mistaken for active policy.

Also search for names belonging to the source product, organization, packages,
frameworks, services, providers, commands, directory layout, and deployment
environment. The finished kit must contain none of them.

## 4. Declare the verification contract

Map the repository's real commands for:

- formatting changed files;
- static analysis and type or compile checks;
- focused frontend and backend tests where applicable;
- contract and end-to-end tests where applicable;
- production build or packaging;
- dependency and security auditing;
- staged verification where supported;
- the complete repository gate.

If the repository lacks an important check, record that as an adoption gap. Do
not claim a command exists or a rule is enforced when it is only aspirational.

For strict line length, identify the exact check and gate that fail on an
applicable over-limit line. For loose line length, record the formatter,
review-time guidance, or manual check without claiming a hard gate. Apply the
user's documentation inclusion or omission consistently.

For maximum file length, identify the exact check or review that counts lines in
eligible maintained files. Do not claim a hard gate when the limit is checked
only during review. Record included files, excluded machine-owned files, and the
documented exception process.

## 5. Document actual ownership and invariants

Replace `docs/architecture.md` with the system's current boundaries and dependency
direction. Replace `docs/product-invariants.md` with approved, testable truths.
Plans, desired architecture, and future features must not be presented as current
authority.

## 6. Assess executable enforcement separately

Bootstrap and upgrade stop after reporting enforcement coverage and offering the
separate **Assess and improve governance enforcement** action. They do not add or
change tooling automatically. The separate action begins with a read-only
scorecard and mandatory dry run; the adopter selects individual gaps and must
approve exact changes before any write.

Reuse effective native checks by default. Convert selected high-value prose
rules into the stack's native enforcement mechanisms where practical, such as
formatters, analyzers, compilers, architecture tests, schema validation, policy
tests, hooks, or CI jobs. Record the adopted capability map and drift evidence in
`.ai-governance/enforcement.md`.

Keep each rule aligned with its enforcement:

```text
Policy -> checker -> focused checker tests -> verification gate
```

Document time-bounded exceptions with an owner, precise rationale, affected
scope, and review or expiry condition.

## 7. Validate the governance kit

Ask a reviewer unfamiliar with the source repository to verify that:

- no product, organization, framework, or stack assumption remains;
- every link resolves;
- every active command exists;
- scoped instructions are located where agents will discover them;
- parent and child instructions do not contradict one another;
- current architecture and future plans are clearly distinguished;
- the full verification command exercises the promised checks.

## 8. Version changes deliberately

Treat governance as maintained source. Review changes, record material decisions,
and update instructions when architecture or tooling changes. Never allow copied
templates to silently override repository-owned policy.

Complete `.ai-governance/state.md` in the adopting repository. Use that record
during upgrades to compare capabilities, locate immutable pre-change versions,
and preserve local decisions. It is provenance, not a mechanism for the template
to own local policy.
