# Coding Standards

Comprehensive coding standards for all code in the Data Studios project. Path-scoped rules in `.claude/rules/` enforce these automatically.

## Python

### Style
- PEP 8 compliance mandatory
- Type hints on all public functions and class methods
- Docstrings (Google-style) on all public APIs
- Maximum line length: 120 characters
- Imports organized: stdlib, third-party, local (isort compatible)
- `logging` module only — no `print()` in production code
- No bare `except:` — always catch specific exceptions
- No mutable default arguments
- Use `pathlib` for file paths
- Constants in `UPPER_SNAKE_CASE`

### Model Code
- Seed ALL random sources: `random.seed()`, `np.random.seed()`, `torch.manual_seed()`, `tf.random.set_seed()`
- Docstrings include tensor shapes: `# (batch, seq_len, hidden)`
- Device-agnostic: `.to(device)`, never `.cuda()`
- No data loading inside model classes (separation of concerns)
- Config-driven hyperparameters via `ModelConfig` dataclass
- Gradient checkpointing for models >1B parameters

### Pipeline Code
- All operations idempotent (safe to re-run)
- Retry logic with exponential backoff on transient failures
- Structured logging at each pipeline stage
- Config-driven behavior (no hardcoded paths, credentials, thresholds)
- Proper resource cleanup (context managers, `try/finally`)
- Dead-letter queue or quarantine for failed records
- Checkpoint/resume support for long-running pipelines

### Feature Code
- No future data leakage (temporal features must be timestamp-aware)
- Handle nulls explicitly (document strategy: impute, drop, flag)
- Transformer pattern (fit/transform) for stateful features
- Compatible with both batch and online serving
- Versioned feature schemas

### API Code
- Input validation with Pydantic models
- Structured JSON error responses with error codes
- Health check endpoints: `/health` and `/ready`
- `X-Model-Version` response header
- Rate limiting on inference endpoints
- Async where beneficial for I/O
- Request/response logging without PII

### Monitoring Code
- Structured JSON logging
- Metric naming convention: `<service>_<domain>_<metric>_<unit>`
- Alert thresholds documented with rationale
- Runbook links in every alert definition
- SLO-based monitoring (not just thresholds)
- Correlation IDs for request tracing
- No PII in logs or metrics

## SQL

- CTEs (`WITH ... AS`) over nested subqueries
- Explicit column lists — never `SELECT *` in production
- Explicit `JOIN ... ON` — no implicit joins
- Timezone-aware date handling
- Idempotent DDL (`IF NOT EXISTS`, `IF EXISTS`)
- Cost comments for expensive operations
- Index hints documented for critical queries

## Notebooks

- Sequential execution: `Restart & Run All` must work
- Title and objective in first markdown cell
- Imports consolidated in cells 1-2
- No hardcoded absolute paths (use relative or config)
- Random seeds stated for reproducibility
- Findings and conclusions in final markdown cell
- Outputs cleared before commit (use `nbstripout` or `nbconvert --clear-output`)
- Data sources documented

## Configuration

- YAML preferred over JSON for human-edited configs
- All values documented with inline comments
- No secrets in config files — use environment variable references: `${DB_PASSWORD}`
- Environment-specific overrides supported (dev/staging/prod)
- Schema validation for all configs
- Sensible defaults for all optional fields

## Tests

- Descriptive names: `test_<what>_<condition>_<expected>`
- Fixtures for data setup (pytest fixtures or factories)
- Parametrized tests (`@pytest.mark.parametrize`) for edge cases
- No `time.sleep()` or timing dependencies
- Deterministic: seeded random in all tests
- Test both happy path and error cases
- Clear assertion messages

## Commits

- Reference experiment IDs or ticket numbers in commit messages
- TODO format: `TODO(author): description`
- No debug breakpoints committed (`breakpoint()`, `pdb`, `ipdb`)
- No commented-out code blocks (delete or use version control)

## Verification-Driven Development

1. Write tests first when adding pipelines or model components
2. Data validation checks at every pipeline boundary
3. Compare expected vs actual output before marking complete
4. Review changes against the relevant path-scoped rule checklist
