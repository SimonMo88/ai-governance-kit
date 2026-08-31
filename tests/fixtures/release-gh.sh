#!/bin/sh

set -eu

case "$1 ${2:-}" in
  "auth status") exit 0 ;;
  *) printf 'Unexpected gh command: %s\n' "$*" >&2; exit 1 ;;
esac
