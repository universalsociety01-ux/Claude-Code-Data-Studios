---
path: src/features/**
description: Standards for feature engineering code
---

# Rules for Feature Engineering

## Standards
- No future data leakage (temporal features must be timestamp-aware)
- Handle nulls explicitly (document strategy: impute, drop, or flag)
- Document feature semantics and business logic
- Compatible with both batch and online serving
- Versioned feature schemas

## Required Patterns
- Transformer pattern (fit/transform) for stateful features
- Null handling documented per feature
- Feature metadata (name, type, description, version)

## Forbidden Patterns
- Using future data in feature computation
- Implicit null handling (dropping without documentation)
- Features that only work in batch mode
- Unversioned feature schemas

## Review Checklist
- [ ] No future data leakage
- [ ] Null handling explicit
- [ ] Feature semantics documented
- [ ] Works in batch and online
- [ ] Schema versioned
