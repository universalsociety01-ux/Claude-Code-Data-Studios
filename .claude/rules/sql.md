---
path: "**/*.sql"
description: Standards for SQL code
---

# Rules for SQL

## Standards
- CTEs over nested subqueries for readability
- Explicit column lists (no SELECT *)
- JOIN conditions always explicit (no implicit joins)
- Timezone-aware date handling
- Cost comments for expensive operations
- Idempotent DDL (IF NOT EXISTS, IF EXISTS)

## Required Patterns
- `WITH cte AS (...)` for complex queries
- Explicit column lists in SELECT
- `ON` clause for all JOINs
- Comments for non-obvious logic

## Forbidden Patterns
- `SELECT *` in production queries
- Implicit joins (comma-separated FROM)
- Timezone-naive date comparisons
- DDL without IF EXISTS/IF NOT EXISTS

## Review Checklist
- [ ] CTEs used for readability
- [ ] No SELECT *
- [ ] Explicit JOINs
- [ ] Timezone-aware dates
- [ ] Idempotent DDL
