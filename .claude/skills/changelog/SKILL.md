---
name: Changelog
description: Generate changelog from commits and experiment logs
---
# /changelog
## Purpose
Generate a changelog from git commits, experiment logs, and model changes.
## Workflow
1. Parse git log since last release
2. Categorize changes (features, fixes, models, data)
3. Include relevant experiment results
4. Format changelog
## Agents Involved
- documentation-specialist (writing), producer (review)
## Inputs
- Version range or since-tag
## Outputs
- CHANGELOG.md entry
## Example Usage
```
/changelog --since v1.2.0
```
