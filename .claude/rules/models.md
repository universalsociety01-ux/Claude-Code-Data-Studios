---
path: src/models/**
description: Standards for ML model code
---

# Rules for ML Models

## Standards
- Reproducibility: seed all random sources (random, numpy, torch, etc.)
- Type hints mandatory on all function signatures
- Docstrings with input/output tensor shapes
- No data loading in model code (separation of concerns)
- Config-driven hyperparameters (no magic numbers)
- Device-agnostic code (CPU/GPU transparent)
- Gradient checkpointing for models > 1B parameters

## Required Patterns
- `def __init__(self, config: ModelConfig)` pattern
- Type hints on all public methods
- Shape documentation in docstrings: `# (batch, seq_len, hidden)`
- Explicit device handling via config or argument

## Forbidden Patterns
- Data loading inside model classes
- Hardcoded hyperparameters
- `.cuda()` calls (use `.to(device)` instead)
- Unseeded random operations
- Print statements (use logging)

## Review Checklist
- [ ] Random seeds set
- [ ] Type hints on all functions
- [ ] Docstrings with shapes
- [ ] No data loading in model
- [ ] Config-driven hyperparameters
- [ ] Device-agnostic
- [ ] Experiment logged
