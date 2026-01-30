# Getting Started with TETHER

> *From zero to productive in 15 minutes.*

This guide walks you through your first day with TETHER. By the end, you'll have a working setup and know how to collaborate effectively with your AI assistant.

---

## Prerequisites

- **Google Antigravity** (or compatible AI IDE) installed
- A project you want to work on (new or existing)
- 15 minutes of uninterrupted time

---

## Step 1: Clone TETHER (2 minutes)

```powershell
# Clone into your project directory
git clone https://github.com/Rauglothgor/tether-antigravity.git my-project
cd my-project

# Or add to existing project
git clone https://github.com/Rauglothgor/tether-antigravity.git temp-tether
Copy-Item -Recurse temp-tether/* . -Force
Remove-Item -Recurse temp-tether
```

You should now have these files:
- `00_ARCHITECT_BRAIN.md` - The rules your AI must follow
- `GEMINI.md` - Where the AI logs its mistakes
- `.planning/` - Your project planning artifacts
- `.tether/` - System configuration (mostly for AI)

---

## Step 2: Define Your Project (5 minutes)

Open `.planning/PROJECT.md` and fill in:

```markdown
# Project: [Your Project Name]

## North Star
What's the one-sentence goal? (e.g., "Build a CLI tool that converts PDFs to markdown")

## Tech Stack
- Language: [e.g., Python 3.11]
- Framework: [e.g., Click for CLI]
- Database: [e.g., None / SQLite / PostgreSQL]

## Architecture
Brief description of how the pieces fit together.
```

Then open `.planning/ROADMAP.md` and outline your phases:

```markdown
# Roadmap

## Phase 1: Foundation
- [ ] Set up project structure
- [ ] Install dependencies
- [ ] Create basic CLI skeleton

## Phase 2: Core Feature
- [ ] Implement PDF parsing
- [ ] Implement markdown conversion
- [ ] Add error handling

## Phase 3: Polish
- [ ] Add tests
- [ ] Write documentation
- [ ] Prepare for release
```

---

## Step 3: Your First Conversation (3 minutes)

Open Antigravity and start with:

> "Read the project files and tell me what you understand about this project."

The AI will:
1. Read `00_ARCHITECT_BRAIN.md` to learn the rules
2. Read `.planning/PROJECT.md` to understand your goals
3. Read `.planning/ROADMAP.md` to see the plan
4. Report back what it understood

If it got something wrong, correct it now. This is your baseline.

---

## Step 4: Start Building (5 minutes)

Pick the first task from your ROADMAP and say:

> "Let's start Phase 1. Begin with [first task]."

The AI will:
1. Create an `implementation_plan.md` (you approve this)
2. Execute the work
3. Verify the changes work
4. Update progress in `task.md`

**Key commands to remember:**

| Say This | Get This |
|:--|:--|
| `/status` | Current progress + health score |
| `/help` | All available commands |
| `/debug [issue]` | Structured bug investigation |
| `/rollback` | Undo last change |

---

## Step 5: (Optional) Set Up Global Memory

If you work on multiple projects, set up cross-project memory:

```powershell
# Create global memory directory (one-time)
$globalMem = "$env:USERPROFILE\antigravity-global-memory"
New-Item -ItemType Directory -Force -Path "$globalMem\solutions"
New-Item -ItemType Directory -Force -Path "$globalMem\patterns"
New-Item -ItemType Directory -Force -Path "$globalMem\mistakes"

# In each project, create symlink
cd C:\path\to\your\project
New-Item -ItemType SymbolicLink -Path ".thoughts" -Target $globalMem
```

Now learnings from Project A help with Project B.

See [GLOBAL_MEMORY_SETUP.md](.tether/GLOBAL_MEMORY_SETUP.md) for full details.

---

## Common First-Day Mistakes

### ❌ Jumping straight to code
**Do this instead:** Fill out `PROJECT.md` and `ROADMAP.md` first. The AI works better with context.

### ❌ Approving plans you don't understand
**Do this instead:** If the AI's plan has steps you don't follow, ask "Explain step 3 in simpler terms."

### ❌ Ignoring verification failures
**Do this instead:** When something fails verification, run `/debug [issue]` before trying again.

### ❌ Letting the AI ramble
**Do this instead:** Use `/status` to get a quick summary. Say "be concise" if responses are too long.

---

## What's Next?

- **Learn the commands:** Run `/help` to see everything available
- **Explore patterns:** Check [SKILLS_INDEX.md](.tether/SKILLS_INDEX.md) for reusable patterns
- **Go autonomous:** Try `/godmode [goal]` for end-to-end feature building
- **Read the philosophy:** The README explains *why* TETHER works this way

---

## Quick Reference Card

```
/status          → Project health check
/help            → All commands  
/debug [issue]   → Bug investigation
/rollback        → Undo last change
/godmode [goal]  → Autonomous building
/archive-phase   → Save context, start fresh
```

**The Golden Rule:** If the AI does something wrong, make it log the mistake in `GEMINI.md`. That's how it learns.

---

*Welcome to TETHER. Now go build something.*
