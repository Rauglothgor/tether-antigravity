# TETHER Antigravity User Manual

> *The definitive guide to disciplined AI-human collaboration.*

TETHER (v3.0) is a safety cage and workflow protocol for Google Antigravity. It transforms the AI from a simple autocomplete engine into a disciplined engineering partner that follows a strict **"Plan-Then-Execute"** mandate.

---

## 🏛️ Core Philosophy: The Safety Cage

TETHER isn't just a set of templates; it's a **guardrail system** designed to prevent "AI Drift"—the tendency for LLMs to cut corners, hallucinate, or lose track of project goals.

### Mandatory Guardrails
- **Plan-Then-Execute**: The AI *must* create an implementation plan and wait for your approval before writing a single line of code.
- **Metronome Anti-Shortcut Checks**: Every 5 tool calls, the AI pauses to self-audit. It checks for signs of "cutting corners" (like bulk file deletes or using placeholders).
- **60% Context Budget**: To keep the AI sharp, TETHER enforces a context limit. When the AI reaches 60% of its memory capacity, it must archive the current phase and clear its head.
- **No Placeholders**: You will never see `// ... rest of code`. TETHER AI writes complete, functional code or breaks the task into smaller fragments.

---

## 🚀 Getting Started

### 1. Installation
To bring TETHER into your project:

```powershell
# In your project root
git clone https://github.com/Rauglothgor/tether-antigravity.git .tether-temp
Copy-Item -Recurse .tether-temp/* . -Force
Remove-Item -Recurse .tether-temp
```

### 2. Initialization
Once the files are in place, tell the AI:
> "Initialize TETHER for this project."

This will create your core planning directories:
- `.planning/`: Where your goals and roadmaps live.
- `.tether/`: System configuration and internal memory.
- `00_ARCHITECT_BRAIN.md`: The constitution the AI follows.

---

## 🛠️ The TETHER Workflow

A standard TETHER development cycle follows four distinct phases:

1.  **Specify** (`/specify`): Define exactly what you want. This creates a `FEATURE_SPEC.md`.
2.  **Plan**: The AI creates an `implementation_plan.md`. You review and approve.
3.  **Execute**: The AI writes the code, following strict quality standards and auto-linting.
4.  **Verify**: The AI runs tests and creates a `walkthrough.md` to prove it works.
5.  **Archive** (`/archive-phase`): Lessons are extracted, and context is cleared for the next task.

---

## ⌨️ Slash Command Reference

Commands that give you total control over the engine.

| Command | Action | Best Used When... |
|:---|:---|:---|
| `/status` | Shows project health & Traffic Lights. | You want to see if the AI is "tired" or off-track. |
| `/help` | Displays the command reference. | You forget what a command does. |
| `/specify [feature]` | Generates a detailed requirement spec. | You're starting a new feature. |
| `/debug [issue]` | Starts a structured investigation. | Something broke and you don't know why. |
| `/investigate [q]` | Spawns a sub-agent for research. | You need to research a library without making edits. |
| `/decision [topic]` | Logs an Architectural Decision (ADR). | You're choosing between two different approaches. |
| `/godmode [goal]` | Enables full autonomous building. | You have a clear goal and want the AI to handle it end-to-end. |
| `/archive-phase` | Compresses context and saves lessons. | You've finished a major task and the AI feels "slow". |
| `/evergreen-verify` | Scans for deprecated documentation. | You want to ensure your docs match the current code. |
| `/rollback` | Reverts the last set of changes. | The AI went in the wrong direction. |

---

## 📂 Key Artifacts

Understanding the files that power your workspace.

### The Planning Layer (`.planning/`)
- **[PROJECT.md](file:///.planning/PROJECT.md)**: The "North Star". Defines the tech stack and high-level architecture.
- **[ROADMAP.md](file:///.planning/ROADMAP.md)**: The chronological path. Keeps work organized in phases.
- **[DECISIONS.md](file:///.planning/DECISIONS.md)**: The "Why". Tracks every major technical choice.
- **[FEATURE_SPEC.md](file:///.planning/FEATURE_SPEC.md)**: The "What". Detailed requirements for a specific feature.

### The Logic Layer (`.tether/`)
- **[STATE.json](file:///.tether/STATE.json)**: The AI's internal metrics (accuracy, memory usage, health).
- **[FAILURE_MODES.md](file:///.tether/FAILURE_MODES.md)**: A registry of known risks and how to avoid them.
- **[SKILLS_INDEX.md](file:///.tether/SKILLS_INDEX.md)**: Reusable patterns the AI can "learn" from.
- **[AUDIT.md](file:///.tether/AUDIT.md)**: A log of every approval and major action.

---

## 🧠 Global Memory (`.thoughts`)

TETHER allows you to share learnings across **different projects**.

By creating a symbolic link named `.thoughts` that points to a central directory on your PC, Project A's mistakes can become Project B's wisdom. See [GLOBAL_MEMORY_SETUP.md](file:///.tether/GLOBAL_MEMORY_SETUP.md) for setup instructions.

---

## ⚡ Advanced Power Features

### God Mode
Run `/godmode [goal]` to trigger the **BMad Method** (Brain → Map → Act → Done). The AI will autonomously:
1. Specify the feature.
2. Build the architecture.
3. Execute the code.
4. Verify with a browser sub-agent.
5. Archive the result.

### Swarm Architecture
For massive tasks, TETHER can spawn multiple sub-agents to work in parallel. Mention "Swarm Mode" in your plan to activate multi-agent orchestration.

---

## 🚦 Understanding Traffic Lights

The `/status` command uses a traffic light system to report on system health:

- 🟢 **Nominal (85-100)**: AI is sharp, context is clean. Proceed with complex tasks.
- 🟡 **Warning (70-84)**: Context is getting heavy. The AI might start missing details. Consider `/archive-phase`.
- 🔴 **Critical (<70)**: High risk of hallucinations. **Stop work immediately** and run `/archive-phase`.

---

## ❓ FAQ & Common Pitfalls

**Q: The AI is ignoring my instructions.**
**A:** Check `00_ARCHITECT_BRAIN.md`. If the rules are being violated, remind the AI to "Consult the Architect Brain."

**Q: I lost my implementation plan.**
**A:** Plans are always stored in the artifacts directory. Run `/status` to find the path to your current task log.

**Q: Can I skip the planning phase?**
**A:** No. TETHER is designed to prevent technical debt. Skipping the plan is a "Hard Violation" and will degrade the AI's performance.

---

*Welcome to TETHER. Discipline is freedom.*
