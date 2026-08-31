# Governance version manifest

- Version identifier: `2026-08-31T14-30-48Z-line-length-policy`
- Created at: `2026-08-31T14:30:48Z`
- Reason: require an owner-selected maximum line length and enforcement mode
- Mode: upgrade
- Active governance version superseded: `2026-08-31T14-26-19Z-multiline-documentation-blocks`

## Governed files

- `SKILL.md`: present; SHA-256 `4cc4756c4b471ab0596a09f0c9c28ad9650f09368ee89936e338d2812d9df4fe`
- `references/bootstrap.md`: present; SHA-256 `515d59ad30c9cb2721c1209b555a595b437ebde66c2748c590024c433d8d277e`
- `references/upgrade.md`: present; SHA-256 `6a5ceb8c0fa772fa926190fe8469ac6766435af81bb9f3ec5d052da14b4709ad`
- `ADOPTION.md`: present; SHA-256 `e510e91f4966cbfe4479143222a6e565161da2be3d6b0b8d1ba94c101a33daba`
- `ENGINEERING_QUALITY.md`: present; SHA-256 `3468075f2dd9c5db343fe16ca72bccae738e73332e51efc9ee8a82e93165f5ce`
- `README.md`: present; SHA-256 `dd4419268f577a0a95e093b78721579e4d3541563d8b5a1e892c32f8ed07cd21`
- `.ai-governance/state.md`: present; SHA-256 `b6c4dd536f7b9b2f8353882f4e52373979bae001eebebccefa1d1c08208cb5ad`
- `.ai-governance/enforcement.md`: present; SHA-256 `b2b2c5fdfb336c34a5554253d3e5e86a84839d0f9ebf62dfbf3b323f8aca4cbe`

## Pre-existing worktree changes

- Every governed file except `ENGINEERING_QUALITY.md` had uncommitted changes
  before this operation. Their exact current contents were captured.
- `ENGINEERING_QUALITY.md` contained the preceding approved multiline
  documentation-block upgrade and was also captured exactly.
- Other uncommitted files and directories were excluded because this operation
  does not modify them.

## Scope exclusions and limitations

- This version changes governance documentation only.
- Bootstrap and upgrade record the owner's decision but do not add or change
  enforcement tooling without separate authorization.
- Documentation files, documentation comments, and docstrings are included or
  omitted only according to the user's recorded selection.
