---
name: Hyperparameter Sweep
description: Design and execute hyperparameter optimization
---

# /hyperparameter-sweep

## Purpose
Design and run hyperparameter optimization with proper experiment tracking.

## Workflow
1. Define search space based on model type
2. Select optimization strategy (Bayesian, random, grid)
3. Configure budget (trials, time, compute)
4. Execute sweep with experiment tracking
5. Analyze results and recommend best config
6. Document findings

## Agents Involved
- model-developer (design and execution)
- deep-learning-engineer (compute optimization)
- cost-analyst (budget assessment)

## Inputs
- Model path and training script
- Optional: search space, budget constraints

## Outputs
- Best hyperparameter configuration
- Sweep results visualization
- Cost report

## Example Usage
```
/hyperparameter-sweep --model src/models/classifier.py --trials 50
```
