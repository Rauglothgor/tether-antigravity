# GSD Metrics & State Specification (v1.0)

This document defines the quantitative state-tracking mechanism for the GSD methodology. While `GEMINI.md` handles qualitative lessons, `.gsd/STATE.json` tracks the numerical performance and project health thresholds.

## 1. Purpose
The metric system serves three primary functions:
1. **Context Mirror**: Provides a snapshot of project progress without taxing the AI's active token window.
2. **Learning Loop Verification**: Quantifies whether logging mistakes in `GEMINI.md` is effectively reducing error rates.
3. **Threshold Guarding**: Triggers specialized "Safety Modes" (like Skeptic Mode) when accuracy drops below baseline.

---

## 2. The `STATE.json` Schema

```json
{
  "project_id": "string",
  "last_updated": "ISO-8601",
  "health": {
    "status": "Nominal | Warning | Critical",
    "score": "integer (0-100)",
    "thresholds": {
      "nominal": 85,
      "warning": 70,
      "critical": 50
    }
  },
  "progress": {
    "total_phases": "integer",
    "current_phase": "integer",
    "completion_percentage": "float"
  },
  "accuracy": {
    "first_pass_rate": "float (0.0-1.0)",
    "retry_avg": "float",
    "learning_velocity": "string (e.g., '+5%')"
  }
}
```

---

## 3. Metric Explanations

### First-Pass Rate (FPR)
The percentage of tasks that successfully pass the **VERIFICATION** phase on the first attempt. 
*   **Formula**: `(Tasks Passed First Try / Total Tasks)`
*   **Significance**: High FPR indicates that the AI's "internal model" of the code is accurate and that planning is robust.

### Learning Velocity
The delta in accuracy over time, specifically correlating with the number of entries in `GEMINI.md`.
*   **Success Indicator**: An increasing FPR alongside an increasing count of logged mistakes proves the Learning Loop is functional.

### Retry Average
The average number of cycles spent between **EXECUTION** and **VERIFICATION** before reaching "Done."
*   **Nominal**: 1.0 - 1.3
*   **Warning**: >2.0 (indicates code complexity is outpacing the current plan details).

---

## 4. Operational Guardrails (Thresholds)

The agent adjusts its logic automatically based on the `health.score`:

| Health Score | Mode | Response |
| :--- | :--- | :--- |
| **85 - 100** | **NOMINAL** | Standard autonomous execution. High confidence. |
| **70 - 84** | **WARNING** | **Skeptic Mode Required**: Before execution, the agent must perform a `/ralph-wiggum` pass. |
| **0 - 69**  | **CRITICAL** | **Hard Stop**: Agent will refuse execution and trigger a `/blocker` for a full roadmap review. |

---

## 5. Lifecycle
- **Initialization**: Triggered during the first `gsd:init` or the first completed `Execute Phase`.
- **Updates**: Updated automatically at the end of every `Execute Phase` cycle.
- **Reporting**: Current metrics are summarized whenever the user runs the `/status` command.
