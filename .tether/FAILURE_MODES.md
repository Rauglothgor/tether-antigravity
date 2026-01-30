# FAILURE_MODES.md - Registry of Known Failures (v1.0)

This registry documents known failure scenarios for the AI agent and the TETHER system, along with proactive mitigations and recovery steps.

## Scenario 1: AI Context Decay (Phase Drift)
*   **Trigger**: Project reaches 10+ execution phases or very large individual files.
*   **Symptom**: AI begins to "forget" core directives (e.g., skips verification, stops updating `task.md`) or halluciantes file contents.
*   **Mitigation**:
    - Periodically run `/archive-phase` to compress completed work into `.tether/memory/`.
    - Keep files under 500 lines where possible.
    - Explicitly summarize the current architecture every 3 phases in `DECISIONS.md`.

## Scenario 2: STATE.json Corruption
*   **Trigger**: Interrupted file write during a crash or manual editing of `STATE.json` with syntax errors.
*   **Symptom**: `/status` command fails or displays incorrect progress metrics (e.g., 200% completion).
*   - Recovery:
    - Re-run initialization to reset the tracking logic without wiping `PROJECT.md`.
    - Manually audit `STATE.json` against the current `ROADMAP.md` if the score seems "hallucinated."

## Scenario 3: Verification Loop Death
*   **Trigger**: A recursive dependency error where fixing one bug introduces another (oscillating state).
*   **Symptom**: FPR (First-Pass Rate) drops below 30% and the agent enters a "verification loop" (Fix -> Fail -> Fix -> Fail).
*   **Mitigation**:
    - Trigger **Skeptic Mode** early.
    - If it fails twice, execute `/rollback` to return to the last known-good commit and start over with a simpler implementation plan.

## Scenario 4: Tool Calling Inaccuracies (Windows Path Quirk)
*   **Trigger**: Agent attempts to use `/` instead of `\` for absolute paths in Windows, or fails to use the full drive letter.
*   **Symptom**: `FileNotFoundError` or permission errors even when the file exists.
*   **Mitigation**:
    - Always use absolute paths starting with `C:\`.
    - Double-check path formatting in the `implementation_plan.md` before execution.
