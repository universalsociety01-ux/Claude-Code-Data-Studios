---
name: Schema Review
description: Validate schema changes and assess downstream impact
---

# /schema-review

## Purpose
Review proposed schema changes for backward compatibility, downstream impact, and migration strategy.

## Workflow
1. Analyze proposed schema changes
2. Identify affected downstream systems
3. Check backward compatibility
4. Assess migration strategy
5. Generate impact report

## Agents Involved
- database-engineer (schema analysis)
- data-engineering-lead (impact assessment)

## Inputs
- Schema change description or migration file

## Outputs
- Impact analysis report
- Migration plan recommendations
- List of affected systems

## Example Usage
```
/schema-review --migration alembic/versions/add_user_segment.py
```
