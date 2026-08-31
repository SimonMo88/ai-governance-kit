# Governance versioning and revert

Use this workflow before every bootstrap, upgrade, approved enforcement change,
and whenever the user asks to inspect or revert governance history.

## Storage contract

Store repository-local governance history under:

```text
.ai-governance/
  README.md
  state.md
  versions/
    <UTC_TIMESTAMP>-<SHORT_SLUG>/
      manifest.md
      files/
        <original repository-relative paths>
```

Use a sortable UTC timestamp such as `2030-04-12T16-30-00Z`. A version is
immutable after it is complete. Never place source code, credentials, private
data, generated application artifacts, or general worktree backups in this
folder.

## Files to version

Before editing, identify every governance file the operation may modify, move,
replace, or create. Include:

- root and scoped agent instructions;
- the root `.gitignore` when bootstrap or upgrade may add the
  `/.ai-governance/` rule;
- AI context routers;
- engineering-quality, testing, security, architecture, and invariant authorities
  affected by the operation;
- governance state or configuration files;
- governance-specific checks, hooks, or CI definitions when they are in scope.
- the enforcement capability record and every verification configuration,
  program, hook, or CI file in an approved enforcement plan.

Do not snapshot unrelated product specifications or implementation files merely
because an authority links to them.

## Create a version

1. Resolve and validate the repository root and every repository-relative path.
   Reject paths that escape the repository.
2. Record current worktree state so pre-existing edits remain distinguishable.
3. Create a new version directory. Never reuse or overwrite an existing version.
4. Copy each existing governance file byte-for-byte under `files/`, preserving its
   repository-relative path.
5. Record files that do not exist as `absent` in the manifest. This allows a
   revert to remove governance files introduced by the operation.
6. Record a SHA-256 digest for every copied file using an available system or
   repository tool. Do not invent a digest when no tool is available.
7. Write the manifest only after the file inventory is complete.
8. Verify every copied file against its recorded digest before changing active
   governance.

The manifest must contain:

- version identifier and UTC creation time;
- reason and mode: bootstrap, upgrade, enforcement, or pre-revert rescue;
- repository-relative path for every governed file;
- pre-change state: `present` or `absent`;
- SHA-256 digest for each present file;
- active governance version being superseded, when known;
- pre-existing worktree changes affecting governed files;
- exact scope exclusions and unresolved limitations.

Do not include secret values, environment contents, or the contents of untracked
files unrelated to governance.

## Complete an operation

After bootstrap, upgrade, or an approved enforcement change:

- update `.ai-governance/state.md` with the active version and authority map;
- keep the pre-change version immutable;
- record the list of active files created, modified, moved, or removed;
- verify links, placeholders, scope discovery, and repository commands;
- do not claim reversibility until the snapshot digests and manifest have been
  checked.

## Revert safely

A revert affects governance files only. It does not revert code refactors,
dependencies, application configuration, production state, commits, or unrelated
worktree changes.

1. Resolve the requested version exactly. If it is ambiguous, stop and request
   the version identifier.
2. Read its manifest and verify all stored file digests before changing anything.
3. Compare active governed files with the selected manifest. Report unexpected
   paths, missing snapshots, and changes outside the manifest.
4. Create and verify a new `pre-revert` rescue version of the current governance
   files. This makes the revert itself recoverable.
5. Restore every `present` file byte-for-byte to its original relative path.
6. Remove only files explicitly recorded as `absent` in the selected version and
   introduced as governed files by the superseding operation. Do not recursively
   delete directories.
7. Leave unrelated files and changes untouched.
8. Re-check restored digests, links, instruction discovery, and governance-focused
   validation.
9. Update `.ai-governance/state.md` to record the revert and rescue version.

If a governed file contains user changes made after the version being reverted,
the rescue snapshot preserves them, but still report the overwrite before
proceeding when the user has not explicitly authorized reverting that exact
version.

## Git interaction

Governance history complements Git; it does not replace it. Do not create commits,
branches, tags, or stashes unless requested. Bootstrap and upgrade must keep
`.ai-governance` local by ensuring the adopting repository's root `.gitignore`
ignores `/.ai-governance/`. Review active governance changes in their normal
source files; `.ai-governance` stores local version and provenance data only.
