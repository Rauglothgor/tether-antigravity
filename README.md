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

GSD is designed to be invisible. You don't need to learn "code"; you simply need to guide the process.

### 1. Setup Your Workspace
Open your project folder in Antigravity. Ensure it contains the GSD core files:
- `00_ARCHITECT_BRAIN.md` (The Constitution)
- `.agent/workflows/gsd.md` (The Playbook)
- `.planning/DECISIONS.md`(Agent generates `PROJECT.md` & `ROADMAP.md`)

### 2. The Workflow
Just talk to Antigravity naturally:

1.  **"Initialize a new GSD project."**
    - The Agent interviews you to extract your vision and creates `PROJECT.md`.
2.  **"Create a roadmap."**
    - The Agent breaks your vision into logical phases in `ROADMAP.md`.
3.  **"Execute Phase 1."**
    - The Agent creates a `task.md`, writes the plan, code, and tests, and commits to Git for every step.

---

## 🗣️ Conversational Prompts

In Antigravity, we don't use terminal commands. We use **Natural Language Triggers** that the Agent recognizes from its "Playbook".

### Project Lifecycle
| Say to Antigravity... | Purpose |
| :--- | :--- |
| **"Initialize new project"** | Deep-dive questioning & `PROJECT.md` creation. |
| **"Map this codebase"** | Analyze existing code for "brownfield" projects. |
| **"Create a roadmap"** | Generate multi-phase `ROADMAP.md` based on the Project Vision. |
| **"Initialize new milestone"** | Group phases into a major release. |

### Phase Execution
| Say to Antigravity... | Purpose |
| :--- | :--- |
| **"Execute Phase [N]"** | The Magic Button. Builds the next item on the roadmap autonomously. |
| **"Plan Phase [N]"** | Detailed spec'ing for a specific phase without writing code yet. |
| **"Research Phase [N]"** | Deep research into technical requirements before planning. |
| **"Complete Milestone"** | Finalize a major release and archive state. |

### State & Continuity
| Say to Antigravity... | Purpose |
| :--- | :--- |
| **"Where are we?"** | Show current GSD status and next steps. |
| **"Pause work"** | Create a handoff summary for the next session. |
| **"Resume work"** | Restore state from a previous "Pause" summary. |

---

## 📂 The Artifact System
GSD maps perfectly to Antigravity's native artifact system.

| Antigravity Artifact | GSD Role | Purpose |
| :--- | :--- | :--- |
| **`PROJECT.md`** | **The Vision** | High-level goals, tech stack, and constraints. |
| **`ROADMAP.md`** | **The Path** | Chronological phases to reach completion. |
| **`task.md`** | **The State** | Current checklist of what's being built *right now*. |
| **`implementation_plan.md`** | **The Spec** | Technical design for a specific task. |
| **`walkthrough.md`** | **The Proof** | Verification verification and summary of changes. |

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
When you say "Execute Phase," Antigravity spawns specialized sub-tasks dedicated to just that unit of work. This ensures 100% quality and context retention from the first line to the last.

---

### Pro-Tier: Safety & Resilience
To combat context drift and "hallucination loop," GSD v2.0 introduces:
- **Adversarial Planning**: The Agent MUST identify how its plan might fail *before* writing code.
- **Verified Atomic Commits**: No code enters git without a passed test/verification.
- **System Doctor**: Automatic environment validation before starting work.
- **Skeptic Mode**: The Agent is forced to question its own assumptions.
- **Artifact Validation**: Strict "Definition of Done" ensures `ROADMAP.md` matching reality.

## 📜 Origin & License
Originally built by **TÂCHES** for Claude Code. This version has been adapted and optimized for the **Google Antigravity** ecosystem.

Licensed under MIT. See [LICENSE](LICENSE) for details.
