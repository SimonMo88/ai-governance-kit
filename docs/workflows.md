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

## Refactor a folder

Reviews eligible files in one named folder and makes justified improvements
under the project's own rules. It does not silently expand into the whole
repository.

## Refactor the project

Reviews every eligible project-owned file in manageable groups. Dependencies,
generated files, caches, and build output are excluded. If the work cannot be
finished responsibly in one run, the agent reports exactly what remains.
