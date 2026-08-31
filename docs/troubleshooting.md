# Troubleshooting

Start with:

```bash
ai-governance doctor
```

The command only inspects the installation. It reports missing files, broken
agent connections, conflicting installations, and permission problems.

## The command cannot be found

Make sure `~/.local/bin` is included in the shell path, then open a new terminal.

## The skill does not appear

Restart Codex or Claude Code after a new installation. Then use the agent's
skill-list command to confirm that `ai-governance` is available.

## A different installation already exists

The installer will not replace it. Inspect the reported path and remove or move
it only when you are certain it is no longer needed.

## An update causes a problem

Restore the preceding version:

```bash
ai-governance rollback
```
