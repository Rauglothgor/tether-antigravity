# Get Shit Done (GSD) for Antigravity

**The global, context-engineering system for Google Antigravity.**

---

> [!IMPORTANT]
> This is a native adaptation of the GSD system. It leverages Antigravity's **Global Workflows** to provide a consistent, high-quality development experience across all your machines.

---

## ⚡ The Philosophy
Vibecoding is fast, but fragile. Context degrades, the AI guesses, and your project becomes a "hallucination soup."

**GSD is the antidote.** It creates a "Mission Control" layer that keeps the AI disciplined, spec-first, and context-aware.

---

## 🚀 Global Setup (Across All Your PCs)

GSD uses Antigravity's Global Workflows to stay portable. You only need to do this once per machine:

1. **Create the Workflow Folder** (if it doesn't exist):
   - Navigate to `~/.gemini/antigravity/workflows/`.
2. **Add the GSD Setup Workflow**:
   - Create a file named `gsd-setup.md`.
   - Paste the contents of [.gsd/templates/gsd-setup.md](file:///.gsd/templates/gsd-setup.md) into it.
3. **Verify**:
   - In any project, say: **"Initialize GSD"**.

---

## 🏗️ How it Works

Once GSD is pulled into a project:

1. **Mission Control (`00_ARCHITECT_BRAIN.md`)**:
   The AI reads this root-level file first. It enforces Spec-First development, Atomic Commits, and Adversarial Planning.
2. **Shared Memory (`GEMINI.md`)**:
   The AI logs its mistakes here. This document "fine-tunes" the AI to your project's specific quirks.
3. **Automated State (`.gsd/STATE.json`)**:
   Tracks progress, estimate accuracy, and project health metrics automatically.

---

## 🗣️ The Complete Command Reference

GSD imbues Antigravity with a suite of "superpowers." You can trigger these via slash commands or natural language.

### Operational Commands (Slash Triggers)
| Command | Purpose | Process |
| :--- | :--- | :--- |
| **`/status`** | **Health Check** | Calculates completion % from `ROADMAP.md` and `STATE.json`. |
| **`/rollback`** | **Panic Button** | Reverts to the last known-good state instantly via Git. |
| **`/blocker [msg]`** | **Stop Work** | Logs a dependency that requires your intervention. |
| **`/archive-phase`** | **Context Save** | Compresses old tasks to keep the AI fast and focused. |
| **`/ralph-wiggum`** | **Deep Thought** | Forces the AI to explain its plan twice before acting. |
| **`/commit-push-pr`**| **Ship It** | High-quality commit, push, and PR generation. |
| **`/debug`** | **Exorcism** | Isolate and fix bugs with mandatory test verification. |
| **`/refactor`** | **Spring Clean** | Simplify code without changing functionality. |

### Strategic Triggers (Natural Language)
| Say to Antigravity... | Result |
| :--- | :--- |
| "Initialize new project" | Agent interviews you to build a `PROJECT.md`. |
| "Map this codebase" | Agent researches existing code to build a map. |
| "Create a roadmap" | Agent generates a multi-phase `ROADMAP.md`. |
| "Execute Phase [N]" | The "Do It" button. Runs the full Plan/Build/Verify cycle. |
| "Plan Phase [N]" | Creates a detailed technical spec without writing code. |
| "Research Phase [N]" | Deep-dives into technical unknowns. |
| "Pause work" | Generates a high-quality handoff summary for later. |
| "Resume work" | Reads the handoff and picks up exactly where it left off. |

---

## 🛫 First Flight: An Example Workflow

Stumbling across GSD for the first time? Here is how you use it to build a feature from scratch.

### 1. The Briefing
You open a fresh folder and say: **"Initialize a new project called 'Starship Manager'."**
> **Antigravity**: "I'll help you with that. First, what are the 3 core features of this manager? What's your tech stack?"
> 
> *You answer, and it creates a beautiful `PROJECT.md`.*

### 2. The Map
You say: **"Create the roadmap for Phase 1: Authentication."**
> **Antigravity**: "Roadmap generated. I've broken Phase 1 into 3 parts: Database Setup, Login API, and UI. View it in [.planning/ROADMAP.md](file:///.planning/ROADMAP.md)."

### 3. The Execution (The Magic Part)
You say: **"Execute Phase 1, Step 1."**
> **Antigravity**: 
> 1. It creates an `implementation_plan.md` showing exactly what code it will write.
> 2. It **waits** for your thumbs-up.
> 3. After you approve, it writes the code and runs verification tests.
> 4. It shows you the results in `walkthrough.md` and **commits to Git** automatically.

### 4. The Maintenance
Mid-work, you find a bug. You type **`/debug the login keeps failing`**.
> **Antigravity** isolates the issue, fixes it, verifies the fix, and logs the lesson in [GEMINI.md](file:///GEMINI.md) so it never happens again.

---

## 📂 The Artifact System

| Artifact | Role |
| :--- | :--- |
| **`PROJECT.md`** | High-level goals and tech stack. |
| **`ROADMAP.md`** | Multi-phase chronological plan with dependencies. |
| **`task.md`** | The active checklist for the current phase. |
| **`DECISIONS.md`**| The "Why" behind architectural choices. |

---

## 🛠️ Maintainer Guide
To update the GSD system:
1. Modify the workflows in `.agent/workflows/`.
2. Mirror changes to `.gsd/templates/workflows/`.
3. Commit and push to GitHub.

Licensed under MIT. Originally adapted from Boris Cherny's workflows for Claude Code.
