# Releasing a new version

Releases are created by a maintainer from `main`.

## 1. Choose the version

Update `VERSION` and `CHANGELOG.md`, then commit those changes. Use a version such
as `0.2.0`; the release script adds the leading `v` to the Git tag.

## 2. Make sure main is ready

Push the intended commit to `origin/main`. The release script stops if the local
branch differs from GitHub or if any tracked or untracked files remain.

## 3. Start the release

```bash
# Validate the project, create the version tag, and push it to GitHub.
./scripts/release.sh
```

The script shows the version and commit, then asks for confirmation. Pushing the
tag starts the GitHub release workflow, which builds the download, checksum, and
installer files.

## 4. Check the result

The script prints commands for watching the workflow and opening the finished
release. If the tag cannot be pushed, it leaves the local tag in place and tells
you how to retry.
