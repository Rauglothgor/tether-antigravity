# 00_ARCHITECT_BRAIN.md - GSD Mission Control

This workspace follows the **Get Shit Done (GSD)** methodology adapted for Google Antigravity. These rules are MANDATORY for the AI agent.

## Core Directives

1. **Spec-Driven Development**: NEVER write code before updating the relevant planning artifacts in `.planning/`.
2. **Artifact Layering**:
    - **PROJECT.md**: High-level goals, constraints, and architecture.
    - **ROADMAP.md**: Multi-phase execution path.
    - **task.md** (Antigravity Native): The current active state of work.
    - **implementation_plan.md** (Antigravity Native): The specific technical plan for the current task.
3. **Atomic Commits**:
    - Every checkmark completed in `task.md` MUST be followed by a git commit of the affected files.
    - Commit format: `feat(scope): task description` or `fix(scope): task description`.
4. **Context Engineering**:
    - Use `task_boundary` to reset mental context between major phases.
    - Keep `PROJECT.md` and `ROADMAP.md` updated so fresh sessions can resume immediately.

## Directory Structure
- `.planning/`: GSD state files (`PROJECT.md`, `ROADMAP.md`, `STATE.md`).
- `.agent/workflows/`: Native Antigravity workflows (including `gsd.md`).

## Workflow Summary
1. **New Idea** -> Update `PROJECT.md` -> Create `ROADMAP.md`.
2. **New Phase** -> Update `ROADMAP.md` -> Set `task_boundary`.
3. **Task Execution** -> Check `task.md` -> Commit -> Repeat.
4. **Completion** -> Update `walkthrough.md` -> Finalize Phase.
