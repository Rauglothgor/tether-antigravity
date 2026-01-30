# TETHER Slash Commands

Custom operational triggers for the TETHER system.

## `/status`
- **Action**: Display project health, progress, and estimate accuracy.
- **Process**: Read `ROADMAP.md` and `STATE.json` to calculate completion %.

## `/rollback`
- **Action**: Revert to the last known-good state after verification failure.
- **Process**: `git reset --hard HEAD~1` or specific commit, then update `GEMINI.md`.

## `/blocker [desc]`
- **Action**: Log a blocking issue that requires external or human intervention.
- **Process**: Append to `BLOCKERS.md` and update `STATE.json` status.

## `/archive-phase`
- **Action**: Compress completed phase history to save context.
- **Process**: Move old `task.md` and `walkthrough.md` files to `.tether/memory/`.

## `/ralph-wiggum`
- **Action**: Perform a "Self-Explanation" pass for complex tasks.
- **Process**: The agent must explain its proposed plan to itself (and you) before execution.

## `/commit-push-pr`
- **Action**: Finalize changes and open a PR.
- **Process**: Stages all changes, creates an atomic commit message, and pushes.

## `/debug`
- **Action**: Deep analysis of a bug.
- **Process**: Research, isolate, and fix with mandatory verification.

## `/refactor`
- **Action**: Clean up code without changing behavior.
- **Process**: Simplify logic and ensure tests still pass.
