# Agent Coordination Map

## Full Hierarchy

```
User (Principal Data Scientist)
├── data-director (Opus) ─── Data strategy, architecture, governance
│   ├── data-engineering-lead → 5 DE specialists
│   ├── analytics-lead → 4 analytics specialists
│   ├── data-governance-lead → 3 governance specialists
│   └── platform-lead → 3 platform specialists
├── ml-director (Opus) ─── ML strategy, model lifecycle
│   ├── ml-engineering-lead → 7 ML specialists
│   ├── mlops-lead → 4 MLOps specialists
│   └── research-lead → 2 research specialists
└── producer (Opus) ─── Planning, coordination
    └── documentation-specialist, data-viz, notebook, feature-engineer
```

See agent-roster.md for full details on each agent.

## Cross-Team Workflow Diagrams

### Data Pipeline to ML Training
```
[Data Source] → [data-integration-specialist: ingest]
                         ↓
               [pipeline-engineer: transform]
                         ↓
               [data-quality-engineer: validate]
                         ↓
  ── HANDOFF: DE Lead → ML Lead (quality pass, schema docs) ──
                         ↓
               [feature-engineer: build features]
                         ↓
               [model-developer: train model]
                         ↓
               [experiment-analyst: evaluate]
```

### Model Development to Deployment
```
[model-developer: train + tune]
              ↓
[ml-engineering-lead: review experiment]
              ↓
[documentation-specialist: model card]
              ↓
  ── HANDOFF: ML Lead → MLOps Lead (card + metrics) ──
              ↓
[ml-deploy-engineer: containerize]
              ↓
[monitoring-engineer: configure monitoring]
              ↓
[mlops-lead: approve go-live]
              ↓
[PRODUCTION]
```

### Incident Detection to Resolution
```
[monitoring-engineer: alert fires]
              ↓
[mlops-lead: triage severity]
              ↓
        ┌─────┴─────┐
   [P1 CRITICAL]  [P2-P3]
        ↓             ↓
   [Rollback]    [Investigate]
        ↓             ↓
   [Root cause]  [Fix + deploy]
        ↓             ↓
   [Post-mortem] [Post-mortem]
```

### Schema Change Impact Assessment
```
[database-engineer: propose change]
              ↓
[data-engineering-lead: scope impact]
              ↓
     ┌────────┴──────────┐
[ml-engineering-lead] [analytics-lead]
     ↓                    ↓
[feature breaks?]    [dashboard breaks?]
     ↓                    ↓
     └────────┬───────────┘
         [All sign off]
              ↓
    [Migration + rollback plan]
              ↓
    [Execute with monitoring]
```

## Escalation Paths

| Level | Conflict Type | Mediator |
|-------|--------------|----------|
| 1 | Within same team | Team lead |
| 2 | Between teams under same director | Director |
| 3 | Between directors | Producer |
| 4 | Unresolvable / strategic | User |

## Handoff Protocol

Every cross-team handoff includes:
1. What was done (deliverables)
2. Quality evidence (test results, metrics)
3. Known limitations or risks
4. What the receiving team does next

## Cross-Team Handoff Gates

| From → To | Required Gate |
|-----------|--------------|
| Data Eng → ML | Data quality checks pass, schema documented, data contract signed |
| ML → MLOps | Model card complete, evaluation meets thresholds, export format specified |
| MLOps → Production | Integration tests pass, monitoring configured, rollback tested, load tested |
| Monitoring → Fix | Alert documented, root cause hypothesis, severity classified |

## Status Reporting Flow

```
Specialists → Lead:     Task completion or blocker (immediate)
Lead → Director:         Weekly status or on-demand
Director → User:         Sprint review or milestone check-in
Producer:                Coordinates all status flows
```
