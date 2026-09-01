# Manage the installed skill

Use this mode for `status`, `doctor`, `update`, `rollback`, `repair`, and
`uninstall` requests about AI Governance Kit itself. These actions manage the
skill installation, not the user's project.

## Status and doctor

Run `ai-governance status` or `ai-governance doctor` when the managed terminal
command is available. Both are read-only. Report the command's exact findings
and distinguish a failed update check from an unhealthy local installation.

If the terminal command is unavailable, inspect only the expected skill location
for the current agent and explain that a complete cross-agent check requires the
managed CLI. Do not search broadly through the user's home directory.

## Update and rollback

An explicit `/ai-governance update` or `/ai-governance rollback` request
authorizes that installation action, subject to the host agent's normal command
approval and filesystem rules. Inspect status first, explain the version change,
then use the managed CLI as the only implementation. Do not recreate its update
logic inside the skill.

## Repair

Run doctor first. Repair only the agent target named by the user or by an
unambiguous doctor result. Never replace a real file, directory, or unrelated
link.

## Uninstall

Show the managed paths that the CLI will remove. Use the CLI's confirmation flow
and leave project files, manual installations, and unrelated agent skills
untouched.
