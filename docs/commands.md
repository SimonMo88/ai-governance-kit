# Terminal commands

The terminal command manages the installed kit. It does not edit a project.

## `ai-governance status`

Shows the installed version, agent connections, and whether a newer release is
available. It does not change anything.

## `ai-governance doctor`

Checks that the required files are present, Codex and Claude Code point to the
installation, and the installation can be updated. It explains problems but
does not repair them.

## `ai-governance update`

Downloads and verifies the newest release. It keeps the preceding version so it
can be restored.

## `ai-governance rollback`

Returns to the version used immediately before the latest update.

## `ai-governance repair`

Repairs one agent connection after `doctor` reports a problem:

```bash
ai-governance repair --target codex
ai-governance repair --target claude
```

It will not replace a real file or directory belonging to another installation.

## `ai-governance uninstall`

Shows what it will remove and asks for confirmation. It removes only the managed
installation and managed agent connections. It does not change projects.

## `ai-governance prompt`

Prints a prompt that can be copied into Codex or Claude:

```bash
ai-governance prompt bootstrap
ai-governance prompt upgrade
ai-governance prompt assess enforcement
ai-governance prompt refactor folder src/payments
ai-governance prompt refactor project
```
