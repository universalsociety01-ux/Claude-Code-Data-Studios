---
path: src/data/**
description: Standards for data loading and processing code
---

# Rules for Data Code

## Standards
- Schema validation on data read
- Null handling strategy documented per dataset
- Encoding explicitly specified (UTF-8 default)
- Data contracts with upstream and downstream
- Raw data is immutable (never modified in place)
- Processed data is versioned

## Required Patterns
- Schema validation on read
- Explicit encoding parameter
- Null handling documented

## Forbidden Patterns
- Modifying raw data files
- Implicit encoding (relying on system default)
- Schema-less data reading
- Silent null dropping

## Review Checklist
- [ ] Schema validation on read
- [ ] Null handling documented
- [ ] Encoding explicit
- [ ] Raw data immutable
- [ ] Data contracts defined
