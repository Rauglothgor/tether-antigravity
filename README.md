# Get Shit Done (GSD) for Antigravity

**The context-engineering and spec-driven evolution system for Google Antigravity.**

---

> [!IMPORTANT]
> This is a native adaptation of the GSD system originally designed for Claude Code. It leverages Antigravity's built-in Agentic Mode to provide a reliable, modular, and high-quality development experience.

---

## ⚡ The Philosophy
Vibecoding is fast, but it’s fragile. You prompt, the AI guesses, code accumulates, and eventually, the context collapses.

**GSD fixes this.** It acts as a "Mission Control" layer for Antigravity. By using structured artifacts and atomic execution cycles, it ensures:
- **Zero Context Degradation**: Complex tasks are broken into small, fresh-context segments.
- **Spec-First Development**: No code is written before the plan is solid.
- **Traceable History**: Every single task is verified and committed to Git individually.

---

## 🚀 Quick Start (Novice Friendly)

GSD is designed to be invisible. You don't need to learn "code"; you just need to guide the process.

### 1. Setup Your Workspace
Open your project folder in Antigravity. Ensure it contains the GSD core files:
- `00_ARCHITECT_BRAIN.md` (The AI's rules)
- `.agent/workflows/gsd.md` (The manual)
- `.planning/` (The project memory)

### 2. The Workflow
Just talk to Antigravity naturally:

- **"Initialize a new GSD project."**
  - I'll ask you questions to extract your vision and create `PROJECT.md`.
- **"Create a roadmap for my features."**
  - I'll break your vision into logical phases in `ROADMAP.md`.
- **"Execute the first phase."**
  - I'll create a `task.md`, write the code, run tests, and commit to Git for every step.

---

## �️ Command List (Power Triggers)

In Antigravity, you don't use `/slash-commands`. Instead, you use **Conversational Triggers**. These tell the AI exactly which GSD protocol to follow.

### Project Lifecycle
| Ask Antigravity... | Original GSD Command | Purpose |
| :--- | :--- | :--- |
| **"Initialize new project"** | `/gsd:new-project` | Deep-dive questioning & `PROJECT.md` creation. |
| **"Map this codebase"** | `/gsd:map-codebase` | Analyze existing code for "brownfield" projects. |
| **"Create a roadmap"** | `/gsd:create-roadmap` | Generate multi-phase `ROADMAP.md`. |
| **"Initialize new milestone"** | `/gsd:new-milestone` | Group phases into a major release. |

### Phase Management
| Ask Antigravity... | Original GSD Command | Purpose |
| :--- | :--- | :--- |
| **"Execute next phase"** | `/gsd:execute-plan` | Build the next item on the roadmap. |
| **"Plan phase [N]"** | `/gsd:plan-phase` | Detailed spec'ing for a specific phase. |
| **"Research phase [N]"** | `/gsd:research-phase` | Deep research into technical requirements. |
| **"Complete milestone"** | `/gsd:complete-milestone` | Finalize a major release and archive state. |

### State & Issues
| Ask Antigravity... | Original GSD Command | Purpose |
| :--- | :--- | :--- |
| **"Where are we?"** | `/gsd:progress` | Show current status and next steps. |
| **"Pause work"** | `/gsd:pause-work` | Create a handoff summary for the next session. |
| **"Resume work"** | `/gsd:resume-work` | Restore state from a previous "Pause". |
| **"Review deferred issues"** | `/gsd:consider-issues` | Review technical debt/backlogged items. |

---

## �📂 The Artifact System
GSD maps perfectly to Antigravity's native artifact system.

| Antigravity Artifact | GSD Equivalent | Purpose |
| :--- | :--- | :--- |
| **`PROJECT.md`** | The Vision | High-level goals, tech stack, and constraints. |
| **`ROADMAP.md`** | The Path | Chronological phases to reach completion. |
| **`task.md`** | The State | Current checklist of what's being built *right now*. |
| **`implementation_plan.md`** | The Spec | Technical design for a specific task. |
| **`walkthrough.md`** | The Ship | Verification proof and summary of changes. |

---

## 🛠️ Workspace Configuration

### One Workspace = One Project
Antigravity identifies GSD projects by looking for the `00_ARCHITECT_BRAIN.md` file in your root directory.
> [!WARNING]
> Always open Antigravity at the root of your project. If you open a parent folder, the AI may not find the "Mission Control" file and will revert to standard behavior.

### Starting a New Project
To use GSD in a new folder:
1. Copy the `00_ARCHITECT_BRAIN.md` file.
2. Copy the `.agent/` and `.planning/` directories.
3. Open that folder in Antigravity and say: *"Let's build something."*

---

## 🧠 Why It Works (Technical Detail)

### Mission Control (`00_ARCHITECT_BRAIN.md`)
This file is a "Prime Directive" for the AI. It overrides standard behavior to enforce GSD rules:
- **Atomic Commits**: Mandatory `git commit` after every `task.md` checkbox.
- **Context Resets**: Using `task_boundary` to clear memory between major phases.
- **Verification Enforcement**: Every plan must include verification steps (tests/checks).

### Atomic Subagent Execution
When you say "Execute Phase," Antigravity doesn't just start typing. It spawns a specialized process with high token limits dedicated to just those 2-3 tasks. This ensures 100% quality from the first line to the last.

---

## 📜 Origin & License
Originally built by **TÂCHES** for Claude Code. This version has been adapted and optimized for the **Google Antigravity** ecosystem.

Licensed under MIT. See [LICENSE](LICENSE) for details.
