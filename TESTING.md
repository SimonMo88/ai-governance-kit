# Testing strategy

Tests protect observable behavior, product invariants, security boundaries,
durable state, and contracts with external systems. They should read as
executable documentation in the language of the domain.

## Test ownership

- Keep deterministic domain rules with the domain that owns them.
- Keep persistence constraints, transactions, migrations, and durable-history
  tests with the persistence boundary.
- Keep frontend behavior tests with the owning feature or shared interface
  system.
- Keep backend contract and policy tests with the owning service or domain.
- Use end-to-end tests for critical journeys that cross multiple real boundaries.
- Do not use an end-to-end test when a smaller test proves the same behavior more
  clearly and reliably.

## Test-writing rules

- Name tests by observable behavior using domain terminology.
- Keep setup, action, and assertions visually distinct.
- Cover success, expected failure, and important boundary conditions.
- Add a regression test with every bug fix when practical.
- Test public behavior and contracts rather than private implementation details.
- Prefer direct assertions over snapshots when direct assertions communicate the
  requirement more clearly.
- Never weaken, delete, skip, or broadly rewrite an assertion merely to make a
  change pass.
- Make nondeterministic inputs such as time, randomness, and external responses
  controllable.
- Keep tests isolated. Shared mutable state must not make execution order affect
  results.
- Document why a test is skipped and never report skipped coverage as passing.

## Required verification contract

The adopting repository must replace every applicable placeholder:

```text
Format changed files:       <FORMAT_CHANGED_FILES_COMMAND>
Static analysis:            <STATIC_ANALYSIS_COMMAND>
Focused frontend tests:     <FRONTEND_TEST_COMMAND>
Focused backend tests:      <BACKEND_TEST_COMMAND>
Contract tests:             <CONTRACT_TEST_COMMAND>
End-to-end tests:           <END_TO_END_TEST_COMMAND>
Production build:           <BUILD_COMMAND>
Staged verification:        <STAGED_VERIFICATION_COMMAND>
Full repository gate:       <FULL_VERIFICATION_COMMAND>
```

Delete commands that do not apply; do not leave ambiguous placeholders in an
active policy.

Use focused checks while developing. Run the production build when changing
build configuration, dependency resolution, entry points, deployment behavior,
or code paths that differ in production.

Before calling the overall change complete, run the full repository gate. If an
environmental limitation blocks validation, record the exact command, failure,
checks that passed, and remaining uncertainty. A partial check never proves the
full gate passed.
