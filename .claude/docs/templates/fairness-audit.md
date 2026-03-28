# Fairness Audit: {{MODEL_NAME}} v{{VERSION}}

## Protected Attributes
| Attribute | Groups | Source |
|-----------|--------|--------|
|           |        |        |

## Metrics by Group
| Metric | Overall | Group A | Group B | Disparity Ratio |
|--------|---------|---------|---------|-----------------|
| Accuracy | | | | |
| FPR | | | | |
| FNR | | | | |
| Precision | | | | |

## Fairness Criteria
- [ ] **Demographic parity**: Selection rates within {{N}}% across groups
- [ ] **Equalized odds**: FPR and FNR within {{N}}% across groups
- [ ] **Calibration**: Predicted probabilities match observed rates per group

## Bias Mitigation
| Technique | Applied | Result |
|-----------|---------|--------|
| Pre-processing (reweighting) | | |
| In-processing (constraints) | | |
| Post-processing (threshold) | | |

## Findings
{{Summary of fairness analysis}}

## Recommendation
- [ ] Model meets fairness criteria — approve
- [ ] Model requires mitigation — iterate
- [ ] Model fails fairness criteria — reject

## Approval
- **Governance Lead**: [ ] Approved / [ ] Rejected
- **Date**: 
