# A/B Test Design: {{TEST_NAME}}

## Hypothesis
- **H0**: {{Null hypothesis}}
- **H1**: {{Alternative hypothesis}}

## Design
- **Primary metric**: 
- **Secondary metrics**: 
- **Randomization unit**: user | session | request
- **Variants**: control, treatment
- **Traffic split**: 50/50

## Power Analysis
- **Minimum detectable effect**: 
- **Significance level (α)**: 0.05
- **Power (1-β)**: 0.80
- **Required sample size**: 

## Guard Rails
- {{Metrics that must not degrade}}

## Duration
- **Estimated**: 
- **Maximum**: 

## Analysis Plan
1. Check randomization balance
2. Compute primary metric per variant
3. Run statistical test
4. Check guard rail metrics
5. Segment analysis
6. Decision and documentation
