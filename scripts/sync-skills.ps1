param(
    [string]$SourceRoot = (Join-Path $PSScriptRoot ".."),
    [string]$TargetRoot = "$HOME\.agents\skills",
    [switch]$WhatIf
)

$ErrorActionPreference = "Stop"

$repoRoot = (Resolve-Path $SourceRoot).Path
$skillsRoot = Join-Path $repoRoot "skills"

if (-not (Test-Path $skillsRoot)) {
    throw "Skills directory not found: $skillsRoot"
}

if (-not (Test-Path $TargetRoot)) {
    New-Item -ItemType Directory -Path $TargetRoot -Force | Out-Null
}

$skillDirs = Get-ChildItem -Path $skillsRoot -Directory -Recurse |
    Where-Object { Test-Path (Join-Path $_.FullName "SKILL.md") }

if (-not $skillDirs) {
    Write-Host "No skills found under $skillsRoot"
    exit 0
}

Write-Host "Source: $skillsRoot"
Write-Host "Target: $TargetRoot"
Write-Host ""

foreach ($skillDir in $skillDirs) {
    $skillName = Split-Path $skillDir.FullName -Leaf
    $targetDir = Join-Path $TargetRoot $skillName

    if ($WhatIf) {
        Write-Host "[WhatIf] Sync $skillName"
        Write-Host "         From: $($skillDir.FullName)"
        Write-Host "         To:   $targetDir"
        continue
    }

    New-Item -ItemType Directory -Path $targetDir -Force | Out-Null
    Copy-Item -Path (Join-Path $skillDir.FullName "*") -Destination $targetDir -Recurse -Force

    Write-Host "Synced $skillName -> $targetDir"
}

Write-Host ""
Write-Host "Done."
