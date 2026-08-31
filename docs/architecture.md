# Architecture and ownership

This document describes the current system. Replace the prompts below with
repository-specific facts before using the governance kit.

## System boundaries

Describe each independently owned application, service, package, library, data
store, worker, client, and external integration.

For each boundary, record:

- its responsibility;
- its public interface;
- the data or behavior it owns;
- allowed incoming and outgoing dependencies;
- prohibited dependencies;
- relevant trust boundaries;
- focused validation commands.

## Dependency direction

State the permitted dependency direction in plain language. Business rules
should not depend on interface frameworks, transport mechanisms, persistence
implementations, or external provider details unless the architecture explicitly
assigns that responsibility.

## Frontend ownership

Identify where the repository owns:

- application features and their public interfaces;
- shared interface primitives and design tokens;
- routing and page composition;
- client-side state and network access;
- localization and user-visible content;
- accessibility and browser support policy.

## Backend ownership

Identify where the repository owns:

- domain behavior and application services;
- API, event, job, and command contracts;
- authentication and authorization;
- persistence, schemas, migrations, and transactions;
- external-system adapters;
- background and scheduled work;
- observability and operational controls.

## Cross-boundary contracts

List contracts shared across boundaries and identify their authoritative owner.
Callers should depend on deliberate public contracts rather than private
implementation details.

## Architecture decisions

Record durable architectural decisions in `<ARCHITECTURE_DECISION_LOCATION>`.
Each decision should include context, decision, consequences, alternatives, and
the conditions under which it should be revisited.
