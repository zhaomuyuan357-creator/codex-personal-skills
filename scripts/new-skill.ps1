param(
    [Parameter(Mandatory = $true)]
    [string]$Name,
    [ValidateSet("general", "projects")]
    [string]$Category = "general",
    [string]$Root
)

$ErrorActionPreference = "Stop"

if (-not $Root) {
    $Root = Join-Path (Split-Path -Parent $PSCommandPath) ".."
}

function Convert-ToSkillSlug {
    param([string]$Value)

    $slug = $Value.Trim().ToLower()
    $slug = $slug -replace "[^a-z0-9\- ]", ""
    $slug = $slug -replace "\s+", "-"
    $slug = $slug -replace "-{2,}", "-"
    $slug = $slug.Trim("-")

    if (-not $slug) {
        throw "Skill name must contain at least one English letter or number after normalization."
    }

    return $slug
}

$repoRoot = (Resolve-Path $Root).Path
$slug = Convert-ToSkillSlug -Value $Name
$skillDir = Join-Path $repoRoot "skills\$Category\$slug"

if (Test-Path $skillDir) {
    throw "Skill already exists: $skillDir"
}

New-Item -ItemType Directory -Path $skillDir -Force | Out-Null

$skillTemplate = @'
---
name: __SKILL_NAME__
description: Briefly describe what this skill does. Use when [specific trigger words, situations, or user intents].
---

# __SKILL_NAME__

## Purpose

Explain in one sentence what problem this skill solves.

## Use Cases

- When a user would use this skill
- Which requests should trigger it
- What this skill should not handle

## Workflow

1. First step
2. Second step
3. Third step

## Decision Rules

- When to continue
- When to pause and confirm
- When not to proceed

## Output Requirements

- What the final result should include
- What wording or behavior to avoid

## Trigger Examples

- "Put a real user phrase here"
'@

$examplesTemplate = @'
# __SKILL_NAME__ Examples

## Short Trigger

```text
Put a short trigger here
```

## Common Wording

```text
Put a phrase you really say here
```

## Full Wording

```text
Put a more complete trigger here
```
'@

$skillMd = $skillTemplate.Replace("__SKILL_NAME__", $slug)
$examplesMd = $examplesTemplate.Replace("__SKILL_NAME__", $slug)

Set-Content -Path (Join-Path $skillDir "SKILL.md") -Value $skillMd -Encoding UTF8
Set-Content -Path (Join-Path $skillDir "EXAMPLES.md") -Value $examplesMd -Encoding UTF8

Write-Host "Created skill scaffold:"
Write-Host "  $skillDir"
