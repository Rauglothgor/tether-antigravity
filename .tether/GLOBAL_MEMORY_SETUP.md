# Global Memory Setup (`.thoughts/` Directory)

> **Purpose**: Cross-project learning. AI learns from ALL your past projects, not just the current one.

## Quick Setup (Windows)

```powershell
# Create global memory directory
mkdir -p "$env:USERPROFILE\antigravity-global-memory\solutions"
mkdir -p "$env:USERPROFILE\antigravity-global-memory\patterns"
mkdir -p "$env:USERPROFILE\antigravity-global-memory\mistakes"
mkdir -p "$env:USERPROFILE\antigravity-global-memory\decisions"
mkdir -p "$env:USERPROFILE\antigravity-global-memory\discoveries"
```

## Per-Project Symlink

In each project that uses TETHER, create a symlink:

```powershell
# From your project root
cd C:\path\to\your\project
New-Item -ItemType SymbolicLink -Path ".thoughts" -Target "$env:USERPROFILE\antigravity-global-memory"
```

Or manually: Create a `.thoughts/` folder in your project and reference the global directory.

## Directory Structure

```
~/antigravity-global-memory/
├── solutions/          # Past problem solutions (indexed by problem type)
├── patterns/           # Reusable code patterns (indexed by tech stack)
├── mistakes/           # Things that didn't work (prevent repeating)
├── decisions/          # Architecture decisions (cross-project learnings)
└── discoveries/        # Useful findings (APIs, tools, techniques)
```

## How AI Uses This

1. **Before starting work**: AI checks `.thoughts/` for relevant past solutions
2. **After fixing bugs**: AI logs the fix in `mistakes/` to prevent recurrence
3. **After major decisions**: AI documents reasoning in `decisions/`
4. **After discovering useful info**: AI captures it in `discoveries/`

## File Naming Convention

```
[date]_[project]_[topic].md

Examples:
- 2026-01-30_sniktarr_docker-sqlite-permissions.md
- 2026-01-28_venturescan_gemini-api-rate-limits.md
- 2026-01-15_general_react-form-validation-pattern.md
```

## Benefits

- **Never solve the same problem twice**: Past solutions are always available
- **Cross-project learning**: Fix in Project A helps Project B
- **Onboarding speed**: New conversations start with accumulated knowledge
- **Pattern library**: Your personal best practices grow over time

## Troubleshooting

**Symlink not working on Windows?**
- Run PowerShell as Administrator
- Or enable Developer Mode in Windows Settings

**AI not reading .thoughts/?**
- Ensure `.thoughts/` is not in `.gitignore` (or use a different name)
- Explicitly ask AI to "check .thoughts/ for relevant solutions"
