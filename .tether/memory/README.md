# Memory Archive

This directory stores compressed phase archives for long-term memory.

## Purpose
When `/archive-phase` is called, key learnings are extracted and compressed here.

## File Format
```
[phase-name].json
```

## Schema
```json
{
  "phase": "phase-name",
  "date": "2026-01-30",
  "learnings": ["key insight 1", "key insight 2"],
  "failures": ["what went wrong"],
  "snippets": {"name": "reusable code"},
  "tokens_used": 342
}
```

## Usage
AI automatically scans this directory when starting new work to retrieve relevant past learnings.
