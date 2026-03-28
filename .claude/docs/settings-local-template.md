# Local Settings Template

Template for `.claude/settings.local.json` — your personal overrides for Claude Code Data Studios settings. This file is gitignored and will not be committed.

## Setup

```bash
cp .claude/docs/settings-local-template.md .claude/settings.local.json
# Then edit .claude/settings.local.json with your customizations
```

## Template

```json
{
  "permissions": {
    "allow": [
      "Bash(git *)",
      "Bash(python *)",
      "Bash(pip install *)",
      "Bash(docker *)",
      "Bash(kubectl *)",
      "Bash(aws *)",
      "Bash(gcloud *)",
      "Bash(terraform *)",
      "Bash(pytest *)",
      "Read",
      "Write",
      "Edit"
    ],
    "deny": [
      "Bash(rm -rf /)",
      "Bash(sudo rm *)",
      "Bash(* --force)",
      "Bash(DROP DATABASE *)",
      "Bash(kubectl delete namespace *)"
    ]
  }
}
```

## Common Customizations

### Add Tool Permissions

Allow specific tools that the default settings block:

```json
{
  "permissions": {
    "allow": [
      "Bash(docker compose *)",
      "Bash(helm *)",
      "Bash(make *)",
      "Bash(npm *)",
      "Bash(cargo *)"
    ]
  }
}
```

### Disable Specific Hooks

To disable a hook, override its trigger in your local settings. For example, to skip push validation during rapid prototyping:

```json
{
  "hooks": {
    "PreToolUse": []
  }
}
```

**Warning:** Disabling hooks removes quality gates. Re-enable before pushing to shared branches.

### Add Custom Hooks

Add project-specific hooks alongside the defaults:

```json
{
  "hooks": {
    "PostToolUse": [
      {
        "matcher": "Write",
        "hooks": [
          {
            "type": "command",
            "command": "bash .claude/hooks/my-custom-validator.sh"
          }
        ]
      }
    ]
  }
}
```

### Adjust Hook Timeouts

Add timeout (in milliseconds) for slow hooks:

```json
{
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "Bash",
        "hooks": [
          {
            "type": "command",
            "command": "bash .claude/hooks/validate-push.sh",
            "timeout": 60000
          }
        ]
      }
    ]
  }
}
```

### Environment-Specific Settings

#### For GPU Development
```json
{
  "permissions": {
    "allow": [
      "Bash(nvidia-smi *)",
      "Bash(python -m torch.distributed *)",
      "Bash(torchrun *)"
    ]
  }
}
```

#### For Cloud Development (AWS)
```json
{
  "permissions": {
    "allow": [
      "Bash(aws s3 *)",
      "Bash(aws sagemaker *)",
      "Bash(aws ecr *)",
      "Bash(aws ecs *)"
    ]
  }
}
```

#### For Cloud Development (GCP)
```json
{
  "permissions": {
    "allow": [
      "Bash(gcloud *)",
      "Bash(gsutil *)",
      "Bash(bq *)"
    ]
  }
}
```

## Merging Behavior

Local settings are merged with the project's `.claude/settings.json`:
- `permissions.allow` — local entries are **added** to project allows
- `permissions.deny` — local entries are **added** to project denies
- `hooks` — local entries **override** project hooks for the same trigger

## Best Practices

1. **Start minimal** — only add permissions you actually need
2. **Never allow destructive commands** — keep `deny` rules for dangerous operations
3. **Re-enable hooks before sharing code** — disabled hooks mean unchecked code
4. **Don't commit this file** — it's in `.gitignore` for a reason
5. **Document why** — add comments explaining non-obvious permissions
