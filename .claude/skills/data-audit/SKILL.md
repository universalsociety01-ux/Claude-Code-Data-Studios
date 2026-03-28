---
name: Data Audit
description: Audit data lineage, freshness, completeness, and accuracy
---

# /data-audit

## Purpose
Comprehensive audit of data assets covering lineage, freshness, completeness, and accuracy.

## Workflow
1. Map data lineage (source → transformations → consumers)
2. Check data freshness against SLAs
3. Measure completeness (null rates, missing records)
4. Validate accuracy against known sources
5. Generate audit report

## Agents Involved
- data-governance-lead (audit coordination)
- data-quality-engineer (execution)
- compliance-specialist (regulatory check)

## Inputs
- Dataset or system name
- Optional: audit scope, time range

## Outputs
- Audit report with lineage map
- Freshness, completeness, accuracy scores
- Remediation recommendations

## Example Usage
```
/data-audit --dataset user_transactions --scope full
```
