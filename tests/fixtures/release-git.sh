#!/bin/sh

set -eu

printf '%s\n' "$*" >> "$RELEASE_COMMAND_LOG"

case "$1 ${2:-}" in
  "branch --show-current") printf 'main\n' ;;
  "status --porcelain") ;;
  "remote get-url") printf 'git@example.test:owner/repository.git\n' ;;
  "fetch origin") ;;
  "rev-parse HEAD"|"rev-parse origin/main") printf '0123456789abcdef\n' ;;
  "rev-parse "*) exit 1 ;;
  "ls-remote --exit-code") exit 2 ;;
  "diff --check") ;;
  "add --") ;;
  "commit -m") ;;
  "push origin") ;;
  "tag -a") ;;
  *) printf 'Unexpected git command: %s\n' "$*" >&2; exit 1 ;;
esac
