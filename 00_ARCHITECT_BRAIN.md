# 00_ARCHITECT_BRAIN.md - GSD Mission Control

This workspace follows the **Get Shit Done (GSD)** methodology adapted for Google Antigravity. These rules are MANDATORY for the AI agent.

## Core Directives



1. **Spec-Driven Development**:
    - NEVER write code before updating the relevant planning artifacts.
    - **Adversarial Planning**: Before coding, explicitly define a "Failure Mode Analysis" in `implementation_plan.md`—identifying the most likely failure point.
2. **Artifact Layering**:
    - **PROJECT.md**: High-level goals, constraints, and architecture.
    - **ROADMAP.md**: Multi-phase execution path.
    - **DECISIONS.md**: Architectural Decision Records (The "Why").
    - **task.md** (Antigravity Native): The current active state of work.
    - **implementation_plan.md** (Antigravity Native): The specific technical plan.
3. **Verified Atomic Commits**:
    - A checkbox in `task.md` cannot be checked, and a commit cannot be made, until a **verification step** has passed.
    - **Verification Log**: Every `task.md` completion MUST be accompanied by a log of the verification command (e.g., `npm test`, `ls -l`, build check) that proves the change works.
    - Commit format: `feat(scope): task description` or `fix(scope): task description`.
4. **Context Engineering**:
    - **Contextual Handoffs**: `walkthrough.md` MUST capture "Lessons Learned" (non-obvious knowledge) to prevent re-discovery.
    - Keep `PROJECT.md` and `ROADMAP.md` updated.

## Directory Structure
- `.planning/`: GSD state files (`PROJECT.md`, `ROADMAP.md`, `DECISIONS.md`, `STATE.md`).
- `.agent/workflows/`: Native Antigravity workflows (including `gsd.md`).

## Workflow Summary
1. **New Idea** -> Update `PROJECT.md` -> Create `ROADMAP.md`.
2. **New Phase** -> Update `ROADMAP.md` -> Set `task_boundary`.
3. **Pre-Flight** -> Run System Doctor -> Verify Environment.
4. **Task Execution** -> Failure Mode Analysis -> verify -> Commit.
5. **Completion** -> Update `walkthrough.md` (w/ Lessons Learned) -> Finalize Phase.
