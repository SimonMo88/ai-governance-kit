# Engineering quality

Write code primarily for the next person who must understand, review, debug,
operate, and safely modify it.

## Readability

- Prefer clear, conventional code over clever, compressed, or highly abstract
  code.
- Use precise names from the problem domain. Avoid vague names when the value's
  responsibility can be stated directly.
- Name booleans as questions or states and functions by the outcome they produce.
- Keep control flow shallow with guard clauses and early returns where the
  language supports them.
- Avoid dense one-liners, hidden side effects, unexplained coercion, and complex
  inline conditions.
- Introduce named intermediate values when they make a decision, calculation, or
  transformation easier to understand.
- Keep related code together and order it so its public behavior is easy to find.
- Follow established language and framework conventions unless the repository
  explicitly defines a different standard.

## Responsibilities and structure

- Give every module one clear primary responsibility.
- Treat file and function size as maintainability signals, not arbitrary quotas.
- Review growing modules for separable responsibilities; do not compress or
  fragment code merely to satisfy a line count.
- Extract a module only when it represents a meaningful concept, boundary,
  capability, or independently testable responsibility.
- Organize business behavior by domain or feature rather than accumulating
  unrelated global utility modules.
- Keep code owned by one domain within that domain. Move it to shared code only
  after stable reuse exists across multiple owners.
- Keep shared code domain-neutral and expose small, deliberate public interfaces.
- Do not import another domain's private implementation.
- Avoid circular dependencies and modules that coordinate unrelated concerns.

## Logic and modeling

- Model important concepts explicitly instead of passing loosely structured data
  or primitive values throughout the system.
- Make invalid states difficult or impossible to represent where the stack
  supports it.
- Replace complex inline boolean expressions with named predicates that describe
  the decision in domain language.
- Keep business decisions separate from rendering, transport, persistence, and
  external-system adapters.
- Pass time, configuration, randomness, and external state explicitly when doing
  so makes behavior deterministic and testable.
- Prefer a little clear duplication over a premature or misleading abstraction.

## Boundaries and failures

- Validate data entering from users, files, networks, persistence, configuration,
  external systems, and generated output.
- Handle expected failure cases deliberately. Do not silently swallow errors.
- Make errors useful to operators without exposing secrets, personal data, or
  unnecessary implementation details.
- Keep retries explicit, bounded, observable, and limited to failures that may
  succeed when repeated.
- Avoid unexplained global state, magic values, and implicit side effects.
- Preserve backward compatibility unless a breaking change is intentional,
  authorized, and documented.

## Documentation

- Make important modules, public interfaces, constraints, inputs, outputs, and
  ownership easy to discover.
- Explain why a decision exists when it represents a business rule, security
  requirement, compatibility constraint, external limitation, or trade-off.
- Do not add comments that only restate syntax.
- Keep documentation next to the behavior it governs and update it with the code.
- Record significant architectural decisions when their reasoning would otherwise
  be lost.
- Mark temporary work with its reason, owner, removal condition, and tracking
  reference when available.

## Change hygiene

- Remove dead code, unused exports, debug output, commented-out implementations,
  and speculative abstractions introduced or exposed by the task.
- Do not leave placeholder behavior that appears production-ready.
- Add or update tests for important behavior, boundaries, edge cases, and bug
  fixes.
- Review generated changes before accepting them.
- Keep commits focused and describe the observable change, not the mechanics used
  to produce it.

## Completion review

Before completing a change, verify:

1. The purpose and ownership of every changed file are clear.
2. Names use the language of the relevant domain.
3. Responsibilities are cohesive and public interfaces remain small.
4. Complex decisions are named, documented where necessary, and tested.
5. Invalid inputs, failures, concurrency, and edge cases are handled deliberately.
6. Security, privacy, accessibility, compatibility, and durable-history effects
   have been considered where relevant.
7. No unrelated changes, obsolete code, or unnecessary complexity were added.
8. Formatting, static analysis, tests, and required builds have been run.
