# Frontend instructions

Read the root `AGENTS.md`, `ENGINEERING_QUALITY.md`, `TESTING.md`,
`SECURITY.md`, and `docs/architecture.md` before changing frontend code.

- Keep product behavior in the feature or domain that owns it.
- Reuse or extend the repository's shared interface system before creating local
  variants of common controls or patterns.
- Keep route, screen, or page entry points focused on composition.
- Access backend capabilities through deliberate contracts rather than internal
  implementation details.
- Treat all client-held identity, permission, validation, and ownership state as
  advisory. Authoritative enforcement belongs at the trusted boundary.
- Preserve semantic structure, keyboard operation, visible focus, accessible
  names, appropriate contrast, zoom, reduced-motion preferences, and supported
  input methods.
- Keep user-visible language in the repository's approved content or localization
  system when one exists.
- Represent loading, empty, success, partial, stale, and failure states
  deliberately when they can occur.
- Avoid leaking secrets or unnecessary personal data into client bundles, markup,
  logs, analytics, URLs, or persistent browser storage.
- Test observable behavior through accessible output and supported interactions.
- Run `<FRONTEND_FORMAT_COMMAND>`, `<FRONTEND_STATIC_ANALYSIS_COMMAND>`, and
  `<FRONTEND_TEST_COMMAND>` while developing.

Replace these command placeholders and add links to the repository's frontend,
accessibility, interface-system, content, and browser-support authorities.
