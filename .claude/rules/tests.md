---
path: tests/**
description: Standards for test code
---

# Rules for Tests

## Standards
- Descriptive names: `test_<what>_<condition>_<expected>`
- Fixtures for data setup (pytest fixtures or factories)
- Parametrized tests for edge cases
- No sleeping or timing dependencies
- Deterministic (seeded random)
- Test both happy path and error cases

## Required Patterns
- `def test_<descriptive_name>():` naming
- Fixtures for reusable test data
- `@pytest.mark.parametrize` for variants
- Assertions with clear messages

## Forbidden Patterns
- `time.sleep()` in tests
- Tests depending on execution order
- Hardcoded test data paths
- Tests that pass when code is broken

## Review Checklist
- [ ] Descriptive test names
- [ ] Fixtures for data setup
- [ ] Edge cases covered
- [ ] Deterministic (seeded)
- [ ] Happy path and error cases
