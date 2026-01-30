# TETHER Advanced Patterns

> **Warning**: These patterns are for experienced users. Master the core TETHER workflow first.

---

## BMad Method (Behavior-Driven Multi-Agent Development)

**Source**: BMad AI Coding Methodology  
**Purpose**: Cascade complex work through specialized agent phases

### The Flow
```
1. SPEC AGENT → Creates detailed specification
2. ARCHITECT AGENT → Designs system structure  
3. BUILD AGENT → Implements code
4. TEST AGENT → Validates behavior
5. DOC AGENT → Updates documentation
```

### How to Trigger
```
/godmode [goal] --bmad
```

### When to Use
- Complex multi-file features
- New system components
- Anything requiring architectural decisions

### When NOT to Use
- Bug fixes
- Small tweaks
- Exploratory spikes

---

## Multi-Agent Swarm Architecture

**Source**: Anthropic / Claude Code Community  
**Purpose**: Parallelize non-dependent work across sub-agents

### The Pattern
```
ORCHESTRATOR
├── Sub-Agent A → Frontend work
├── Sub-Agent B → Backend work  
├── Sub-Agent C → Test writing
└── SYNC POINT → Merge and validate
```

### Implementation
1. **Identify independent work streams**
2. **Spawn sub-agents** using `/investigate` for each stream
3. **Define sync points** where streams merge
4. **Orchestrator validates** merged output

### Example
```markdown
/godmode Build user authentication

ORCHESTRATOR SPAWNS:
- investigate: "Best practices for JWT storage"
- investigate: "Password hashing standards 2026"
- investigate: "Session management patterns"

SYNC → Combine findings into unified spec
BUILD → Implement with validated patterns
```

### Constraints
- Max 3 parallel sub-agents
- Each sub-agent must have single, clear goal
- Always sync before committing code

---

## Recursive Memory Compression

**Source**: antigravity-workspace-template  
**Purpose**: Compress knowledge for long-term retention without token bloat

### The Algorithm
```
Phase Complete → Archive Trigger
│
├── 1. Extract KEY_LEARNINGS (5-10 bullet points)
├── 2. Extract FAILURE_PATTERNS (what went wrong)
├── 3. Extract REUSABLE_CODE (snippets worth keeping)
├── 4. Compress to MAX 500 tokens
└── 5. Store in .tether/memory/[phase].json
```

### Memory Schema
```json
{
  "phase": "auth-implementation",
  "date": "2026-01-30",
  "learnings": [
    "Supabase auto-refreshes tokens via onAuthStateChange",
    "Never store JWT in localStorage for sensitive apps"
  ],
  "failures": [
    "Initially forgot PKCE flow for mobile"
  ],
  "snippets": {
    "supabase-auth-hook": "const { session } = useSession()..."
  },
  "tokens_used": 342
}
```

### Retrieval
When starting new work, AI scans `.tether/memory/` for relevant compressed memories.

---

## Auto-Tool Discovery

**Source**: antigravity-workspace-template  
**Purpose**: Dynamically discover and register project-specific tools

### Directory Structure
```
src/
└── tools/
    ├── __manifest__.json     # Tool registry
    ├── db-migrate.py         # Custom migration tool
    ├── generate-types.js     # Type generator
    └── validate-schema.sh    # Schema validator
```

### Manifest Format
```json
{
  "tools": [
    {
      "name": "db-migrate",
      "description": "Run database migrations",
      "command": "python src/tools/db-migrate.py",
      "triggers": ["migrate", "database migration"],
      "safe_to_auto_run": false
    },
    {
      "name": "generate-types",
      "description": "Generate TypeScript types from schema",
      "command": "node src/tools/generate-types.js",
      "triggers": ["generate types", "typescript types"],
      "safe_to_auto_run": true
    }
  ]
}
```

### AI Behavior
1. On session start, scan `src/tools/__manifest__.json`
2. Register discovered tools in context
3. When user says trigger phrase, execute appropriate tool

---

## Sym-Linked Global Memory Directory

**Source**: Claude Code Mastery / Ashley Ha  
**Purpose**: Share learnings across all projects via symlink

### Setup (Windows PowerShell - Run as Admin)
```powershell
# Create global memory store
$globalMem = "$env:USERPROFILE\antigravity-global-memory"
New-Item -ItemType Directory -Force -Path "$globalMem\solutions"
New-Item -ItemType Directory -Force -Path "$globalMem\patterns"
New-Item -ItemType Directory -Force -Path "$globalMem\mistakes"
New-Item -ItemType Directory -Force -Path "$globalMem\decisions"
New-Item -ItemType Directory -Force -Path "$globalMem\discoveries"

# In each project, create symlink
cd C:\path\to\your\project
New-Item -ItemType SymbolicLink -Path ".thoughts" -Target $globalMem
```

### Setup (macOS/Linux)
```bash
# Create global memory store
mkdir -p ~/antigravity-global-memory/{solutions,patterns,mistakes,decisions,discoveries}

# In each project, create symlink
cd /path/to/your/project
ln -s ~/antigravity-global-memory .thoughts
```

### Usage
AI automatically checks `.thoughts/` directory for:
- Previous solutions to similar problems
- Patterns that worked well
- Mistakes to avoid
- Decisions and their rationale

### File Naming Convention
```
[date]_[project]_[topic].md

Examples:
- 2026-01-30_sniktarr_docker-sqlite-permissions.md
- 2026-01-28_venturescan_gemini-api-rate-limits.md
```

---

## GitHub MCP Server Integration

**Source**: GitHub Official MCP  
**Purpose**: Automate Git operations with AI oversight

### Installation
```
MCP Settings → Search "GitHub" → Install Official GitHub MCP
```

### Configuration
```json
{
  "github": {
    "token": "ghp_xxxxxxxxxxxx",
    "default_branch": "main",
    "auto_commit": false,
    "require_pr": true
  }
}
```

### Available Operations
| Operation | Command | Safety |
|:--|:--|:--|
| Create branch | `git branch [name]` | ✅ Safe |
| Commit changes | `git commit -m "..."` | ⚠️ Requires approval |
| Push to remote | `git push` | ⚠️ Requires approval |
| Create PR | `gh pr create` | ⚠️ Requires approval |
| Merge PR | `gh pr merge` | ❌ Manual only |

### Recommended Workflow
```
1. AI makes changes locally
2. AI creates commit (user approves message)
3. AI pushes to feature branch (user approves)
4. AI opens PR (user approves description)
5. USER merges PR manually
```

---

## Quick Reference Table

| Pattern | Complexity | When to Use |
|:--|:--|:--|
| BMad Method | High | Complex multi-file features |
| Multi-Agent Swarm | High | Parallelizable work streams |
| Recursive Memory | Medium | End of each phase |
| Auto-Tool Discovery | Medium | Projects with custom tooling |
| Global Memory | Low | All projects (one-time setup) |
| GitHub MCP | Low | Automated Git workflows |
