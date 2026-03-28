# Directory Structure

## Root Files
- CLAUDE.md — master configuration
- README.md — project overview
- .gitignore — git exclusions

## .claude/ — Claude Code Configuration
- settings.json — hooks, permissions, safety
- statusline.sh — real-time status display
- agents/ — 42 agent definitions (directors, leads, specialists)
- skills/ — 42 slash commands (directory/SKILL.md format)
- hooks/ — 9 automation scripts
- rules/ — 10 path-scoped coding standards
- docs/ — documentation, templates, references

## src/ — Production Source Code
- pipelines/ — ETL/ELT pipeline code (owned by DE lead)
- models/ — Model architectures and training (owned by ML lead)
- features/ — Feature engineering (owned by feature-engineer)
- data/ — Data loading and processing (owned by DE lead)
- utils/ — Shared utilities
- api/ — Model serving API (owned by MLOps lead)
- monitoring/ — Monitoring and alerting (owned by monitoring-engineer)

## data/ — Data Assets
- raw/ — Immutable raw data (gitignored)
- processed/ — Cleaned, transformed data
- external/ — Third-party data
- interim/ — Intermediate processing artifacts

## models/ — Model Artifacts
- trained/ — From training runs (gitignored)
- staging/ — Being validated
- production/ — Production-ready (each needs MODEL_CARD.md)

## Other
- notebooks/ — Jupyter (exploration, experiments, reports)
- configs/ — YAML configs (pipelines, models, infrastructure)
- tests/ — Test suites (unit, integration, data-quality)
- docs/ — Architecture docs, ADRs, runbooks
- experiments/ — Experiment logs and results
- production/ — Sprint tracking, milestones, session state
