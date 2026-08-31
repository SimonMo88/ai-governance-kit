# Audit one file

Use this mode only when the user identifies one file. Read and follow
[audit.md](audit.md).

Resolve the exact repository-owned path. Inspect the file, its applicable
authorities, public contract, direct consumers, dependencies, and focused tests.
Treat other files as read-only context unless the user separately expands the
target. If the requested file is JSON or otherwise excluded, report the reason
and stop without pretending it was audited.

The refactor preview must stay file-bounded by default. Identify any extraction,
consumer, export, test, schema, or configuration work outside the file as an
explicit scope expansion requiring approval.
