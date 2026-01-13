# GSD Core Workflow

Mapping conversational triggers to the GSD execution engine.

## Triggers

### "Initialize new project"
- **Process**: Conduct mission briefing, extract project pillars, and create `PROJECT.md`.

### "Map this codebase"
- **Process**: Deep research into existing files to build an architecture map.

### "Create a roadmap"
- **Process**: Break down the project into chronological phases in `ROADMAP.md`.

### "Execute Phase [N]"
- **Process**:
    1. Create/Update `task.md`.
    2. Switch to **PLANNING** mode (create `implementation_plan.md`).
    3. Wait for user approval.
    4. Switch to **EXECUTION** mode (implement code).
    5. Switch to **VERIFICATION** mode (run tests & update `walkthrough.md`).
    6. Commit and update `STATE.json`.

### "Plan Phase [N]"
- **Process**: Perform the planning stage only; do not start coding.

### "Research Phase [N]"
- **Process**: Investigate technical unknowns before committing to a plan.

### "Pause work"
- **Process**: Create a high-quality handoff summary.

### "Resume work"
- **Process**: Read the last handoff summary and restore context.
