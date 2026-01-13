# RUNBOOKS.md - Standard Operating Procedures (v1.0)

Procedures for common tasks within the GSD system to ensure consistency and reduce cognitive load.

## 1. Project Initialization (`gsd:init`)
Run this when starting a new project or migrating an existing one.
1.  Verify the root directory contains `00_ARCHITECT_BRAIN.md`.
2.  Define the project's **North Star** in `PROJECT.md`.
3.  Draft a 3-phase `ROADMAP.md`.
4.  Run `/status` to confirm `STATE.json` is initialized.

## 2. Executing an Atomic Phase
The standard cycle for daily work:
1.  **Selection**: Choose the next task from `ROADMAP.md`.
2.  **Planning**: Update `task.md` and create/update `implementation_plan.md`.
3.  **Adversarial Check**: Identify one failure mode from `FAILURE_MODES.md` that could apply to this task.
4.  **Execution**: Implement changes in small, testable chunks.
5.  **Verification**: Run `gsd:verify-app` (evergreen trigger) before checking off tasks.
6.  **Closure**: Commit with a clean prefix and update metrics.

## 3. Handling a "Context Freeze"
If the AI becomes sluggish or unresponsive:
1.  Save active work to a temporary branch if possible.
2.  Run `/archive-phase` to consolidate the `.gsd/memory/` folder.
3.  Summarize the current task state in `handover.md` (temporary file).
4.  Restart the conversation (or refresh context) and start by reading `handover.md`.

## 4. Onboarding a New AI Agent
1.  Provide the path to `00_ARCHITECT_BRAIN.md`.
2.  Direct the agent to read `GEMINI.md` to learn about past mistakes.
3.  Run `/status` to sync the agent with the current project metrics.
