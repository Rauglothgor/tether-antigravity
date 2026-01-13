# 00_ARCHITECT_BRAIN.md - GSD Mission Control (v2.0)

This workspace follows the **Get Shit Done (GSD)** methodology adapted for Google Antigravity. These rules are MANDATORY for the AI agent.

## Core Directives (v2.0)

1. **Spec-Driven Development**:
    - NEVER write code before updating planning artifacts.
    - **FEATURE_SPEC.md**: Requirement for any non-trivial change.
    - **Adversarial Planning**: Explicitly define failure modes in plans.
2. **Artifact Layering & Knowledge**:
    - **PROJECT.md**: High-level goals and architecture.
    - **ROADMAP.md**: Chronological execution path.
    - **DECISIONS.md**: ADR tracking (The "Why").
    - **.gsd/knowledge/**: Persistent store for patterns, lessons, and standards.
3. **Enterprise Governance**:
    - **Spec-Adherence**: VERIFICATION must manually check against acceptance criteria in `FEATURE_SPEC.md`.
    - **Audit Log**: All major actions and approvals logged in `AUDIT.md`.
    - **Specialist Roles**: Work is orchestrated between Architect, Coder, and Reviewer roles.
4. **Resilience & Learning**:
    - **GEMINI.md**: Error logs and shared memory.
    - **Recursive Summarization**: Archiving a phase extracts and compresses knowledge.
    - **STATE.json**: Performance metrics (FPR, Accuracy, Hallucination Index).

## Directory Structure
- `00_ARCHITECT_BRAIN.md`: Core directives (Root).
- `GEMINI.md`: Shared memory and error log (Root).
- `.planning/`: Project goals, roadmap, and ADRs.
- `.gsd/`: Enterprise configuration and knowledge.
    - `knowledge/`: Persistent patterns and lessons.
    - `agents.yml`: Specialist role registry.
    - `tools.yml`: MCP and local tool registry.
    - `AUDIT.md`: Action and approval tracking.
    - `STATE.json`: Expanded performance metrics.
    - `FAILURE_MODES.md`: Failure scenario registry.
    - `RUNBOOKS.md`: Common procedure guides.
    - `TROUBLESHOOTING.md`: System quirk fixes.
    - `memory/`: Compressed archives of completed phases.

## Workflow Summary
1. **Specify** -> `/specify` -> Create `FEATURE_SPEC.md`.
2. **Orchestrate** -> `/orchestrate` -> Assign roles and decompose tasks.
3. **Execute** -> PLANNING -> EXECUTION -> VERIFICATION (Check Spec).
4. **Archive** -> `/archive-phase` -> Extract lessons and lean context.
5. **God Mode** -> `/godmode [goal]` -> Autonomous Turbo execution (Design -> Build -> Test -> Document).
6. **Ship** -> `/commit-push-pr`.
