# Product and operational invariants

This document contains non-negotiable behavior that implementation changes must
preserve unless the appropriate authority explicitly approves a breaking change.

Replace this guidance with the adopting repository's actual invariants. Do not
copy the source project's product rules.

Each invariant should state:

1. the behavior that must remain true;
2. why it matters;
3. which boundary is responsible for enforcing it;
4. how it is verified;
5. who may authorize a deliberate exception or breaking change.

Good invariants describe observable or durable truth, for example:

- authorization is checked at the authoritative boundary;
- an unknown measurement is never presented as a measured zero;
- accepted user input is not overwritten without retained history;
- a committed operation is either complete or safely recoverable;
- generated or external output is reviewed before becoming authoritative;
- tenant or account data cannot cross its ownership boundary.

Avoid implementation preferences, temporary plans, feature descriptions, and
aspirational roadmap items. Those belong in their own authorities.
