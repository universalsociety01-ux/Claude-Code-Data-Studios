# Contributing to Claude Code Data Studios

Thank you for your interest in contributing!

## Getting Started

1. Fork the repository
2. Clone your fork
3. Create a feature branch: git checkout -b feature/your-feature
4. Make your changes
5. Commit with a descriptive message
6. Push to your fork
7. Open a Pull Request

## What You Can Contribute

### Agents
- New specialist agents for emerging domains (RL, graph ML, etc.)
- Enhanced prompts and decision frameworks for existing agents

### Skills (Slash Commands)
- New workflow automations
- Domain-specific skills

### Hooks
- New validation hooks
- Enhanced checks, platform-specific hooks

### Templates
- New document templates for data/ML workflows
- Industry-specific templates

### Rules
- New path-scoped coding standards
- Framework-specific rules

### Documentation
- Tutorials, guides, use case examples

## File Formats

**Agents** (.claude/agents/): Markdown with YAML frontmatter (name, model, tier)

**Skills** (.claude/skills/{name}/SKILL.md): Markdown with YAML frontmatter (name, description)

**Hooks** (.claude/hooks/*.sh): Bash, handle JSON stdin, exit 0=pass / exit 2=block

**Rules** (.claude/rules/*.md): Standards, Required Patterns, Forbidden Patterns, Checklist

**Templates** (.claude/docs/templates/*.md): Use {{PLACEHOLDER}} for variables

## Standards

- Shell: bash, set -e, POSIX-compatible where possible
- Markdown: proper headings, consistent formatting
- No secrets or credentials in any files
- Test on Windows (Git Bash), macOS, and Linux

## Commit Messages

Format: type: short description
Types: feat, fix, docs, refactor, test, chore

## Pull Request Process

1. Update README.md and CLAUDE.md if adding features
2. Update relevant docs in .claude/docs/
3. Ensure hooks pass
4. Request review

## Code of Conduct

See CODE_OF_CONDUCT.md
