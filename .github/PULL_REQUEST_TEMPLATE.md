## Summary

Describe the problem this pull request solves and the intended outcome.

## Changes

- Describe the first change.

## Authority and workflow

Identify the authority, workflow, or component that owns this change. If the
change affects a workflow, explain how it remains consistent with `SKILL.md` and
the corresponding file in `references/`.

## Impact

Describe any compatibility, adoption, security, release, or rollback
implications. Write `None` when there are none.

## Validation

List the exact commands and manual checks performed. Include failures,
environmental limitations, and checks that were not run.

```text
# Example
sh tests/readme-links.sh
```

## Checklist

- [ ] This pull request is focused and excludes unrelated changes.
- [ ] I read the authorities relevant to this change.
- [ ] Links and repository-relative paths resolve.
- [ ] Placeholders remain intentional and internally consistent.
- [ ] Examples remain stack-neutral and are not presented as repository facts.
- [ ] Affected documentation, examples, and workflows are updated.
- [ ] I did not weaken required checks or describe a partial check as the full
      repository gate.
- [ ] No credentials, private data, generated artifacts, or local environment
      state are included.
- [ ] Breaking changes or intentional exceptions are clearly identified and
      authorized.

## Remaining uncertainty

List anything reviewers should verify, any policy that is not executably
enforced, and any follow-up work. Write `None` when there is nothing to report.
