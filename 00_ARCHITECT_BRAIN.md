# 00_ARCHITECT_BRAIN.md - GSD Mission Control (v2.0)

This workspace follows the **Get Shit Done (GSD)** methodology adapted for Google Antigravity. These rules are MANDATORY for the AI agent.

## Core Directives

1. **Spec-Driven Development**:
    - NEVER write code before updating the relevant planning artifacts.
    - **Adversarial Planning**: Before coding, explicitly define a "Failure Mode Analysis" in `implementation_plan.md`—identifying the most likely failure point.
2. **Artifact Layering**:
    - **PROJECT.md**: High-level goals, constraints, and architecture.
    - **ROADMAP.md**: Multi-phase execution path (with dependencies).
    - **DECISIONS.md**: Architectural Decision Records (The "Why").
    - **task.md** (Antigravity Native): The current active state of work.
3. **Verified Atomic Commits**:
    - A checkbox in `task.md` cannot be checked until a **verification step** has passed.
    - Commit format: `feat(scope): task description` or `fix(scope): task description`.
4. **Context & Failure Management**:
    - **GEMINI.md**: Every AI mistake MUST be logged here to prevent repetition.
    - **Ralph Wiggum Technique**: Perform a "Self-Explanation" pass for complex tasks.
    - **Rollback First**: If verification fails twice, `/rollback` to the last known-good state and reassess the plan.

## Directory Structure
- `00_ARCHITECT_BRAIN.md`: Core directives (Root).
- `GEMINI.md`: Shared memory and error log (Root).
- `.planning/`: Project goals, roadmap, and Architectural Decisions.
    - `DECISIONS.md`: ADR tracking (The "Why").
    - `ROADMAP.md`: Multi-phase execution path.
- `.gsd/`: Supporting assets.
    - `FAILURE_MODES.md`: Failure scenario registry.
    - `RUNBOOKS.md`: Common procedure guides.
    - `TROUBLESHOOTING.md`: System quirk fixes.
    - `templates/`: Reusable code and test patterns.
    - `memory/`: Compressed archives of completed phases.
    - **STATE.json**: Project-level metrics and progress tracking (See [METRICS_SPEC.md](file:///.gsd/METRICS_SPEC.md)).

## Workflow Summary
1. **Initialize** -> `gsd:init` -> Update `PROJECT.md` -> Create `ROADMAP.md`.
2. **Execute Phase** -> Failure Mode Analysis -> verify -> Commit.
3. **Handle Blockers** -> `/blocker [desc]` -> Log in `BLOCKERS.md`.
4. **Resilience** -> `/status` (Check metrics) -> `/archive-phase` (Keep context lean).
5. **Ship It** -> `/commit-push-pr`.
