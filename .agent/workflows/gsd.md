# GSD Core Workflow

Mapping conversational triggers to the GSD execution engine.

## Triggers

### "Initialize new project"
- **Process**: 
    1. Conduct mission briefing and extract project pillars.
    2. Create `.planning/` directory.
    3. Initialize `.planning/PROJECT.md` and `.planning/ROADMAP.md` from `.gsd/templates/`.
    4. Populate `STATE.json` with initial project data.

### "Map this codebase"
- **Process**: Deep research into existing files to build an architecture map.

### "Create a roadmap"
- **Process**: Break down the project into chronological phases in `ROADMAP.md`.

### "Execute Phase [N]"
- **Process**:
    1. Create/Update `task.md`.
    2. Switch to **PLANNING** mode (create `implementation_plan.md`).
    3. **Consult `FAILURE_MODES.md`**: Identify risks for the current task.
    4. Wait for user approval.
    5. Switch to **EXECUTION** mode (implement code).
    6. Switch to **VERIFICATION** mode (run tests & update `walkthrough.md`).
    7. **Consult `TROUBLESHOOTING.md`**: Resolve any verification friction.
    8. Commit and update `STATE.json`.

### "Plan Phase [N]"
- **Process**: Perform the planning stage only; do not start coding.

### "Research Phase [N]"
- **Process**: Investigate technical unknowns before committing to a plan.

### "Pause work"
- **Process**: Create a high-quality handoff summary.

### "Resume work"
- **Process**: Read the last handoff summary and restore context.

## GSD 2.0 Advanced Commands

### "/specify [feature]"
- **Process**:
    1. Gather user stories and constraints.
    2. Define acceptance criteria.
    3. Generate `FEATURE_SPEC.md` in the current context.

### "/api-contract [endpoint]"
- **Process**:
    1. Define request/response models.
    2. Generate/Update OpenAPI 3.0 specification.
    3. Verify frontend/backend alignment.

### "/schema [model]"
- **Process**:
    1. Generate Mermaid ERDs and data dictionaries.
    2. Document field constraints and indexing strategy.

### "/decision [topic]"
- **Process**:
    1. Trigger **Ralph Wiggum (Skeptic Mode)** pass.
    2. Compare at least two alternatives.
    3. Document in `DECISIONS.md`.

### "/orchestrate [phase]"
- **Process**:
    1. Decompose roadmap phase into atomic tasks.
    2. Assign tasks to specialist roles (defined in `agents.yml`).
    3. Update `task.md` with role assignments.

### "/archive-phase"
- **Process**:
    1. Extract lessons into `.gsd/knowledge/lessons/`.
    2. Extract patterns into `.gsd/knowledge/patterns/`.
    3. Summarize KB for context preservation.
    4. Move files to `.gsd/memory/`.

### "/mcp-discover"
- **Process**: Search for and registry new MCP tools in `.gsd/tools.yml`.

### "/godmode [goal]"
- **Process (TURBO MODE - 100% Autonomy)**:
    1. **Design**: Internally run `/specify` to generate `FEATURE_SPEC.md` and acceptance criteria.
    2. **Architect**: Generate `schema.md` and update `FAILURE_MODES.md` with top 3 risks.
    3. **Plan**: Initialize `ROADMAP.md` with atomic, testable phases.
    4. **Build**: Execute code changes. analyze logs on failure, and self-correct until logic passes.
    5. **Validate**: Use Browser Agent for UI verification and confirm 100% spec-adherence.
    6. **Document**: Log all actions in `.gsd/AUDIT.md` and update `STATE.json`.
    7. **Archive**: Auto-extract lessons/patterns and compress phase.
