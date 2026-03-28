---
name: Model Card
description: Generate model card documentation for a trained model
---

# /model-card

## Purpose
Generate a comprehensive model card following industry standards.

## Workflow
1. Gather model metadata (architecture, training data, parameters)
2. Document intended use and limitations
3. Include performance metrics and fairness analysis
4. Document training procedure and data
5. Add ethical considerations
6. Generate markdown model card

## Agents Involved
- documentation-specialist (writing)
- model-developer (technical details)
- ml-director (review)

## Inputs
- Model path or experiment ID

## Outputs
- MODEL_CARD.md in the model directory

## Example Usage
```
/model-card models/production/fraud_detector_v2
```
