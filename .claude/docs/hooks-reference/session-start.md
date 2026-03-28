# Hook: session-start.sh

## Overview
Loads project context when a Claude Code session begins.

## Trigger
- **Event**: SessionStart
- **Timeout**: 10 seconds

## What It Loads

### Git Context
- Current branch, last 5 commits, uncommitted changes (first 10)

### Project Stage
- Reads production/stage.txt for CRISP-DM lifecycle phase

### Current Sprint
- First 10 lines from production/sprints/current.md

### Latest Experiment
- Most recent .md in experiments/ (name + first 5 lines)

### Active Task
- First 10 lines from production/session-state/active.md

### Session Recovery
- Checks .claude/session-state/ for post-compact saved state

### Drift Alerts
- Counts JSON alert files in src/monitoring/alerts/

## Dependencies
- Required: bash
- Optional: git
