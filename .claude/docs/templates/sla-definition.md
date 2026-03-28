# SLA Definition: {{SERVICE_NAME}}

## Service Level Objectives
| SLO | Target | Measurement |
|-----|--------|-------------|
| Availability | 99.9% | Uptime / total time |
| Latency (p50) | < {{N}}ms | Median response time |
| Latency (p99) | < {{N}}ms | 99th percentile |
| Error rate | < {{N}}% | 5xx / total requests |
| Data freshness | < {{N}} hours | Time since last update |

## Service Level Indicators
| SLI | Source | Query/Dashboard |
|-----|--------|-----------------|
|     |        |                 |

## Error Budget
- **Monthly budget**: {{N}}% downtime = {{N}} minutes
- **Burn rate alert**: > {{N}}x normal triggers page

## Escalation
| Severity | Response time | Resolution time | Who |
|----------|--------------|-----------------|-----|
| P1 | 15 min | 4 hours | On-call + lead |
| P2 | 1 hour | 24 hours | On-call |
| P3 | 4 hours | 1 week | Assigned engineer |

## Review Cadence
- Weekly: SLI dashboard review
- Monthly: Error budget review
- Quarterly: SLO target evaluation
