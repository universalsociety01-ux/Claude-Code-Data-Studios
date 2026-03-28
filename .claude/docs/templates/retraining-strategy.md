# Retraining Strategy: {{MODEL_NAME}}

## Trigger Conditions
| Trigger | Metric | Threshold | Action |
|---------|--------|-----------|--------|
| Scheduled | Time | Every {{N}} days | Automatic retrain |
| Performance | {{metric}} | < {{value}} | Alert + manual retrain |
| Data drift | PSI | > {{value}} | Alert + evaluate |
| Volume change | Row count | ± {{N}}% | Investigate |

## Retraining Pipeline
1. **Data extraction**: {{window, filters}}
2. **Validation**: Data quality checks
3. **Training**: {{framework, config}}
4. **Evaluation**: {{metrics, thresholds}}
5. **Comparison**: vs current production model
6. **Promotion**: Automatic if metrics improve, manual otherwise

## Rollback
- Keep last {{N}} model versions
- Rollback trigger: {{condition}}
- Rollback procedure: {{steps}}

## Resource Requirements
- **Training**: {{GPU/CPU, memory, time}}
- **Storage**: {{model size × versions}}
- **Cost per retrain**: ${{estimate}}

## Approval
- **Automatic promotion**: If all metrics improve by ≥ {{N}}%
- **Manual review**: If any metric degrades or new data source
