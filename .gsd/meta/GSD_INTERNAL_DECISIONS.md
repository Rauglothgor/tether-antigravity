# ADR: GSD 2.0 Enterprise Agentic OS Upgrade

## [2026-01-13] - Transition to GSD 2.0 (Enterprise)

### Context
Standard GSD (v1.0) was effective for small projects but lacked robust knowledge management, specialist role tracking, and automated auditing for long-running autonomous tasks (like /godmode). Context decay and lack of a structured knowledge hierarchy were emerging blockers.

### Decision
Upgrade the system to "GSD 2.0" (Enterprise Agentic OS). This includes:
1. Persistent knowledge base (`.gsd/knowledge/`).
2. Specialist agent roles (`agents.yml`).
3. Mandatory audit logs (`AUDIT.md`) and expanded metrics (`STATE.json`).
4. High-autonomy commands (`/godmode`, `/orchestrate`).

### Rationale
Explicit registries for tools and agents reduce the cognitive load on individual sessions. The knowledge base prevents "hallucination soup" by providing a verified repository of project-specific patterns and lessons learned across phases.

### Consequences
- Root folder stays clean of GSD's own meta-history.
- Initialization requires dynamic creation of `.planning/` from templates.
- Agents must now check `AUDIT.md` and `agents.yml` to understand their place in the "Crew."
