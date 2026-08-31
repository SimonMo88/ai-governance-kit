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

## Line length

- Maximum line length: `<MAX_LINE_LENGTH>` characters.
- Enforcement is strict. Follow the limit during implementation and verification
  even when no automated check exists. Every applicable maintained code or
  configuration line over the maximum must be corrected or covered by an
  explicit repository exception. For example, with a 100-character maximum, a
  101-character applicable code line fails verification.
- Exclude documentation files, documentation comments, docstrings, generated
  files, vendored code, lockfiles, snapshots, and other machine-owned content
  from the limit.
- Define repository-specific treatment for indivisible code content such as
  unbreakable URLs. Do not hide exceptions inside tooling configuration without
  documenting them.

## Responsibilities and structure

- Maximum maintained file length: `<MAX_FILE_LINES>` lines.
- Count maintained code and configuration lines. Exclude documentation files,
  documentation comments, docstrings, generated files, vendored code, lockfiles,
  snapshots, and other machine-owned content.
- Files over the selected maximum must be split around meaningful
  responsibilities or covered by a documented exception with an owner,
  rationale, precise scope, and review or expiry condition.
- Give every module one clear primary responsibility.
- Treat the selected file maximum as a maintainability boundary, not a reason to
  compress code or create fragments without clear ownership.
- Review growing modules early for separable responsibilities.
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
- When a project uses block-style documentation, format every documentation block
  vertically: place its opening delimiter, content, and closing delimiter on
  separate lines, even when the content is only one line. Never use a compressed
  single-line documentation block. Preserve native line-oriented documentation
  forms where the language or framework defines them.
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
9. Applicable code follows the repository's selected strict line and file
   maximums and documented exceptions.
