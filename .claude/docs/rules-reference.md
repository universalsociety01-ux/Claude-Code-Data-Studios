# Rules Reference

10 path-scoped rules in .claude/rules/:

| Rule | Path | Key Requirements |
|------|------|------------------|
| pipelines | src/pipelines/** | Idempotent, retry, config-driven, logging |
| models | src/models/** | Seeds, types, shapes, device-agnostic |
| features | src/features/** | No leakage, null handling, versioned |
| data | src/data/** | Schema validation, encoding, immutable raw |
| api | src/api/** | Pydantic, health checks, rate limiting |
| notebooks | notebooks/** | Sequential, no hardcoded paths |
| tests | tests/** | Descriptive names, fixtures, parametrized |
| configs | configs/** | No secrets, documented, env overrides |
| sql | **/*.sql | CTEs, no SELECT *, timezone-aware |
| monitoring | src/monitoring/** | Structured JSON, metric naming, runbooks |
