# GEMINI.md - Project Context & Shared Memory

This is a living document that captures the project's technical context, specific workflow rules, and a log of mistakes to prevent repetition.

## 1. Project Context
- **Tech Stack**: [Insert Tech Stack]
- **Architecture**: [Insert Architecture Overview]
- **Key Files**: 
    - [00_ARCHITECT_BRAIN.md](file:///c:/Users/raugl/projects/GSD/00_ARCHITECT_BRAIN.md)
    - [.agent/workflows/gsd.md](file:///c:/Users/raugl/projects/GSD/.agent/workflows/gsd.md)

## 2. Workflow Rules (Boris Adaptations)
- **Mistake Correction**: Any time the agent makes a mistake (logic error, missed requirement, failed verification), it MUST append a correction rule to Section 3.
- **Ralph Wiggum Self-Explanation**: For complex tasks, the agent must perform a self-explanation (Skeptic Mode) before execution.
- **Evergreen Verification**: Use generic verification triggers (`gsd:verify-app`) to maintain environment independence.

## 3. Corrections & Lessons Log
*Format: [YYYY-MM-DD] - Error: [What went wrong] - Correction: [How to prevent it]*

- [2026-01-12] - Error: Initial implementation plan included environment-specific verification steps. - Correction: Generalize verification flows to be "evergreen" and environment-agnostic.
- [2026-01-13] - Error: Deleted `DECISIONS.md` during root cleanup by missing it in the `move-item` command. - Correction: Use explicit globbing or verification list when moving artifacts to meta-directories; NEVER run `rmdir -Force` on planning directories without a secondary `list_dir` check.
