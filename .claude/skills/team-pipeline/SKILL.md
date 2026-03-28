---
name: Team Pipeline
description: Orchestrate pipeline build with data engineering specialists
---
# /team-pipeline
## Purpose
Multi-agent workflow for building or refactoring a data pipeline.
## Workflow
1. data-engineering-lead designs architecture
2. pipeline-engineer implements core pipeline
3. database-engineer handles schema/storage
4. data-integration-specialist builds connectors
5. data-quality-engineer adds validation
6. testing-specialist writes tests
7. data-engineering-lead reviews all
## Agents Involved
- data-engineering-lead + all DE specialists
## Example Usage
```
/team-pipeline "Build daily user events ETL from Postgres to warehouse"
```
