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

## Create A New Skill

Use the scaffold script to generate a new skill skeleton:

```powershell
.\scripts\new-skill.ps1 session-resume
```

Create a project-specific skill:

```powershell
.\scripts\new-skill.ps1 econy-closeout -Category projects
```

This creates:

```text
skills/<category>/<skill-name>/
  SKILL.md
  EXAMPLES.md
```

The scaffold only creates a minimal structure. You still fill in the actual workflow, rules, and examples for each skill.

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
- `skills/general/project-mentor`

## Recommended Usage Order

For project-based learning and long-running coding work, a good default sequence is:

1. `project-mentor`
   Use first when a repo feels large, confusing, half-broken, or when you should understand before building.

2. `session-closeout`
   Use at the end of a work session to checkpoint progress, update handoff memory, and prepare the next conversation.

In plain language:

- start with `project-mentor` when you need judgment, project archaeology, study sequencing, or scope control
- end with `session-closeout` when you need a clean handoff and resume prompt

## Common Trigger Phrases

### project-mentor

```text
先别写代码。用 project-mentor 先判断这个需求现在值不值得做，范围是不是太大，本轮最小闭环是什么，验收标准是什么。
```

```text
先把这个项目当教材，不要先当任务。你带我先看懂，再决定要不要动代码。
```

```text
我在这个项目里已经越做越乱了。不要先帮我加功能，先像一个严谨导师一样判断我现在到底该理解什么，不该碰什么。
```

### session-closeout

```text
帮我做一次收尾：判断是否该提交并推送，更新项目记忆和交接信息，必要时同步长期说明文档，并给我一个下次新对话直接续上的提示词。
```

```text
做一次通用收尾：检查仓库状态，决定是否 commit / push，同步项目记忆，必要时更新长期规则，并输出一段可直接复制的新对话续聊提示词。
```

```text
收个尾：看看现在该不该 commit / push，顺手把 handoff 和 progress 更新掉，必要时同步规则文档，最后给我一个新对话续接口令。
```

## Notes

- `general/` is for reusable skills that should work across many repos.
- `projects/` is for repo- or domain-specific skills that depend on local workflows.
- Each installed skill ends up as its own folder directly under your local skills directory.
