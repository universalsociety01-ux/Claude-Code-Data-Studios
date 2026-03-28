# Data Contract: {{DATASET_NAME}}

## Metadata
- **Version**: 1.0
- **Owner**: 
- **Updated**: {{DATE}}
- **SLA**: {{FRESHNESS_SLA}}

## Schema
| Column | Type | Nullable | Description | Constraints |
|--------|------|----------|-------------|-------------|
|        |      |          |             |             |

## Quality Expectations
- **Completeness**: ≥ {{N}}% non-null for required columns
- **Freshness**: Updated within {{N}} hours
- **Volume**: {{MIN}} – {{MAX}} rows per batch
- **Uniqueness**: {{COLUMNS}} must be unique

## Upstream
- **Source system**: 
- **Ingestion method**: 
- **Contact**: 

## Downstream Consumers
| Consumer | Usage | Impact if broken |
|----------|-------|------------------|
|          |       |                  |

## SLA & Alerting
- **Data freshness SLA**: 
- **Alert channel**: 
- **Escalation**: 

## Change Management
- Schema changes require: {{N}} days notice + downstream impact review
- Breaking changes require: consumer sign-off
