# Data

| Directory | Mutable? | Purpose |
|-----------|----------|---------|
| raw/ | NO | Original raw data (immutable, gitignored) |
| processed/ | Yes | Cleaned, transformed data |
| external/ | Yes | Third-party reference data |
| interim/ | Yes | Intermediate processing artifacts |

## Rules
- Raw data is NEVER modified in place
- All datasets must have a schema.yaml or README.md
- Use snake_case naming (lowercase, no spaces)
- Large files: use DVC, git-lfs, or cloud storage
