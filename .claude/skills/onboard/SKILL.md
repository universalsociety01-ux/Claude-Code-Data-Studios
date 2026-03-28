---
name: Onboard
description: Generate onboarding documentation for new team members
---

# /onboard

## Purpose
Create comprehensive onboarding documentation for the current project.

## Workflow
1. Scan project structure and key components
2. Read CLAUDE.md, configs, existing docs
3. Identify tech stack, dependencies, tools
4. Map key data flows and ML pipelines
5. Document environment setup steps
6. Generate onboarding guide from template

## Agents Involved
- documentation-specialist (primary)
- data-director + ml-director (overview)

## Inputs
- Project directory (auto-detected)
- Optional: target audience

## Outputs
- Onboarding guide in docs/
