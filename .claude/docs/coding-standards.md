# Coding Standards

## Python
- PEP 8 compliance, type hints on all public APIs
- Docstrings (Google-style) with tensor shapes for model code
- Max line length: 120 characters
- logging module only — no print() in production
- All random sources seeded (random, numpy, torch, tensorflow)
- Device-agnostic: .to(device), never .cuda()
- No data loading in model classes
- Config-driven hyperparameters
- pathlib for file paths
- Constants in UPPER_SNAKE_CASE
- No bare except: — catch specific exceptions

## SQL
- CTEs over nested subqueries
- Explicit column lists (no SELECT *)
- Explicit JOIN ... ON
- Timezone-aware dates
- Idempotent DDL
- Cost comments for expensive operations

## Notebooks
- Sequential execution (Restart & Run All)
- Title/objective in first cell
- Imports in cells 1-2
- No hardcoded paths
- Seeds stated
- Findings in final markdown cell
- Outputs cleared before commit

## Configuration
- YAML preferred for human-edited configs
- All values documented with inline comments
- No secrets — use env var references
- Environment-specific overrides (dev/staging/prod)
- Schema validation for all configs

## Commits
- Reference experiment IDs or ticket numbers
- TODOs: use TODO(author): description format
- No debug breakpoints committed

## Verification-Driven Development
1. Write tests first for pipelines and models
2. Data validation at every boundary
3. Compare expected vs actual before marking complete
