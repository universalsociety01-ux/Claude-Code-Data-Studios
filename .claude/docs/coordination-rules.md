# Coordination Rules

Rules governing how 42 agents collaborate, delegate, and resolve conflicts.

## Collaboration Protocol

All significant decisions follow this protocol:

```
Question → Options → Decision → Draft → Approval
```

1. **Question** — Agent asks clarifying questions to understand context
2. **Options** — Agent presents 2-3 options with trade-off analysis
3. **Decision** — User makes the call ("This is your call — you understand your domain best")
4. **Draft** — Agent implements the chosen approach
5. **Approval** — User reviews and approves

### Examples
- "Should we use Airflow or Prefect for this pipeline?" → Options with pros/cons → User decides
- "Which model architecture for this task?" → 2-3 approaches with trade-offs → User decides
- "How should we handle nulls in this feature?" → impute/drop/flag with impact analysis → User decides

## Vertical Delegation

```
Directors → Leads → Specialists
```

- Directors assign to leads with: objective, constraints, expected output
- Leads assign to specialists with: specific task, acceptance criteria, deadline
- Skip-level assignments only in emergencies (document why)
- Every assignment has a clear owner — no shared ownership

## Horizontal Consultation

- Same-tier agents may consult each other freely
- Consultations are informational only — cannot make cross-domain decisions
- Results documented for transparency
- Example: `pipeline-engineer` consults `database-engineer` about schema, but DE lead approves changes

## Conflict Resolution

| Level | Conflict Type | Mediator | Escalation Trigger |
|-------|--------------|----------|-------------------|
| 1 | Within same team | Team lead | Specialists disagree on approach |
| 2 | Between teams under same director | Director | Leads disagree on priority or interface |
| 3 | Between directors' teams | Producer | Data vs ML priority conflict |
| 4 | Unresolvable / strategic | User | Budget, scope, or timeline decisions |

## Change Propagation

### Schema Change Protocol
1. `database-engineer` proposes schema change
2. `data-engineering-lead` reviews and scopes impact
3. Notifies: `ml-engineering-lead` + `analytics-lead`
4. Each lead assesses downstream impact with their specialists
5. All teams sign off before change proceeds
6. Migration executed with rollback plan and monitoring

### Feature Change Protocol
1. `feature-engineer` proposes new/modified feature
2. `ml-engineering-lead` reviews for leakage and serving compatibility
3. `data-engineering-lead` reviews data availability
4. Both leads sign off before implementation

### API Change Protocol
1. `ml-deploy-engineer` proposes API change
2. `mlops-lead` reviews for backward compatibility
3. Downstream consumers notified
4. Canary deployment for breaking changes

## Domain Boundaries

| Agent | Owns | Does Not Touch |
|-------|------|---------------|
| pipeline-engineer | `src/pipelines/` | `src/models/`, `src/api/` |
| model-developer | `src/models/` | `src/pipelines/`, `src/api/` |
| feature-engineer | `src/features/` | `src/models/`, `src/pipelines/` |
| ml-deploy-engineer | `src/api/` | `src/models/`, `src/pipelines/` |
| monitoring-engineer | `src/monitoring/` | `src/models/`, `src/pipelines/` |
| data-analyst | `notebooks/` | `src/` |
| database-engineer | `src/data/`, SQL files | `src/models/` |

## Cross-Team Handoff Gates

| Handoff | Gate Requirements |
|---------|------------------|
| Data Eng → ML | Data quality checks pass, schema documented, data contract signed |
| ML → MLOps | Model card complete, metrics meet thresholds, export format specified, inference benchmarked |
| MLOps → Production | Integration tests pass, monitoring configured, rollback tested, load tested, SLA defined |
| Incident → Fix | Alert + root cause hypothesis documented, severity classified |

## Review Requirements

| Code Type | Reviewer | Additional |
|-----------|----------|------------|
| Pipeline code | data-engineering-lead | data-quality-engineer for validation |
| Model code | ml-engineering-lead | experiment-analyst for evaluation |
| Feature code | ml-engineering-lead | data-engineering-lead for data access |
| API code | mlops-lead | security-engineer for auth/PII |
| Schema changes | data-director | All downstream leads |
| Production deploys | mlops-lead + user | monitoring-engineer confirms observability |

## Communication Standards

### Assignment Format
```
Task: [description]
Owner: [agent name]
Objective: [what success looks like]
Constraints: [budget, timeline, dependencies]
Acceptance Criteria: [specific, measurable]
Due: [date or sprint]
```

### Status Update Format
```
Task: [name]
Status: on-track / at-risk / blocked
Progress: [what's done]
Blockers: [if any]
Next: [what's planned]
```
