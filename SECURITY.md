# Security and data-handling requirements

## Secrets and configuration

- Obtain secrets from approved runtime configuration or secret storage.
- Never commit credentials, private keys, tokens, recovery material, populated
  local environment files, or production data.
- Do not add fallback production secrets to source code.
- Validate required security configuration before accepting affected work.
- Never log secrets, authorization material, session identifiers, or sensitive
  recovery data.
- Rotate a secret immediately when exposure is suspected.

## Authentication and authorization

- Authentication proves identity; protected operations still require
  authorization.
- Enforce authorization at the authoritative backend or data boundary. Interface
  visibility is never a security control.
- Do not trust client-supplied identity, ownership, tenant, role, or permission
  claims without verification.
- Sensitive operations fail closed.
- Add regression coverage when changing identity, sessions, permissions,
  invitations, recovery, or tenant isolation.

## Untrusted data and external systems

- Treat user input, files, URLs, imports, generated content, stored records, and
  external-system responses as untrusted.
- Validate shape, size, type, ownership, allowed transitions, and resource limits
  at boundaries.
- Encode or render untrusted content through approved safe mechanisms.
- Send external systems only the minimum data required for the requested
  operation.
- Validate generated and external output before using it in an authoritative
  decision or persistent state change.
- Normalize external failures and bound retries to transient conditions.

## Data and durable integrity

- Collect, retain, expose, and transmit only data necessary for the declared
  purpose.
- Preserve the repository's product and operational invariants at every write
  boundary.
- Preserve audit, financial, security, consent, and other required history.
- Corrections to append-only history create correcting records rather than
  rewriting the past.
- Schema or storage changes require a reviewed migration or compatibility plan.
- Destructive changes require explicit authorization, recovery steps, and a
  rollback plan.

## Dependencies and supply chain

- Add a dependency only when its value outweighs its maintenance, security,
  licensing, permission, and ownership costs.
- Use the repository's integrity or lock mechanism when one exists.
- Review generated install changes and avoid executing untrusted lifecycle code
  without understanding it.
- Run `<DEPENDENCY_AUDIT_COMMAND>` for dependency changes when the stack provides
  an appropriate audit mechanism.

## Reporting

Report vulnerabilities privately through `<PRIVATE_SECURITY_REPORTING_CHANNEL>`.
Do not place credentials, personal data, exploit details, or production records
in public issues, commits, logs, or chat transcripts.

Run `<FULL_VERIFICATION_COMMAND>` for every security-sensitive change, plus the
repository's focused security and boundary tests.
