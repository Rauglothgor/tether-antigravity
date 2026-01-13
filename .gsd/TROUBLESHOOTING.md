# TROUBLESHOOTING.md - GSD System Quirks & Fixes (v1.0)

Quick fixes for common technical issues and behavior anomalies.

## 1. Metric Mismatch (`STATE.json`)
*   **Issue**: `completion_percentage` in `STATE.json` doesn't match `ROADMAP.md` progress.
*   **Fix**: 
    1. Check if phase IDs in `ROADMAP.md` match those in `STATE.json`.
    2. Recalculate manually if necessary and update `STATE.json` with `Overwrite: true`.

## 2. Global Workflow Missing
*   **Issue**: `gsd:setup` or other global triggers don't respond.
*   **Fix**: 
    1. Ensure the `.agent/workflows/` directory contains `gsd.md`.
    2. Check if the parent workspace has correctly activated the global workflow template.

## 3. Cursor Drift in Markdown
*   **Issue**: AI edits cause incorrect line number reporting or break links in `.md` files.
*   **Fix**: 
    1. Use `view_file` to get a fresh copy of the file before next edit.
    2. Prefer `replace_file_content` over `multi_replace_file_content` for large blocks to ensure alignment.

## 4. Forbidden File Access
*   **Issue**: Agent claims it cannot access files even when they are in the workspace.
*   **Fix**: 
    1. Verify the file isn't in `.gitignore` if the agent is honoring it.
    2. Refresh the agent's view of the directory using `list_dir`.
    3. Ensure no lock files (e.g., `.git/index.lock`) are present.
