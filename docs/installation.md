# Installation and updates

## Simple installation

The installer supports macOS and Linux. It installs the kit for both Codex and
Claude Code by default.

```bash
curl -fsSL https://github.com/SimonMo88/ai-governance-kit/releases/latest/download/install.sh | sh
```

Install for only one agent when needed:

```bash
# Install for Codex only.
curl -fsSL https://github.com/SimonMo88/ai-governance-kit/releases/latest/download/install.sh | sh -s -- --target codex

# Install for Claude Code only.
curl -fsSL https://github.com/SimonMo88/ai-governance-kit/releases/latest/download/install.sh | sh -s -- --target claude
```

The installer keeps versioned copies under
`~/.local/share/ai-governance-kit`, adds the terminal command under
`~/.local/bin`, and connects the selected agents to the current version. It
stops rather than replacing a file or installation it does not own.

If `~/.local/bin` is not on the shell path, add it using the instructions for
your shell and restart the terminal.

## Manual installation

People who prefer Git can use one shared checkout:

```bash
git clone git@github.com:SimonMo88/ai-governance-kit.git ~/ai-governance-kit
mkdir -p ~/.claude/skills ~/.agents/skills
ln -s ~/ai-governance-kit ~/.claude/skills/ai-governance
ln -s ~/ai-governance-kit ~/.agents/skills/ai-governance
```

Update that checkout with:

```bash
git -C ~/ai-governance-kit pull --ff-only
```

The managed terminal commands do not update a manual installation.

## Windows

The one-command installer does not yet support Windows. Clone or download this
repository, then connect the folder to the skill directory used by the chosen
agent. Keep the whole repository together because `SKILL.md` uses the templates
and workflow files beside it.

## ChatGPT web and mobile

This repository is a local skill. ChatGPT web and mobile require a plugin rather
than this local installation.
