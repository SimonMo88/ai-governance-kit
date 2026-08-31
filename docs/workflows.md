# Ways to use the kit

Run these workflows in Codex with `$ai-governance` or in Claude Code with
`/ai-governance`.

## Bootstrap

Adds project-specific AI guidance to a repository that does not have it. The
agent inspects the project and asks the owner to make required choices before
editing files.

## Upgrade

Improves existing AI guidance while preserving stronger local rules and current
project decisions. It creates a recoverable governance snapshot first.

## Assess enforcement

Shows which written rules are checked automatically and which still depend on
human review. It does not add or replace checks without separate approval.

## Audit a file, folder, or project

Audits inventory eligible project-owned files, report measured and AI-reviewed
findings, list exclusions, and preview cohesive refactor batches without changing
application source. Use an optional comma-separated `--extensions` filter to
limit target files. JSON is always listed as excluded rather than audited or
refactored.

Project audits first check active governance for unresolved placeholders. When a
decision is required, the agent previews the affected Markdown updates and asks
for approval before recording the user's answers. Governance-write approval is
separate from source-refactor approval.

## Refactor a folder

Runs the matching folder audit, presents its proposed batches, and asks for
refactor and batch-commit preferences before making justified improvements under
the project's own rules. It does not silently expand into the whole repository.

## Refactor the project

Runs the governance preflight and project audit, then asks for refactor and
batch-commit preferences. Approved work proceeds in manageable ownership groups.
Dependencies, JSON, generated files, caches, and build output are excluded. If
the work cannot be finished responsibly in one run, the agent reports exactly
what remains.
