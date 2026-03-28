---
path: notebooks/**
description: Standards for Jupyter notebooks
---

# Rules for Notebooks

## Standards
- Clear markdown headers for each section
- Sequential cell execution (runs top-to-bottom)
- No hardcoded paths (use relative or config)
- All imports at the top of the notebook
- Conclusions and findings documented at end
- Random seeds stated for reproducibility

## Required Patterns
- Title and objective in first cell
- Imports consolidated in cell 1-2
- Findings/conclusions in final markdown cell
- Data sources documented

## Forbidden Patterns
- Hardcoded absolute paths
- Scattered imports throughout notebook
- Notebook that fails on Restart & Run All
- Outputs committed to git

## Review Checklist
- [ ] Runs sequentially end-to-end
- [ ] No hardcoded paths
- [ ] Imports at top
- [ ] Conclusions documented
- [ ] Seeds set for reproducibility
- [ ] Outputs cleared before commit
