<#
.SYNOPSIS
    GSD-Init: GitHub-Driven Get Shit Done (GSD) Setup Script for Antigravity

.DESCRIPTION
    This script initializes a new GSD environment in the target directory by pulling
    the latest version from GitHub. It organizes the files so core directives and
    special Antigravity folders (.agent, .planning) are in the project root, while
    all other GSD system assets are stored in a hidden .gsd folder.

.PARAMETER TargetPath
    The absolute path to the project root where GSD should be installed.
#>

param (
    [Parameter(Mandatory = $true)]
    [string]$TargetPath
)

$ErrorActionPreference = "Stop"

# Configuration
$GSDRepoUrl = "https://github.com/Rauglothgor/gsd-antigravity.git" # Replace with actual public URL if different
$TempDir = Join-Path $env:TEMP "gsd_init_$(Get-Random)"

Write-Host "🚀 Initializing GSD from GitHub in: $TargetPath" -ForegroundColor Cyan

# 1. Clone the GSD repository to a temporary location
if (Test-Path $TempDir) { Remove-Item $TempDir -Recurse -Force }
New-Item -ItemType Directory -Path $TempDir -Force | Out-Null
Write-Host "  [+] Cloning GSD repository..."
git clone $GSDRepoUrl $TempDir --depth 1 | Out-Null

# 2. Create Target Directory Structure
$Folders = @(
    ".gsd",
    ".gsd/memory",
    ".gsd/templates",
    ".agent/workflows",
    ".planning"
)

foreach ($Folder in $Folders) {
    $FullPath = Join-Path $TargetPath $Folder
    if (-not (Test-Path $FullPath)) {
        New-Item -ItemType Directory -Path $FullPath -Force | Out-Null
        Write-Host "  [+] Created $Folder"
    }
}

# 3. Distribute Core Directives (Moved to Root)
$CoreSource = Join-Path $TempDir ".gsd/templates/core"
if (Test-Path $CoreSource) {
    Copy-Item -Path "$CoreSource\*" -Destination $TargetPath -Force
    Write-Host "  [+] Installed Core Directives (MISSION CONTROL) to Root" -ForegroundColor Green
}

# 4. Distribute Workflows (Standard Antigravity location)
$WorkflowSource = Join-Path $TempDir ".gsd/templates/workflows"
if (Test-Path $WorkflowSource) {
    Copy-Item -Path "$WorkflowSource\*" -Destination (Join-Path $TargetPath ".agent/workflows") -Force
    Write-Host "  [+] Installed Workflows to .agent/workflows"
}

# 5. Distribute Planning Templates/Initial State
$PlanningSource = Join-Path $TempDir ".planning"
if (Test-Path $PlanningSource) {
    Copy-Item -Path "$PlanningSource\*" -Destination (Join-Path $TargetPath ".planning") -Force
    Write-Host "  [+] Installed Planning Templates"
}

# 6. Distribute remaining GSD assets
# (Excluding things already moved and .git)
$GsdSystemSource = Join-Path $TempDir ".gsd"
if (Test-Path $GsdSystemSource) {
    Copy-Item -Path "$GsdSystemSource\*" -Destination (Join-Path $TargetPath ".gsd") -Recurse -Force
    Write-Host "  [+] Installed .gsd system library"
}

# 7. Initialize STATE.json
$StateJsonPath = Join-Path $TargetPath ".gsd/STATE.json"
if (-not (Test-Path $StateJsonPath)) {
    $StateObj = @{
        project_name   = (Split-Path $TargetPath -Leaf)
        status         = "initialized"
        initialized_at = (Get-Date -Format "yyyy-MM-dd HH:mm:ss")
        metrics        = @{
            tasks_completed       = 0
            verification_failures = 0
        }
    }
    $StateObj | ConvertTo-Json | Out-File -FilePath $StateJsonPath
    Write-Host "  [+] Initialized STATE.json"
}

# 8. Cleanup
Remove-Item $TempDir -Recurse -Force
Write-Host "  [+] Cleanup complete."

Write-Host "`n✅ GSD successfully installed from GitHub. Open the folder in Antigravity and say 'Initialize new project'." -ForegroundColor Cyan
