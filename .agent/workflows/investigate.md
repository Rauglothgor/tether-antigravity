---
description: Spawn isolated research sub-agent to investigate questions without polluting main context
---

# /investigate [question] - Isolated Research Protocol

Spawns a focused investigation that doesn't pollute the main task context.

## Purpose
When you need to research something (e.g., "How does OAuth 2.0 PKCE flow work?"), investigating within the main conversation adds noise that degrades context quality. This command isolates research.

## Process

### Step 1: Create Investigation File
Create `.tether/investigations/[timestamp]_[topic].md` with:
```markdown
# Investigation: [Question]
Date: [timestamp]
Status: In Progress

## Question
[The specific question being investigated]

## Research Notes
[Your findings go here]

## Executive Summary
[TL;DR for main task - written last]

## Sources
[Links, docs, files referenced]
```

### Step 2: Conduct Research
- Focus ONLY on answering the specific question
- Use web search, documentation, codebase exploration
- Do NOT make code changes during investigation
- Do NOT solve the parent task - just gather information

### Step 3: Write Executive Summary
- Distill findings into 3-5 bullet points
- Answer the original question directly
- Note any caveats or edge cases
- Keep under 200 words

### Step 4: Return to Main Task
- Mark investigation file as "Complete"
- Read ONLY the executive summary back to main context
- Delete investigation details from active context
- Continue main task with new knowledge

## Example

**User**: `/investigate How do I handle refresh tokens with Supabase?`

**Result**: Creates `.tether/investigations/20260130_supabase_refresh_tokens.md`

**Returns to main task**:
> Investigation Complete: Supabase handles refresh tokens automatically via `supabase.auth.onAuthStateChange()`. Token refresh happens transparently. Store session in localStorage (default). For SSR, use `@supabase/ssr` package. No manual refresh logic needed.

## Notes
- Keep investigations under 15 minutes
- If answer isn't found, document what you tried
- Complex topics may need multiple focused investigations
