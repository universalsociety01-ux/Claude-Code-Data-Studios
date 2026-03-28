# Tests

| Directory | Purpose |
|-----------|---------|
| unit/ | Unit tests for individual functions |
| integration/ | Integration tests for pipelines and APIs |
| data-quality/ | Data quality validation test suites |

## Standards
- Naming: test_<what>_<condition>_<expected>
- Use pytest fixtures for data setup
- Parametrize for edge cases
- No time.sleep() in tests
- Deterministic (seeded random)
