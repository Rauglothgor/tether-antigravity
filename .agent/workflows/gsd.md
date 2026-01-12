---
description: Get Shit Done (GSD) Workflow for Antigravity
---

# GSD Workflow

This workflow replicates the core features of the `get-shit-done` repository for native use in Antigravity.

## Core Commands (Simulation)

To run a GSD command, simply ask Antigravity to perform the following:

### 1. New Project (`gsd:new-project`)
- **Action**: Ask Antigravity to "Initialize a new GSD project".
- **Process**:
    1. Agent will create `.planning/PROJECT.md` and `.planning/ROADMAP.md`.
    2. Agent will perform deep questioning to define goals and constraints.
    3. Agent will initialize a git repository if one doesn't exist.

### 2. Create Roadmap (`gsd:create-roadmap`)
- **Action**: Ask Antigravity to "Generate a GSD roadmap".
- **Process**:
    1. Agent reads `PROJECT.md`.
    2. Agent generates a multi-phase `ROADMAP.md`.
    3. User reviews and approves.

### 3. Execute Plan (`gsd:execute-plan`)
- **Action**: Ask Antigravity to "Execute the current GSD phase".
- **Process**:
    0. **System Doctor**: Agent runs a pre-flight check (dependencies, env vars) to ensure the environment is ready.
    1. Agent sets a `task_boundary` with the phase name.
    2. Agent populates `task.md` with items from the `ROADMAP.md`.
    3. Agent executes tasks with atomic commits using the `00_ARCHITECT_BRAIN.md` rules.
    4. **Skeptic Mode**: Agent explicitly questions its own assumptions before finalizing any plan ("What if this fails?").

### 4. Complete Milestone (`gsd:complete-milestone`)
- **Action**: Ask Antigravity to "Finalize the current milestone".
- **Process**:
    1. **Strict Definition of Done**: Agent MUST verify that `ROADMAP.md` and `PROJECT.md` are logically consistent with the current code.
    2. Agent updates `walkthrough.md`.
    3. Agent commits final state with tag.

## Artifact Mapping
GSD concepts are mapped to Antigravity artifacts as follows:

- **GSD STATE** -> `task.md`
- **GSD PLAN** -> `implementation_plan.md`
- **GSD SUMMARY** -> `walkthrough.md`

## Why This Works
Antigravity's "Agentic Mode" handles the heavy lifting of state management and artifact generation. By following the **00_ARCHITECT_BRAIN.md** directives, the agent maintains the same discipline and context-efficiency as the original GSD system.
