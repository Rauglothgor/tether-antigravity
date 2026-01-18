<#
.SYNOPSIS
    GSD Evergreen Documentation Scanner - Prevents documentation drift.
.DESCRIPTION
    Scans markdown files for deprecated patterns (folders, scripts, terminology)
    that could mislead AI agents into using legacy workflows.
.NOTES
    Exit Codes:
    - 0: PASS - No documentation residue detected
    - 1: FAIL - Legacy patterns found (blocks downstream operations)
.EXAMPLE
    .\.gsd\scripts\verify-evergreen-docs.ps1
    .\.gsd\scripts\verify-evergreen-docs.ps1 -ConfigPath ".\.gsd\evergreen-config.yaml"
#>

param(
    [Parameter(Mandatory = $false)]
    [string]$ConfigPath = "",
    
    [Parameter(Mandatory = $false)]
    [string]$SearchPath = ".",
    
    [Parameter(Mandatory = $false)]
    [switch]$ShowContext
)

# ============================================================================
# DEFAULT CONFIGURATION (GSD-Level Defaults - Option B)
# ============================================================================
$DefaultConfig = @{
    Version          = "1.0"
    ForbiddenFolders = @(
        "_engine/",
        "_reviews/",
        "_outlines/",
        "_decisions/",
        "_config/",
        "_craft/"
    )
    ForbiddenScripts = @(
        "orchestrator_client.py",
        "orchestrator-client.ps1",
        "enforce-integrity.ps1",
        "verify-integrity.ps1"
    )
    ForbiddenTerms   = @(
        # Add project-specific legacy terms here
    )
    SkipPaths        = @(
        ".gsd\archive",
        ".gsd\meta",
        ".gsd\memory",
        "node_modules",
        ".git",
        ".next",
        "dist",
        "build"
    )
}

# ============================================================================
# CONFIGURATION LOADER
# ============================================================================
function Load-EvergreenConfig {
    param([string]$Path)
    
    # Priority: Explicit path > Project config > Defaults
    $configFile = if ($Path) { $Path }
    elseif (Test-Path ".\.gsd\evergreen-config.yaml") { ".\.gsd\evergreen-config.yaml" }
    elseif (Test-Path ".\evergreen-config.yaml") { ".\evergreen-config.yaml" }
    else { $null }
    
    if ($configFile -and (Test-Path $configFile)) {
        Write-Host "[CONFIG] Loading: $configFile" -ForegroundColor Cyan
        
        # Parse YAML manually (PowerShell doesn't have native YAML support)
        $content = Get-Content $configFile -Raw
        $config = @{
            ForbiddenFolders = @()
            ForbiddenScripts = @()
            ForbiddenTerms   = @()
            SkipPaths        = @()
        }
        
        $currentSection = $null
        foreach ($line in ($content -split "`n")) {
            $line = $line.Trim()
            if ($line -match '^forbidden_folders:') { $currentSection = 'ForbiddenFolders' }
            elseif ($line -match '^forbidden_scripts:') { $currentSection = 'ForbiddenScripts' }
            elseif ($line -match '^forbidden_terms:') { $currentSection = 'ForbiddenTerms' }
            elseif ($line -match '^skip_paths:') { $currentSection = 'SkipPaths' }
            elseif ($line -match '^\s*-\s*"?(.+?)"?\s*$' -and $currentSection) {
                $value = $Matches[1].Trim('"', "'")
                $config[$currentSection] += $value
            }
        }
        
        # Merge with defaults (project config extends, doesn't replace)
        return @{
            ForbiddenFolders = ($DefaultConfig.ForbiddenFolders + $config.ForbiddenFolders) | Select-Object -Unique
            ForbiddenScripts = ($DefaultConfig.ForbiddenScripts + $config.ForbiddenScripts) | Select-Object -Unique
            ForbiddenTerms   = ($DefaultConfig.ForbiddenTerms + $config.ForbiddenTerms) | Select-Object -Unique
            SkipPaths        = ($DefaultConfig.SkipPaths + $config.SkipPaths) | Select-Object -Unique
        }
    }
    
    Write-Host "[CONFIG] Using GSD defaults (no project config found)" -ForegroundColor Yellow
    return $DefaultConfig
}

# ============================================================================
# PATTERN SCANNER
# ============================================================================
function Test-EvergreenPatterns {
    param(
        [hashtable]$Config,
        [string]$BasePath
    )
    
    $violations = @()
    
    # Get all markdown files, excluding skip paths
    $mdFiles = Get-ChildItem -Path $BasePath -Filter "*.md" -Recurse -File -ErrorAction SilentlyContinue | Where-Object {
        $filePath = $_.FullName
        $skip = $false
        foreach ($skipPath in $Config.SkipPaths) {
            if ($filePath -like "*$skipPath*") {
                $skip = $true
                break
            }
        }
        -not $skip
    }
    
    Write-Host "[SCAN] Checking $($mdFiles.Count) markdown files..." -ForegroundColor Cyan
    
    foreach ($file in $mdFiles) {
        $content = Get-Content $file.FullName -Raw -ErrorAction SilentlyContinue
        if (-not $content) { continue }
        
        $relativePath = $file.FullName.Replace((Get-Location).Path + "\", "")
        $fileViolations = @()
        
        # Check forbidden folder references
        foreach ($folder in $Config.ForbiddenFolders) {
            if ($content -match [regex]::Escape($folder)) {
                $fileViolations += @{
                    Type    = "ForbiddenFolder"
                    Pattern = $folder
                    Context = ($content | Select-String -Pattern ".*$([regex]::Escape($folder)).*" -AllMatches).Matches.Value | Select-Object -First 1
                }
            }
        }
        
        # Check forbidden script references
        foreach ($script in $Config.ForbiddenScripts) {
            if ($content -match [regex]::Escape($script)) {
                $fileViolations += @{
                    Type    = "ForbiddenScript"
                    Pattern = $script
                    Context = ($content | Select-String -Pattern ".*$([regex]::Escape($script)).*" -AllMatches).Matches.Value | Select-Object -First 1
                }
            }
        }
        
        # Check forbidden terminology
        foreach ($term in $Config.ForbiddenTerms) {
            if ($term -and $content -match "\b$([regex]::Escape($term))\b") {
                $fileViolations += @{
                    Type    = "ForbiddenTerm"
                    Pattern = $term
                    Context = ($content | Select-String -Pattern ".*\b$([regex]::Escape($term))\b.*" -AllMatches).Matches.Value | Select-Object -First 1
                }
            }
        }
        
        if ($fileViolations.Count -gt 0) {
            $violations += @{
                File   = $relativePath
                Issues = $fileViolations
            }
        }
    }
    
    return $violations
}

# ============================================================================
# REPORT FORMATTER
# ============================================================================
function Format-EvergreenReport {
    param([array]$Violations)
    
    if ($Violations.Count -eq 0) {
        Write-Host ""
        Write-Host "========================================" -ForegroundColor Green
        Write-Host " EVERGREEN CHECK: PASS" -ForegroundColor Green
        Write-Host " No documentation residue detected." -ForegroundColor Green
        Write-Host "========================================" -ForegroundColor Green
        return 0
    }
    
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Red
    Write-Host " EVERGREEN CHECK: FAIL" -ForegroundColor Red
    Write-Host " Documentation residue detected!" -ForegroundColor Red
    Write-Host "========================================" -ForegroundColor Red
    Write-Host ""
    
    $totalIssues = 0
    foreach ($violation in $Violations) {
        Write-Host "FILE: $($violation.File)" -ForegroundColor Yellow
        foreach ($issue in $violation.Issues) {
            $totalIssues++
            $icon = switch ($issue.Type) {
                "ForbiddenFolder" { "[FOLDER]" }
                "ForbiddenScript" { "[SCRIPT]" }
                "ForbiddenTerm" { "[TERM]  " }
            }
            Write-Host "  $icon $($issue.Pattern)" -ForegroundColor Red
            if ($issue.Context -and $ShowContext) {
                Write-Host "         Context: $($issue.Context.Substring(0, [Math]::Min(80, $issue.Context.Length)))..." -ForegroundColor DarkGray
            }
        }
        Write-Host ""
    }
    
    Write-Host "----------------------------------------" -ForegroundColor Red
    Write-Host "TOTAL: $($Violations.Count) files with $totalIssues violations" -ForegroundColor Red
    Write-Host ""
    Write-Host "REMEDIATION:" -ForegroundColor Cyan
    Write-Host "  1. Update the listed files to remove deprecated references." -ForegroundColor White
    Write-Host "  2. If a pattern is valid, add it to .gsd/evergreen-config.yaml skip_paths." -ForegroundColor White
    Write-Host "  3. Re-run this script to verify fixes." -ForegroundColor White
    Write-Host ""
    
    return 1
}

# ============================================================================
# MAIN EXECUTION
# ============================================================================
Write-Host ""
Write-Host "GSD Evergreen Documentation Scanner v1.0" -ForegroundColor Magenta
Write-Host "========================================" -ForegroundColor Magenta
Write-Host ""

# Load configuration
$config = Load-EvergreenConfig -Path $ConfigPath

# Run scan
$violations = Test-EvergreenPatterns -Config $config -BasePath $SearchPath

# Generate report and exit
$exitCode = Format-EvergreenReport -Violations $violations
exit $exitCode
