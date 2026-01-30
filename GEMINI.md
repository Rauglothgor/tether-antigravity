# GEMINI.md - TETHER Shared Memory

> *The AI's diary of shame (and occasional triumph).*

This is a living document that captures the project's technical context, workflow rules, and a log of mistakes to prevent repetition.

## 1. Project Context
- **Tech Stack**: [Insert Tech Stack]
- **Architecture**: [Insert Architecture Overview]
- **Key Files**: 
    - [00_ARCHITECT_BRAIN.md](file:///c:/Users/raugl/projects/tether-antigravity/tether-antigravity/00_ARCHITECT_BRAIN.md)
    - [.agent/workflows/tether.md](file:///c:/Users/raugl/projects/tether-antigravity/tether-antigravity/.agent/workflows/tether.md)

## 2. Workflow Rules (TETHER Adaptations)
- **Mistake Correction**: Any time the agent makes a mistake, it MUST append a correction rule to Section 3. No exceptions. This is how we learn.
- **Skeptic Mode**: For complex tasks, pause and explain the plan before executing. "If I can't explain it simply, I don't understand it well enough."
- **Evergreen Verification**: Use generic verification triggers to maintain environment independence.

## 3. Corrections & Lessons Log
*Format: [YYYY-MM-DD] - Error: [What went wrong] - Correction: [How to prevent it]*

- [2026-01-12] - Error: Initial implementation plan included environment-specific verification steps. - Correction: Generalize verification flows to be "evergreen" and environment-agnostic.
- [2026-01-13] - Error: Repeatedly deleted `DECISIONS.md` during root cleanup by missing it in the `move-item` command. - Correction: Standardized the "Reference Grade" structure to include clean templates in the root `.planning/` while archiving internal history in `.tether/meta/`. NEVER run `rmdir -Force` on `.planning/` in this repository without absolute confirmation of template safety.
