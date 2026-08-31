# AI repository governance kit

This directory is a stack-neutral set of instructions for AI coding agents and
human contributors. It defines how work should be understood, implemented,
reviewed, and verified without assuming a language, framework, package manager,
repository layout, deployment platform, frontend, or backend.

It can be used in three ways:

- introduce AI governance to an existing repository;
- upgrade and consolidate an existing governance setup;
- ask an AI agent to refactor a specified folder under the adopted quality and
  domain rules.

The kit is intentionally Markdown-only. An adopting repository owns its actual
commands and enforcement tools. This keeps the governance portable while making
the repository, rather than the template, authoritative about how it builds and
tests.

## Contents

- `AGENTS.md`: concise root instructions and authority ordering.
- `AI_CONTEXT.md`: routes tasks to the smallest relevant context set.
- `ENGINEERING_QUALITY.md`: stack-neutral coding and maintainability rules.
- `TESTING.md`: behavior-oriented test and verification policy.
- `SECURITY.md`: trust-boundary and data-handling requirements.
- `docs/architecture.md`: template for current system boundaries and ownership.
- `docs/product-invariants.md`: template for non-negotiable product behavior.
- `scopes/frontend/AGENTS.md`: optional frontend-specific instructions.
- `scopes/backend/AGENTS.md`: optional backend-specific instructions.
- `ADOPTION.md`: installation and customization checklist.
- `.ai-governance/`: copyable repository-local history, rollback versions, local
  authorities, commands, and active-state structure.
- `SKILL.md`: repeatable AI entry point for bootstrap, upgrade, and folder
  refactoring workflows.
- `references/`: detailed workflow instructions loaded only for the selected
  mode.

## Design principles

1. The root agent file routes to authorities instead of duplicating them.
2. Universal policy is separated from product and architectural facts.
3. Scoped instructions live near the code they govern.
4. Every required verification command is declared by the adopting repository.
5. Prose rules should be backed by automated enforcement when practical.
6. Local instructions may strengthen parent rules but may not weaken them.

## What adopters must supply

The kit contains placeholders in angle brackets, such as
`<FULL_VERIFICATION_COMMAND>`. Replace every placeholder before declaring the
kit active.

At minimum, define:

- the repository's formatting, static-analysis, test, and build commands;
- the locations of frontend, backend, shared, generated, and excluded code;
- the system's architectural ownership boundaries;
- its non-negotiable product or operational invariants;
- any framework, language, accessibility, data, or deployment authorities.

Do not copy product facts, package names, paths, commands, or exceptions from
the source repository that produced this kit.

## AI usage

Install or expose this directory as an AI skill, then request one of these
outcomes in natural language:

```text
Use ai-governance to introduce AI governance to this repository.
Use ai-governance to upgrade the existing governance in this repository.
Use ai-governance to refactor <folder> under its code-quality and domain rules.
```

The folder workflow is deliberately bounded. It reviews every eligible file but
does not force edits into healthy files or silently expand into the rest of the
repository.

Every bootstrap or upgrade first creates an immutable, checksummed snapshot of
the affected existing governance under `.ai-governance/versions/`. Reverting a
version first snapshots the current governance, so both the upgrade and its
reversal are recoverable without touching application code.
