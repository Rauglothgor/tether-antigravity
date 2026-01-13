# Get Shit Done (GSD) 2.0: Mission Control for AI

**The Enterprise-Grade Agentic OS for Google Antigravity.**

GSD 2.0 is a disciplined "Mission Control" layer that keeps AI agents focused, spec-driven, and context-aware. It moves beyond simple chat by enforcing professional engineering standards automatically.

---

## ⚡ The Philosophy: From "Chat" to "Build"
Standard AI coding is fast but fragile. Context degrades, the AI guesses, and projects become "hallucination soup." 

**GSD is the antidote.** It creates a "Command and Control" structure that ensures every line of code is backed by a specification, verified by a test, and logged for long-term memory.

---

## 🚀 Global Setup (Across All Your PCs)

GSD uses Antigravity's **Global Workflows** to stay portable. You only need to do this once per machine:

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
   The AI reads this root-level file first. It enforces Spec-First development, Atomic Commits, and Specialist Roles.
2. **Shared Memory (`GEMINI.md`)**:
   The AI logs its mistakes here. This document "fine-tunes" the AI to your project's specific quirks.
3. **Automated State (`.gsd/STATE.json`)**:
   Tracks progress, accuracy, and project health metrics automatically. See the detailed [Metrics Specification](file:///.gsd/METRICS_SPEC.md).
4. **Knowledge Base (`.gsd/knowledge/`)**:
   Persistent store for patterns and lessons extracted during `/archive-phase`.

---

## 🚀 The "Novice" Guide (How this works for you)

If you aren't a coder, think of GSD 2.0 as your **Self-Building Construction Crew**. You don't need to know how to lay bricks; you just need to describe the house.

### Core Concepts
* **The Blueprint (`/specify`)**: The AI turns your "Plain English" ideas into a professional technical plan before it starts building.
* **The Safety Inspector (`FAILURE_MODES.md`)**: The system brainstorms everything that could go wrong and builds "safety nets" to prevent crashes.
* **The Specialized Crew**: Instead of one AI, GSD uses roles like **Architect**, **Coder**, and **Reviewer**.
* **The Crew's Diary (`GEMINI.md`)**: Every mistake is written down so the AI never makes it twice.

---

## � GSD 2.0 Quick-Start Cheat Sheet

| Step | Action | Why? |
| :--- | :--- | :--- |
| **1. Start** | Type **`/godmode [your idea]`** | This kicks off the "Self-Building" process. |
| **2. Observe** | Watch the **Artifacts** tab | You can see the blueprints and test results as they happen. |
| **3. Check** | Run **`/status`** | Check the "Health Score." If it's below 70, the AI is struggling. |
| **4. Fix** | If you see a bug, type **`/debug [issue]`** | The AI will perform an "exorcism" to find and kill the bug. |
| **5. Finish** | Type **`/archive-phase`** | This moves old files to "Memory" so the AI doesn't get confused. |

---

## �🗣️ Command Reference

### The "God Mode" Trigger
| Command | Action |
| :--- | :--- |
| **`/godmode [goal]`** | **Full Autopilot**. The agent will design, build, test, self-correct, and document your entire request from start to finish. |

### Operational Commands
| Command | Purpose |
| :--- | :--- |
| **`/status`** | Shows project health, progress, and AI accuracy metrics. |
| **`/decision [topic]`** | Logs a major choice in `DECISIONS.md` (The "Why"). |
| **`/specify [feature]`** | Generates a detailed `FEATURE_SPEC.md` before coding. |
| **`/orchestrate`** | Decomposes roadmap phases into tasks for specialist roles. |
| **`/archive-phase`** | Extracts lessons to knowledge base and clears context. |
| **`/rollback`** | **Panic Button**. Reverts code to the last working version. |
| **`/blocker [msg]`** | Used by the AI to stop work and ask for help. |

---

## 🛠️ Real-World Use Cases

### 1. The Small Business Inventory Tracker
* **User says**: `/godmode Create an app to track my shop inventory using barcode scanning.`
* **AI does**: Defines rules, builds the database, and tests it. Self-corrects any scanner bugs.

### 2. The Smart Home Dashboard
* **User says**: `/godmode Build a dashboard for my Proxmox server that shows CPU usage.`
* **AI does**: Researches server settings, creates visual charts, and ensures real-time updates.

---

## 📂 The Artifact System

| Artifact | Role |
| :--- | :--- |
| **`.planning/PROJECT.md`** | High-level goals and tech stack. |
| **`.planning/ROADMAP.md`** | Multi-phase chronological plan with dependencies. |
| **`task.md`** | The active checklist for the current phase. |
| **`.planning/DECISIONS.md`**| The "Why" behind architectural choices. |
| **`.gsd/AUDIT.md`** | Structured log of all agent actions and approvals. |

---

## 🛠️ Maintainer Guide
To update the GSD system:
1. Modify the workflows in `.agent/workflows/`.
2. Mirror changes to `.gsd/templates/workflows/`.
3. Commit and push to GitHub.

Licensed under MIT. Originally adapted from TÂCHES get-shit-done for Claude Code and influenced by Boris Cherny's workflows for Claude Code.
