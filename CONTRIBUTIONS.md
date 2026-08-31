# Contributing

Thank you for helping improve the AI Governance Kit. Contributions should keep
the kit stack-neutral, understandable on its own, and safe to adapt into an
existing repository.

## Before making a change

Read the authorities that apply to the work:

- `AGENTS.md` for repository-wide working agreements;
- `AI_CONTEXT.md` for the smallest relevant source set;
- `ENGINEERING_QUALITY.md` for maintainability requirements;
- `TESTING.md` for verification and reporting expectations;
- `SECURITY.md` when the change affects a trust boundary, external system,
  dependency, sensitive data, or durable history;
- `docs/architecture.md` and `docs/product-invariants.md` for the boundaries and
  behavior the kit must preserve.

Open an issue or discussion before starting a change that would alter the kit's
authority structure, supported workflows, versioning contract, or adoption
model. Small corrections and focused clarifications can go directly to a pull
request.

## Contribution principles

- Keep guidance independent of languages, frameworks, package managers,
  hosting platforms, products, and organizations.
- Preserve the adopting repository as the authority for its architecture,
  commands, invariants, exceptions, and enforcement.
- Do not replace placeholders with source-repository facts. Placeholders are
  intentional until an adopter supplies its own approved values.
- Keep root instructions concise and route detailed policy to the document that
  owns it instead of duplicating directives.
- Add a rule only when its owner, scope, purpose, and verification expectations
  are clear.
- Keep bootstrap and upgrade work separate from executable-enforcement changes.
- Preserve stronger local policy when changing workflows that merge this kit
  into an existing repository.
- Prefer focused changes that can be reviewed and reverted independently.

## Making a change

1. Inspect the current owner of the behavior or guidance before editing it.
2. Update every directly affected reference, link, example, and workflow.
3. Keep examples clearly distinguishable from active policy.
4. Check that new instructions do not contradict a parent authority or weaken a
   repository working agreement.
5. Review the diff for product-specific assumptions, invented commands, stale
   paths, unresolved links, and unrelated edits.
6. Run the narrowest relevant checks available, then the repository's complete
   verification command when one is defined.

This repository is intentionally Markdown-only and does not currently define an
executable full-repository gate. Do not describe a manual review as an automated
passing check. Report exactly what was inspected and any validation that could
not be performed.

## Pull requests

Keep each pull request cohesive. Its description should explain:

- the problem being solved and the intended outcome;
- which authority or workflow owns the change;
- any compatibility, adoption, security, or rollback implications;
- the validation performed, including exact commands where applicable;
- remaining uncertainty, unenforced policy, or follow-up decisions.

Before requesting review, confirm that:

- links and repository-relative paths resolve;
- placeholders remain intentional and internally consistent;
- examples are stack-neutral and cannot be mistaken for repository facts;
- changed workflows agree with `SKILL.md` and their files in `references/`;
- no credentials, private data, generated artifacts, or local environment state
  are included;
- unrelated worktree changes are excluded.

Do not create a commit, release, production change, or external-system mutation
as part of a contribution unless that action was explicitly authorized.

## Security reports

Do not disclose credentials, private data, exploit details, or production
records in a public issue or pull request. Follow the private reporting channel
configured by the adopting repository. The placeholder in `SECURITY.md` must be
replaced before this kit is treated as active repository policy.
