---
description: Initialize TETHER System from GitHub
---

# TETHER Setup Workflow

Use this workflow to pull the TETHER methodology into any project workspace.

## Configuration
- **Repository**: `https://github.com/Rauglothgor/tether-antigravity.git`

## Trigger
- "Initialize TETHER"
- "Bootstrap TETHER"
- "Install mission control"

## Actions
1. **Pull System**:
    - Clone the TETHER repository into the current project root.
    - `git clone https://github.com/Rauglothgor/tether-antigravity.git . --depth 1`
2. **Setup State**:
    - Create `.tether/STATE.json` with initial metrics.
3. **Activate**:
    - Confirm that Antigravity should now follow the rules in `00_ARCHITECT_BRAIN.md`.

## User Instructions
To enable this globally across your PCs:
1. Copy this file to `~/.gemini/antigravity/workflows/tether-setup.md`.
2. In any project, say: **"Initialize TETHER"**.
