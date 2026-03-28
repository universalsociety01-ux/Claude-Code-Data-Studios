# Quick Start Guide

## Prerequisites
- Git
- Claude Code CLI (`npm install -g @anthropic-ai/claude-code`)
- Python 3.9+ (recommended)
- Optional: jq, pytest, DVC

## Setup
1. Clone the repository
2. Navigate to the project directory
3. Start Claude Code: `claude`
4. Run `/start` to initialize or detect project state

## First Steps
1. **New project?** Run `/start` — the system will scaffold your project
2. **Existing code?** Run `/reverse-document` to generate documentation
3. **Plan work?** Run `/sprint-plan` to plan your sprint

## Common Workflows

### Build a Data Pipeline
```
/team-pipeline "Description of your pipeline"
```

### Train a Model
```
/team-ml "Description of your model goal"
```

### Run Analysis
```
/team-analysis "Question to investigate"
```

### Deploy to Production
```
/team-deploy "Model to deploy"
```

## Key Commands
| Command | Purpose |
|---------|---------|
| `/start` | Initialize/resume project |
| `/data-quality-check` | Run data validation |
| `/model-evaluate` | Evaluate a model |
| `/drift-check` | Check for drift |
| `/gate-check` | Run quality gate |
| `/sprint-plan` | Plan a sprint |
| `/bug-report` | File a bug report |

## Getting Help
- Review agent roster: `.claude/docs/agent-roster.md`
- Check available skills: `.claude/skills/`
- Read rules for your file type: `.claude/rules/`
