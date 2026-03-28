---
name: Start
description: Initialize or resume a data project, detect current state
---
# /start
## Purpose
Initialize a new data project or detect and resume an existing one.
## Workflow
1. Scan project structure and git history
2. Detect project stage (new, data-prep, modeling, evaluation, deployment)
3. Identify what's been done and what's pending
4. Show current status summary
5. Suggest next steps
## Agents Involved
- producer (coordination), data-director (assessment), ml-director (assessment)
## Inputs
- None (auto-detects)
## Outputs
- Project status summary and recommended next steps
## Example Usage
```
/start
```
