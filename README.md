# 🪢 TETHER for Antigravity

**Keeps your AI from floating away.**

> *Because "AI went rogue and deleted my database" is a story nobody wants to tell at standup.*

---

## What is TETHER?

TETHER is a **safety cage, guardrail system, and workflow framework** for Google Antigravity. It transforms your AI coding assistant from a brilliant but occasionally chaotic intern into a disciplined engineering partner.

**Without TETHER**: *"Hey AI, add user auth"* → AI implements OAuth, rewrites your database schema, refactors 47 files, and introduces 3 bugs you won't find for weeks.

**With TETHER**: *"Hey AI, add user auth"* → AI creates a plan, waits for your approval, implements incrementally, tests each step, and documents everything.

---

## 🎯 The Philosophy: Trust, but Verify (Heavily)

| Problem | TETHER Solution |
|:--|:--|
| AI hallucinates code | Plan-Then-Execute: Must create artifact BEFORE coding |
| AI cuts corners | Metronome: Every 5 actions, stops to ask "Am I being sloppy?" |
| AI context degrades | 60% Budget: Forces archiving before brain overload |
| AI forgets learnings | Global Memory: `.thoughts/` persists across all projects |
| AI writes placeholders | No Placeholders Rule: Complete code or break into tasks |
| AI makes bulk changes | Anti-Shortcut: `rm -rf` requires sign-off in triplicate |

---

## � Quick Start (5 Minutes to Safety)

*Want the full walkthrough? See [GETTING_STARTED.md](GETTING_STARTED.md)*

### Step 1: Enable Antigravity's Built-in Features

| Setting | Location | Action |
|:--|:--|:--|
| **Knowledge Base** | Settings → Knowledge | Enable (so AI remembers you) |
| **Artifact Review** | Settings → Artifacts | "Request Review" (so AI asks permission) |
| **Terminal Policies** | Settings → Terminal | Add Allow/Deny lists (so AI can't `rm -rf /`) |
| **Browser Sub-Agent** | Settings → Browser | Enable (so AI can verify its own work) |

### Step 2: Set Up Global Memory

```powershell
# Create the brain that follows you everywhere
mkdir -p "$env:USERPROFILE\antigravity-global-memory\{solutions,patterns,mistakes,decisions,discoveries}"

# In each project, create symlink
New-Item -ItemType SymbolicLink -Path ".thoughts" -Target "$env:USERPROFILE\antigravity-global-memory"
```

### Step 3: Tell Your AI to Behave

Say: **"Read 00_ARCHITECT_BRAIN.md and follow all rules."**

That's it. You now have adult supervision for your AI.

---

## 📋 Command Cheat Sheet

### The Big Five (Memorize These)

| Command | What It Does | When To Use |
|:--|:--|:--|
| `/godmode [goal]` | Full autonomous build | "Make me a thing" |
| `/status` | Traffic light health check | "Is everything on fire?" |
| `/debug [issue]` | Structured bug hunt | "Why is this broken?" |
| `/rollback` | Undo everything | "OH GOD GO BACK" |
| `/help` | Show all commands | "What can you do again?" |

### Extended Arsenal

| Command | Purpose |
|:--|:--|
| `/specify [feature]` | Create detailed spec before coding |
| `/investigate [question]` | Research without polluting main context |
| `/tools` | List auto-discovered project tools |
| `/archive-phase` | Compress and store learnings |
| `/decision [topic]` | Document architectural choices |
| `/godmode [goal] --bmad` | Full BMad cascade (for complex work) |

### Traffic Light Status

| 🟢 Nominal (85-100) | 🟡 Warning (70-84) | 🔴 Critical (<70) |
|:--|:--|:--|
| Vibing | Caution | Panic |

---

## 🧠 The Safety Cage (What Makes TETHER Work)

These rules live in `00_ARCHITECT_BRAIN.md`. The AI must follow them. No exceptions. No negotiations. No "but I thought—".

### The Non-Negotiables

1. **Plan-Then-Execute**: Create plan → Wait for approval → Only then code
2. **No Placeholders**: Write `// TODO: implement later` and we are no longer friends
3. **60% Context Budget**: Hit 60%? Archive. Don't hit 80% and become word salad.
4. **Metronome Check**: Every 5 actions, pause and ask "Am I cutting corners?"
5. **Auto-Lint**: Deliver clean code or don't deliver at all

### The Quality Standards

- **TDD Mandate**: Failing test first (or mark as `// SPIKE - needs tests`)
- **Guard Clauses**: Early returns at the top, happy path at the bottom
- **Progressive Loading**: Load files on-demand, not "let me just read everything"

---

## 📁 Key Files (Where Things Live)

| File | Purpose | Vibe |
|:--|:--|:--|
| `00_ARCHITECT_BRAIN.md` | All the rules | The Constitution |
| `GEMINI.md` | Error log & lessons | The Diary of Shame |
| `.planning/PROJECT.md` | Goals & architecture | The Vision Board |
| `.planning/ROADMAP.md` | Phased plan | The To-Do List |
| `.thoughts/` | Global memory symlink | The Eternal Brain |
| `.tether/ADVANCED_PATTERNS.md` | BMad, Swarm, Memory Compression | The PhD Thesis |
| `.tether/SKILLS_INDEX.md` | Reusable patterns | The Recipe Book |

---

## 🎓 Advanced Patterns (For When You're Ready)

Once you've mastered the basics, TETHER offers power tools:

| Pattern | What It Does | Complexity |
|:--|:--|:--|
| **BMad Method** | Cascades work through Spec → Architect → Build → Test agents | High |
| **Multi-Agent Swarm** | Parallelizes independent work streams | High |
| **Recursive Memory Compression** | Saves learnings without token bloat | Medium |
| **Auto-Tool Discovery** | AI finds and uses project-specific tools | Medium |

See `.tether/ADVANCED_PATTERNS.md` for the full breakdown.

---

## 📚 Reference Documentation

For humans who want to go deeper:

| Document | What It Covers |
|:--|:--|
| [SKILLS_INDEX.md](.tether/SKILLS_INDEX.md) | 20 reusable patterns (auth, database, API, testing) |
| [GLOBAL_MEMORY_SETUP.md](.tether/GLOBAL_MEMORY_SETUP.md) | Cross-project memory via `.thoughts/` symlink |
| [TROUBLESHOOTING.md](.tether/TROUBLESHOOTING.md) | When things go wrong |

*Everything else in `.tether/` is for the AI. You don't need to read it.*

---

## 🏆 Credits & Influences

TETHER stands on the shoulders of giants (and a few mad scientists):

### The Seed
- **[Get Shit Done (GSD)](https://github.com/glittercowboy/get-shit-done)** by Lex Christopherson - The original "stop chatting, start building" philosophy. TETHER grew from this seed.

### The Methodology  
- **Boris Cherny's Claude Code workflows** - The spec-driven, artifact-first approach
- **BMad AI Coding Methodology** - Multi-agent cascade patterns
- **Ashley Ha's Claude Code Mastery** - Context budget management and `.thoughts/` global memory

### The Patterns
- **Anthropic Engineering** - Plan-then-execute, subagent orchestration
- **Cursor IDE Community** - Progressive context loading, guard clauses
- **Windsurf Cascade** - Auto-lint integration

### The Tools
- **antigravity-skills** / **antigravity-awesome-skills** community repos - Pattern library inspiration
- **antigravity-kit** / **antigravity-workspace-template** - Recursive memory and auto-discovery patterns

### The Spirit
- **Every developer who's ever said "the AI broke my code"** - Your pain is the reason TETHER exists

---

## 🤔 FAQ

**Q: Why "TETHER"?**  
A: Because in Antigravity, things float away if you don't tie them down. Your AI's context, your project's state, your sanity—all of it. TETHER keeps everything connected.

**Q: Is this overkill for a small project?**  
A: Is a seatbelt overkill for a short drive? Maybe. But the one time you need it...

**Q: Can I disable rules I don't like?**  
A: You can. But then you'll email me at 2am asking why your AI deleted your production database. I'll send you a link to this FAQ.

**Q: Why the humor?**  
A: Because reading documentation is already painful enough. If I can't make it useful AND entertaining, what's the point?

**Q: Does this actually work?**  
A: It reduced my "AI did something insane" incidents by about 90%. The other 10% make great stories.

---

## 📜 License

**[RandOS License (ROL) 1.0](LICENSE)** - MIT with personality. Use it, fork it, ship it. Just don't be a jerk about it.

---

## 🛠️ Maintainer Guide

To update TETHER:
1. Modify workflows in `.agent/workflows/`
2. Update `00_ARCHITECT_BRAIN.md` for rule changes
3. Mirror templates to `.tether/templates/`
4. Test with `/self-check`
5. Commit and ship

---

*Built by a Marine Corps veteran, artist, MBA, alderman, and occasional AI wrangler who believes in shipping finished work.*

**Now go build something. And let TETHER keep your AI from floating away.** 🚀
