# Hook: detect-gaps.sh

## Overview
Identifies missing tests, model cards, monitoring, docstrings, and ADRs at session start.

## Trigger
- **Event**: SessionStart
- **Timeout**: 10 seconds

## Gaps Detected

### [1/5] Missing Tests
For each src/*.py, checks for test_*.py in tests/. Reports untested modules.

### [2/5] Missing Model Cards
Checks models/trained/ and models/production/ for MODEL_CARD.md.

### [3/5] Unmonitored Pipelines
For each src/pipelines/*.py, checks if name appears in src/monitoring/.

### [4/5] Missing Docstrings
Checks Python files in src/models, src/pipelines, src/api, src/features for docstrings.

### [5/5] Missing ADRs
For projects with >20 source files, checks docs/adr/ for any .md files.

## Dependencies
- Required: bash, find
- Optional: python3
