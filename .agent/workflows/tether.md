# TETHER Core Workflow

Mapping conversational triggers to the TETHER execution engine.

## Triggers

### "Initialize new project"
- **Process**: 
    1. Conduct mission briefing and extract project pillars.
    2. Create `.planning/` directory.
    3. Initialize `.planning/PROJECT.md`, `.planning/ROADMAP.md`, and `.planning/DECISIONS.md` from `.tether/templates/`.
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
    8. **Documentation Sync**: Update user-facing docs (README, usage guides) to reflect new features.
    9. Commit and update `STATE.json`.

### "Plan Phase [N]"
- **Process**: Perform the planning stage only; do not start coding.

### "Research Phase [N]"
- **Process**: Investigate technical unknowns before committing to a plan.

### "Pause work"
- **Process**: Create a high-quality handoff summary.

### "Resume work"
- **Process**: Read the last handoff summary and restore context.

### "/status"
- **Action**: Display project health with Traffic Light summary.
- **Output Format**:
    ```
    ## 🚦 Project Status
    
    | Metric | Value | Status |
    |:--|:--|:--|
    | Health Score | 85 | 🟢 Nominal |
    | Current Phase | 2/5 | In Progress |
    | Context Usage | 45% | 🟢 Safe |
    | First-Pass Rate | 78% | 🟢 Good |
    
    ### Traffic Light Guide
    - 🟢 Nominal (85-100): Everything working well
    - 🟡 Warning (70-84): Proceed with caution
    - 🔴 Critical (<70): Stop and review
    ```
- **Process**:
    1. Read `STATE.json` for metrics.
    2. Calculate Traffic Light status for each metric.
    3. Display formatted output.

### "/tools"
- **Action**: Discover and list project-specific tools.
- **Process**:
    1. Scan `src/tools/__manifest__.json` if exists.
    2. List available tools with descriptions.
    3. Show trigger phrases for each tool.

## TETHER Advanced Commands

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
    1. Extract lessons into `.tether/knowledge/lessons/`.
    2. Extract patterns into `.tether/knowledge/patterns/`.
    3. Summarize KB for context preservation.
    4. Move files to `.tether/memory/`.

### "/mcp-discover"
- **Process**: Search for and registry new MCP tools in `.tether/tools.yml`.

### "/evergreen-verify"
- **Action**: Scan documentation for legacy residue.
- **Process**:
    1. Run `.tether/scripts/verify-evergreen-docs.ps1`.
    2. If FAIL (exit code 1), report legacy residue to user and block.
    3. If PASS (exit code 0), proceed silently.

### "/self-check"
- **Action**: Verify TETHER integrity.
- **Checks**:
    1. All referenced templates in `MANIFEST.md` exist.
    2. `STATE.json` schema is valid.
    3. `ROADMAP.md` phases match `STATE.json` progress.
    4. No orphaned files in `.tether/memory/`.
    5. **Evergreen Verification**: No documentation residue detected (runs `/evergreen-verify`).

### "/godmode [goal]"
- **Guardrails**:
    - **Pre-Flight**: Run `/evergreen-verify` before starting (hard block on failure).
    - **Max Phases**: 5 (requires `/godmode-continue` to proceed).
    - **Max Retries Per Phase**: 3 (triggers `/blocker` on 4th failure).
    - **Token Budget**: ~50k tokens before mandatory `/archive-phase`.
- **Process (TURBO MODE - 100% Autonomy)**:
    1. **Design**: Internally run `/specify` to generate `FEATURE_SPEC.md` and acceptance criteria.
    2. **Architect**: Generate `schema.md` and update `FAILURE_MODES.md` with top 3 risks.
    3. **Plan**: Initialize `ROADMAP.md` with atomic, testable phases.
    4. **Build**: Execute code changes. analyze logs on failure, and self-correct until logic passes.
    5. **Validate**: Use **Browser Agent** (Specialist role for UI/UX verification) for UI verification and confirm 100% spec-adherence.
    6. **Document**: Log all actions in `.tether/AUDIT.md` and update `STATE.json`.
    7. **Archive**: Auto-extract lessons/patterns and compress phase.
