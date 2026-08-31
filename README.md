# AI repository governance kit

This directory is a stack-neutral set of instructions for AI coding agents and
human contributors. It defines how work should be understood, implemented,
reviewed, and verified without assuming a language, framework, package manager,
repository layout, deployment platform, frontend, or backend.

It can be used in four ways:

- introduce AI governance to an existing repository;
- upgrade and consolidate an existing governance setup;
- ask an AI agent to refactor a specified folder under the adopted quality and
  domain rules;
- ask an AI agent to review and refactor the whole repository under those rules.

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
- `SKILL.md`: repeatable AI entry point for bootstrap, upgrade, folder
  refactoring, and whole-project refactoring workflows.
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

## Install as an AI skill

Keep this repository together when installing it. `SKILL.md` loads the files in
`references/` and uses the Markdown templates at the repository root; copying
only `SKILL.md` produces an incomplete skill.

The simplest personal installation uses one checkout and symlinks it into each
agent's skill directory:

```bash
git clone git@github.com:SimonMo88/ai-governance-kit.git ~/ai-governance-kit
mkdir -p ~/.claude/skills ~/.agents/skills
ln -s ~/ai-governance-kit ~/.claude/skills/ai-governance
ln -s ~/ai-governance-kit ~/.agents/skills/ai-governance
```

If the repository is already cloned, point the symlinks at that existing
checkout instead. The commands deliberately fail when a destination already
exists; inspect the existing installation before replacing it.

To update both agents later, update the shared checkout:

```bash
git -C ~/ai-governance-kit pull --ff-only
```

### Claude Code

Claude Code discovers personal skills at
`~/.claude/skills/<skill-name>/SKILL.md`. The personal symlink above makes the
kit available in every project. For a project-only installation, expose the
checkout inside that repository instead:

```bash
mkdir -p .claude/skills
ln -s /absolute/path/to/ai-governance-kit .claude/skills/ai-governance
```

Claude Code enables a discovered skill by default. If the top-level skills
directory was created after the current session started, restart Claude Code.
Then run `/skills` to confirm that `ai-governance` is listed and invoke it with
`/ai-governance`, or make a natural-language request that matches its
description. See Anthropic's
[Claude Code skills documentation](https://code.claude.com/docs/en/skills) for
the current discovery and enablement behavior.

Claude.ai Cowork and cloud sessions do not read `~/.claude/skills` from the
local machine. To use the kit there, upload and enable it for the Claude.ai
account from **Customize > Skills**, or commit a project-scoped copy under
`.claude/skills/ai-governance/` for Claude cloud sessions.

### ChatGPT and Codex

ChatGPT desktop and Codex use the same standalone skill format. Codex discovers
personal skills at `~/.agents/skills/<skill-name>/SKILL.md`, so the personal
symlink above keeps the existing Codex workflow available in every repository.
For a repository-only installation, expose the checkout from that repository:

```bash
mkdir -p .agents/skills
ln -s /absolute/path/to/ai-governance-kit .agents/skills/ai-governance
```

Local skills are enabled when discovered. In the ChatGPT desktop app, open
**Skills** in the sidebar and select `@ai-governance`. In Codex, run `/skills`
to confirm discovery and mention `$ai-governance` explicitly, or make a request
that matches the skill description. Codex normally detects changes
automatically; restart it if a new installation does not appear. See OpenAI's
[skills documentation](https://learn.chatgpt.com/docs/build-skills) for the
current ChatGPT and Codex behavior.

A local standalone skill is not installed into ChatGPT on the web or mobile.
Those surfaces require the skill to be distributed as a
[plugin](https://learn.chatgpt.com/docs/plugins). The repository is currently a
standalone skill, not a plugin package.

### Use the skill

After the relevant agent lists the skill, request one of these outcomes in
natural language:

```text
Use ai-governance to introduce AI governance to this repository.
Use ai-governance to upgrade the existing governance in this repository.
Use ai-governance to refactor <folder> under its code-quality and domain rules.
Use ai-governance to refactor this entire repository under its engineering-quality and domain rules. Review every eligible project-owned source, test, configuration, script, and maintained documentation file; make only justified behavior-preserving improvements; preserve public contracts and unrelated changes; validate in cohesive stages; and report remaining findings and validation limits accurately.
```

The folder workflow is deliberately bounded to the named folder. It reviews
every eligible file there but does not force edits into healthy files or silently
expand into the rest of the repository.

The whole-project workflow is also bounded: it builds a finite inventory of
project-owned files, excludes dependencies and generated, vendored, cached, and
build output, then works through cohesive ownership areas with focused
validation. “Entire repository” means every eligible file is reviewed, not that
every file must be changed. If the repository cannot be responsibly completed in
one run, the agent must identify exactly what was reviewed and what remains
instead of claiming completion.

Every bootstrap or upgrade first creates an immutable, checksummed snapshot of
the affected existing governance under `.ai-governance/versions/`. Reverting a
version first snapshots the current governance, so both the upgrade and its
reversal are recoverable without touching application code.
