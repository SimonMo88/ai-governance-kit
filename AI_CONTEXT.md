# AI context routing

Use this file to load the smallest authoritative context set for a task. It
routes to existing authorities and does not replace them.

## Required for every implementation change

- `AGENTS.md`
- `ENGINEERING_QUALITY.md`
- `docs/product-invariants.md`
- `TESTING.md`
- the nearest scoped `AGENTS.md`

Also read `SECURITY.md` for any trust boundary, authentication, authorization,
secret, sensitive-data, import, upload, external-system, dependency, or durable
history change.

## Frontend changes

Read the frontend scope instructions and the repository's authorities for:

- component and design-system ownership;
- accessibility and supported input methods;
- localization and user-visible language;
- client-side state and data boundaries;
- browser or device support;
- frontend-focused verification.

Start from the public interface of the owning feature before inspecting its
internals. Reuse shared interface primitives instead of recreating them locally.

## Backend changes

Read the backend scope instructions and the repository's authorities for:

- domain and service ownership;
- API, job, event, and command contracts;
- persistence, transactions, and migrations;
- authentication and authorization;
- external integrations;
- backend-focused verification.

Start from the public interface of the owning domain or service. Treat transport,
persistence, and external systems as boundaries around domain behavior.

## Cross-cutting changes

When a task spans frontend and backend, identify the contract between them first.
Read both scopes, then validate the contract and each side independently before
running the full repository gate.

## Context exclusions

Do not broadly load generated output, dependency caches, build artifacts,
lockfiles, large fixtures, snapshots, binary assets, data exports, or vendored
dependencies unless the task specifically requires them.

Prefer targeted search within the owning area. Inspect a large or generated file
only after a smaller authoritative source identifies it as relevant.

## Validation routing

During implementation, run the focused commands documented by the owning scope.
Before a commit, run `<STAGED_VERIFICATION_COMMAND>` when available. Before
calling the overall change complete, run `<FULL_VERIFICATION_COMMAND>`.
