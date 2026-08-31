# Adoption guide

For AI-driven adoption, use the bootstrap or upgrade mode in `SKILL.md`. This
guide defines the shared installation outcome.

Before changing existing governance, follow
`references/versioning-and-revert.md`: copy `.ai-governance/` into the adopting
repository, snapshot every affected governance file, record absent files, and
verify the snapshot manifest and digests.

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

## 5. Document actual ownership and invariants

Replace `docs/architecture.md` with the system's current boundaries and dependency
direction. Replace `docs/product-invariants.md` with approved, testable truths.
Plans, desired architecture, and future features must not be presented as current
authority.

## 6. Add executable enforcement

Convert high-value prose rules into the stack's native enforcement mechanisms
where practical, such as formatters, linters, compilers, architecture tests,
schema validation, policy tests, hooks, or CI jobs.

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
