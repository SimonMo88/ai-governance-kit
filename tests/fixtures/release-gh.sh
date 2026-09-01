#!/bin/sh

set -eu

# Release tests need authentication to succeed without contacting GitHub; every
# other gh command is unexpected because publishing is represented by git fakes.
case "$1 ${2:-}" in
  "auth status") exit 0 ;;
  *) printf 'Unexpected gh command: %s\n' "$*" >&2; exit 1 ;;
esac
