# Codex Personal Skills

Personal skill library for Codex.

## Install / Sync

Use the PowerShell sync script to copy the skills in this repo into your local Codex skills directory:

```powershell
.\scripts\sync-skills.ps1
```

Preview only:

```powershell
.\scripts\sync-skills.ps1 -WhatIf
```

By default the script syncs into:

```text
C:\Users\<you>\.agents\skills
```

You can also override the target:

```powershell
.\scripts\sync-skills.ps1 -TargetRoot "C:\Users\Edward\.agents\skills"
```

This repository is intended to store:

- general-purpose reusable skills
- project-specific skills
- reusable prompt workflows
- handoff and closeout helpers

## Suggested Structure

```text
skills/
  general/
  projects/
```

## Current Skills

- `skills/general/session-closeout`

## Notes

- `general/` is for reusable skills that should work across many repos.
- `projects/` is for repo- or domain-specific skills that depend on local workflows.
- Each installed skill ends up as its own folder directly under your local skills directory.
