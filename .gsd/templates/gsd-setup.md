---
description: Initialize Get Shit Done (GSD) System from GitHub
---

# GSD Setup Workflow

Use this workflow to pull the GSD methodology into any project workspace.

## Configuration
- **Repository**: `https://github.com/Rauglothgor/gsd-antigravity.git`

## Trigger
- "Initialize GSD"
- "Bootstrap GSD"
- "Install mission control"

## Actions
1. **Pull System**:
    - Clone the GSD repository into the current project root.
    - `git clone https://github.com/Rauglothgor/gsd-antigravity.git . --depth 1`
2. **Setup State**:
    - Create `.gsd/STATE.json` with initial metrics.
3. **Activate**:
    - Confirm that Antigravity should now follow the rules in `00_ARCHITECT_BRAIN.md`.

## User Instructions
To enable this globally across your PCs:
1. Copy this file to `~/.gemini/antigravity/workflows/gsd-setup.md`.
2. In any project, say: **"Initialize GSD"**.
