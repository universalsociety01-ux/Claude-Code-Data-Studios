---
name: A/B Test Analyze
description: Analyze A/B test results with statistical rigor
---

# /ab-test-analyze

## Purpose
Statistically rigorous analysis of A/B test results.

## Workflow
1. Load experiment data
2. Validate randomization and sample sizes
3. Compute primary and secondary metrics
4. Run statistical tests (t-test, chi-squared, Mann-Whitney)
5. Calculate effect sizes and confidence intervals
6. Check for novelty/primacy effects
7. Segment analysis
8. Generate report with recommendation

## Agents Involved
- experiment-analyst (primary analysis)
- analytics-lead (review)

## Inputs
- Experiment data or ID
- Primary metric, variants

## Outputs
- Statistical analysis report
- Recommendation (ship/iterate/kill)

## Example Usage
```
/ab-test-analyze --experiment checkout_redesign --metric conversion_rate
```
