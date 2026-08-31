# Backend instructions

Read the root `AGENTS.md`, `ENGINEERING_QUALITY.md`, `TESTING.md`,
`SECURITY.md`, and `docs/architecture.md` before changing backend code.

- Keep business rules in the domain or application boundary that owns them.
- Keep transport, persistence, framework, and external-system concerns outside
  pure domain behavior where the architecture supports that separation.
- Validate untrusted input at every public boundary.
- Authenticate identity and authorize the requested operation independently.
- Treat caller-supplied ownership, tenant, role, state, and resource identifiers
  as untrusted until verified.
- Make multi-step state changes atomic or explicitly recoverable.
- Preserve required history and use reviewed migrations or compatibility plans
  for durable data changes.
- Keep retries bounded and operations idempotent when repetition is possible.
- Define timeouts, cancellation, resource limits, and failure behavior for network
  and background work.
- Expose stable repository-owned contracts instead of leaking framework,
  persistence, or provider-specific types across boundaries.
- Keep logs structured and useful without exposing secrets or unnecessary
  personal data.
- Test domain decisions, public contracts, authorization, persistence guarantees,
  concurrency, and important failure paths at their owning boundary.
- Run `<BACKEND_FORMAT_COMMAND>`, `<BACKEND_STATIC_ANALYSIS_COMMAND>`, and
  `<BACKEND_TEST_COMMAND>` while developing.

Replace these command placeholders and add links to the repository's API, data,
authentication, operations, and deployment authorities.
