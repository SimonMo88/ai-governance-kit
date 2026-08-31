# Changelog

## Unreleased

- Make the release script suggest patch, minor, and major versions while allowing
  an exact version, update and commit `VERSION`, push `main`, and start a GitHub
  release with generated release notes.
- Make bootstrap and upgrade add `/.ai-governance/` to the adopting repository's
  root `.gitignore`, creating the file when needed.
- Add a managed installer and terminal command for status, diagnosis, updates,
  rollback, repair, uninstall, and prompt generation.
- Add matching installation-management workflows for Codex and Claude Code.
- Replace the long README with a shorter plain-language introduction and move
  detailed guidance into focused documents.
- Add automated installation, command, link, and release checks.
- Require adopters to choose both a character limit for each line and a maximum
  number of lines for each maintained file.
- Ask only for code file and code line limits, enforce both strictly, and exclude
  documentation and machine-owned content automatically.
- Add standalone file, folder, and project audits with optional comma-separated
  extension filters, JSON exclusion, project governance preflight, mandatory
  refactor approval, and optional independently validated batch commits.
- Add a guarded maintainer script for validating and starting a GitHub release.
