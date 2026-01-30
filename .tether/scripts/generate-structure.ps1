# Generate STRUCTURE.md
# Creates a tree view of project structure for human reference

param(
    [int]$MaxDepth = 3,
    [string]$OutputFile = "STRUCTURE.md"
)

$excludeDirs = @('.git', 'node_modules', '__pycache__', '.venv', 'venv', 'dist', 'build', '.next')

Write-Host "Generating project structure..." -ForegroundColor Cyan

$header = @"
# Project Structure

> Auto-generated on $(Get-Date -Format "yyyy-MM-dd HH:mm")
> Depth: $MaxDepth levels

``````
"@

$footer = @"
``````

## Key Directories

| Directory | Purpose |
|:--|:--|
| ``.planning/`` | Project goals, roadmap, decisions |
| ``.tether/`` | TETHER configuration and knowledge |
| ``.agent/`` | Antigravity workflows |
| ``src/`` | Source code |
| ``src/tools/`` | Auto-discovered project tools |

---
*Regenerate with: ``.\\.tether\\scripts\\generate-structure.ps1``*
"@

# Try tree command first, fall back to custom implementation
try {
    $treeOutput = & tree /F /A 2>$null | Select-Object -Skip 2 | Select-Object -First 100
    if ($LASTEXITCODE -eq 0 -and $treeOutput) {
        $content = $header + ($treeOutput -join "`n") + "`n" + $footer
    }
    else {
        throw "tree command failed"
    }
}
catch {
    # Fallback: Use Get-ChildItem
    function Show-Tree {
        param([string]$Path, [int]$Depth = 0, [int]$MaxD = 3)
        
        if ($Depth -ge $MaxD) { return }
        
        $items = Get-ChildItem -Path $Path -Force -ErrorAction SilentlyContinue | 
        Where-Object { $_.Name -notin $excludeDirs -and -not $_.Name.StartsWith('.git') }
        
        foreach ($item in $items) {
            $indent = "  " * $Depth
            $prefix = if ($item.PSIsContainer) { "[DIR] " } else { "" }
            "$indent$prefix$($item.Name)"
            
            if ($item.PSIsContainer) {
                Show-Tree -Path $item.FullName -Depth ($Depth + 1) -MaxD $MaxD
            }
        }
    }
    
    $treeOutput = Show-Tree -Path "." -MaxD $MaxDepth
    $content = $header + ($treeOutput -join "`n") + "`n" + $footer
}

$content | Out-File -FilePath $OutputFile -Encoding UTF8

Write-Host "Created $OutputFile" -ForegroundColor Green
