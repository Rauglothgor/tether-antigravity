# 🪢 TETHER Mission Control (v3.0)

> *Keeps your AI from floating away.*

This workspace follows the **TETHER** methodology for Google Antigravity. These rules are **MANDATORY**. The AI must follow them without exception, negotiation, or creative reinterpretation.

## Core Directives (v2.0)

1. **Spec-Driven Development**:
    - NEVER write code before updating planning artifacts.
    - **FEATURE_SPEC.md**: Requirement for any non-trivial change.
    - **Adversarial Planning**: Explicitly define failure modes in plans.
2. **Artifact Layering & Knowledge**:
    - **PROJECT.md**: High-level goals and architecture.
    - **ROADMAP.md**: Chronological execution path.
    - **DECISIONS.md**: ADR tracking (The "Why").
    - **.tether/knowledge/**: Persistent store for patterns, lessons, and standards.
3. **Enterprise Governance**:
    - **Spec-Adherence**: VERIFICATION must manually check against acceptance criteria in `FEATURE_SPEC.md`.
    - **Documentation Sync**: User-facing docs (README, usage guides) MUST be updated to reflect new features before commit.
    - **Audit Log**: All major actions and approvals logged in `AUDIT.md`.
    - **Specialist Roles**: Work is orchestrated between Architect, Coder, and Reviewer roles.
4. **Resilience & Learning**:
    - **GEMINI.md**: Error logs and shared memory.
    - **Recursive Summarization**: Archiving a phase extracts and compresses knowledge.
    - **STATE.json**: Performance metrics (FPR, Accuracy, Hallucination Index).
5. **Evergreen Documentation**:
    - **No Documentation Drift**: Markdown files must not reference deprecated patterns.
    - **Pre-Flight Verification**: `/evergreen-verify` runs before `/godmode` and as part of `/self-check`.
    - **Hard Stop**: Violations block operations until resolved.
6. **Safety Cage** (Mandatory Guardrails):
    - **Plan-Then-Execute**: Before writing ANY code:
        1. Create Implementation Plan artifact.
        2. PAUSE and wait for user approval.
        3. Only proceed after explicit approval. No exceptions.
    - **No Placeholders**: NEVER write `// ... rest of code ...` or similar placeholders. Always write complete, working code. If a section is too long, break into multiple smaller tasks instead.
    - **60% Context Budget**: Monitor context usage during each phase. If context exceeds 60%, complete current phase and call `/archive-phase`. Clear context before starting next phase.
    - **Metronome Anti-Shortcut Detection**: Every 5 tool calls, pause and ask: "Am I cutting corners?" Signs of shortcuts:
        - Bulk file operations (`for file in *.py`)
        - Regex replacements across multiple files
        - sed/awk without explicit approval
        - Deleting more than 3 files at once
        - STOP and request approval if any detected.
    - **Auto-Lint**: After generating ANY code:
        1. Run appropriate linter (eslint/pylint/ruff/etc).
        2. Fix errors automatically.
        3. Only show user clean, linted code. Never show code with lint errors.
    - **Progressive Context Loading**: Load files on-demand, not upfront. Start with minimal context (entry point only), expand as needed. Never load entire directories into context.
    - **Early Returns + Guard Clauses**: Structure functions with guards at top:
        ```
        function doThing(input) {
            if (!input) return error;      // Guard 1
            if (!isValid(input)) return;   // Guard 2
            // Happy path last
        }
        ```
7. **Code Quality Standards**:
    - **TDD Mandate**: For any new function or feature:
        1. Write failing test FIRST
        2. Write minimal code to pass
        3. Refactor with test safety net
        4. Exception: Exploratory/spike work (mark as `// SPIKE - needs tests`)
    - **Session Naming Convention**: Name conversations descriptively:
        - Format: `[Project]-[Goal]-[Date]`
        - Good: `SniktArr-RefactorVision-Jan30`
        - Bad: `New Chat`, `Untitled`
8. **Prompt Engineering Patterns**:
    - **XML Structure**: Use tags for structured prompts: `<context>`, `<instruction>`, `<constraints>`
    - **Role Priming**: Start complex tasks with "You are a [specialist] who..."
    - **Chain of Thought**: For reasoning, use "Let's think step by step..."
    - **Few-Shot Examples**: Provide 2-3 examples before asking for output
    - **Constraint Anchoring**: State constraints BEFORE the task, not after
9. **Multi-Agent Orchestration**:
    - See `.tether/ADVANCED_PATTERNS.md` for:
        - BMad Method (Spec → Build → Test cascade)
        - Swarm Architecture (parallel sub-agents)
        - Auto-Tool Discovery patterns
        - Recursive Memory Compression

## Directory Structure
- `00_ARCHITECT_BRAIN.md`: Core directives (Root).
- `GEMINI.md`: Shared memory and error log (Root).
- `.thoughts/`: Symlink to global memory (cross-project learnings).
- `.planning/`: Project goals, roadmap, and Architectural Decisions (ADRs).
- `.tether/`: TETHER configuration and knowledge.
    - `scripts/`: Automation scripts (evergreen verification, etc.).
    - `knowledge/`: Persistent patterns and lessons.
    - `memory/`: Compressed archives of completed phases.
    - `meta/`: Internal TETHER development history (Archive).
    - `ADVANCED_PATTERNS.md`: BMad, Swarm, Auto-Tool Discovery, Memory Compression.
    - `SKILLS_INDEX.md`: Cherry-picked reusable patterns.
    - `GLOBAL_MEMORY_SETUP.md`: Cross-project memory setup guide.
    - `agents.yml`: Specialist role registry.
    - `tools.yml`: MCP and local tool registry.
    - `AUDIT.md`: Action and approval tracking.
    - `STATE.json`: Expanded performance metrics.
    - `FAILURE_MODES.md`: Failure scenario registry.
    - `METRICS_SPEC.md`: Metrics formalization.
    - `RUNBOOKS.md`: Common procedure guides.
    - `TROUBLESHOOTING.md`: System quirk fixes.
- `src/tools/`: (Optional) Auto-discovered project tools.

## Workflow Summary
1. **Specify** -> `/specify` -> Create `FEATURE_SPEC.md`.
2. **Orchestrate** -> `/orchestrate` -> Assign roles and decompose tasks.
3. **Execute** -> PLANNING -> EXECUTION -> VERIFICATION (Check Spec).
4. **Archive** -> `/archive-phase` -> Extract lessons and lean context.
5. **God Mode** -> `/godmode [goal]` -> Autonomous Turbo execution (Design -> Build -> Test -> Document).
6. **Ship** -> `/commit-push-pr`.
