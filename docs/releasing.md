# Releasing a new version

Releases are created by a maintainer from `main`.

## 1. Prepare the changelog

Update the `Unreleased` section of `CHANGELOG.md` and commit it with the changes
being released. The repository changelog is the maintained summary of notable
changes. GitHub also generates release notes automatically from the commits and
merged pull requests since the preceding tag.

## 2. Make sure main is ready

Push the intended commit to `origin/main`. The release script stops if the local
branch differs from GitHub or if any tracked or untracked files remain.

## 3. Start the release

```bash
# Choose a version, validate it, commit it, and start the GitHub release.
./scripts/release.sh
```

The script shows the current version and calculates the next patch, minor, and
major versions. Use Up and Down to select patch, minor, major, or an exact
version, then press Enter. The exact-version option accepts a greater three-part
numeric version such as `0.2.0`, without a leading `v`. Piped automation retains
the existing `patch`, `minor`, `major`, or exact-version line input. After
validation and confirmation, the script updates and commits only `VERSION`,
pushes `main`, and creates and pushes the corresponding tag.

Pushing the tag starts the GitHub release workflow. The workflow builds the
download, checksum, and installer files, then publishes a GitHub release with
automatically generated release notes.

## 4. Check the result

The script prints commands for watching the workflow and opening the finished
release. If the release commit or tag cannot be pushed, the script preserves the
local Git state and prints the exact push command to retry.
