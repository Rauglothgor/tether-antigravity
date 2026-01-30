---
description: Get help with available TETHER commands and their usage
---

# /help - TETHER Command Reference

## Quick Reference

| Command | Purpose | When to Use |
|:--|:--|:--|
| `/godmode [goal]` | Full autonomous execution | "I have an idea, make it happen" |
| `/status` | Check project health & metrics | "Am I on track?" |
| `/debug [issue]` | Structured bug investigation | "Something is broken" |
| `/rollback` | Revert to last working state | "PANIC! Go back!" |
| `/help` | Show this reference | "I'm confused" |

## Extended Commands

| Command | Purpose |
|:--|:--|
| `/specify [feature]` | Create detailed FEATURE_SPEC.md before coding |
| `/decision [topic]` | Log architectural decision in DECISIONS.md |
| `/tools` | List auto-discovered project tools |
| `/investigate [question]` | Spawn sub-agent to research topic without polluting main context |
| `/archive-phase` | Extract lessons, compress context, clear for next phase |
| `/evergreen-verify` | Scan docs for deprecated patterns |
| `/godmode [goal] --bmad` | Full BMad Method cascade (Spec → Architect → Build → Test) |

## Key Files

| File | Purpose |
|:--|:--|
| `00_ARCHITECT_BRAIN.md` | Core rules the AI must follow |
| `GEMINI.md` | Error log & lessons learned |
| `.planning/PROJECT.md` | Project goals and tech stack |
| `.planning/ROADMAP.md` | Phased execution plan |
| `.tether/STATE.json` | Metrics and health tracking |
| `.tether/ADVANCED_PATTERNS.md` | BMad, Swarm, Memory Compression |
| `.tether/SKILLS_INDEX.md` | Cherry-picked reusable patterns |
| `.thoughts/` | Symlink to global cross-project memory |

## Traffic Light Status Guide

- 🟢 **Nominal** (85-100): Everything working well
- 🟡 **Warning** (70-84): Proceed with caution, consider /archive-phase
- 🔴 **Critical** (<70): Stop and review with /status

## Tips for Novices

1. **Start simple**: Use `/godmode [your idea]` for most tasks
2. **Watch artifacts**: Review plans before approving
3. **If stuck**: Use `/debug [describe problem]`
4. **If lost**: Use `/help`
5. **If scared**: Use `/rollback`
