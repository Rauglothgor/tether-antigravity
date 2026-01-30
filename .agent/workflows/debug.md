---
description: Structured debugging protocol for investigating and fixing bugs
---

# /debug [issue] - Bug Investigation Protocol

When the user reports an issue, follow this structured debugging protocol:

## Phase 1: Understand
1. **Clarify the symptom**: What exactly is happening vs. what should happen?
2. **Reproduce**: Can you trigger the bug consistently?
3. **Isolate**: When did it last work? What changed?

## Phase 2: Investigate
1. **Check recent changes**: Review files modified in the last session
2. **Read error messages**: Parse stack traces, logs, console output
3. **Trace the flow**: Follow data/execution path to find where it breaks
4. **Check assumptions**: Verify inputs, state, dependencies

## Phase 3: Hypothesize
1. **Form 2-3 hypotheses**: What could cause this behavior?
2. **Rank by likelihood**: Most probable first
3. **Design tests**: How to confirm/reject each hypothesis?

## Phase 4: Fix
1. **Implement smallest fix**: Don't refactor - just fix the bug
2. **Test the fix**: Verify it resolves the original symptom
3. **Check for regressions**: Did the fix break anything else?
4. **Document**: Log the bug and fix in GEMINI.md

## Phase 5: Prevent
1. **Add guard**: Can a test/validation prevent this in future?
2. **Update FAILURE_MODES.md**: If this is a new failure pattern

## Output Format

After debugging, provide:
```
## Bug Report: [Brief Title]

**Symptom**: [What was happening]
**Root Cause**: [What caused it]
**Fix Applied**: [What you changed]
**Verification**: [How you confirmed it's fixed]
**Prevention**: [What guards against recurrence]
```

## Notes
- Do NOT refactor unrelated code while debugging
- If fix requires significant changes, create a plan first
- If stuck after 15 minutes, escalate with `/blocker`
