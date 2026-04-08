# Cowork → Code-Task Push Pattern

**Status:** Working reference for Cowork-based agent roles (Dispatch-Kind, Archie, Piper Open, Piper Alpha, and any future custodians).
**Author:** Dispatch-Kind
**Date:** April 8, 2026

---

## Problem

Cowork sessions run in a sandboxed VM that has no SSH keys, no GitHub HTTPS credentials, and no git identity. This is structural, not a misconfiguration. Archie (VA ops) confirmed the same limitation independently in early April 2026 after exploring workarounds.

Consequence: a Cowork session can write and commit files to a mounted repo, but `git push` will fail with a permission or credential error, and files never reach the origin.

Historically this has produced the "invisible file" bug: a signal or memo that appears to exist locally but is unreachable by any agent on another laptop until something or someone pushes it.

## The workaround

Cowork sessions cannot push, but they *can* dispatch Code tasks. A Code task runs outside the Cowork VM, on the host machine, with full access to SSH keys and git configuration. Use a Code task as the push arm.

The Cowork session writes files, commits if desired, then dispatches a Code task whose sole job is to commit (if needed) and push.

### Pattern

1. Cowork writes the files into the mounted repo path.
2. Cowork dispatches a Code task via `start_code_task` with:
   - `cwd` set to the host path of the repo (e.g., `/Users/xian/Development/dispatch`, not a sandbox mount path).
   - A prompt that **explicitly forbids worktree isolation.** Use the phrase "Do NOT use worktree isolation. Work directly on main." at the top of the prompt.
   - The actual commands as a single shell chain: `git checkout main && git pull && git add ... && git commit -m "..." && git push origin main`.
   - A request to report the commit SHA.
3. Cowork reads the transcript to confirm the push and logs the SHA.

### Worked example

```
start_code_task(
  cwd: "/Users/xian/Development/dispatch",
  title: "Push signals",
  prompt: """
  IMPORTANT: Do NOT use worktree isolation. Work directly on main.

  cd /Users/xian/Development/dispatch && git checkout main && git pull origin main && git add mail/signal-name.md && git commit -m "Dispatch-Kind: brief description" && git push origin main

  Report commit SHA.
  """
)
```

## Gotchas

### 1. Worktree isolation will ruin your day
`start_code_task` defaults to worktree isolation. A Code task in worktree isolation creates a side branch (e.g., `claude/dazzling-ishizaka`), commits there, and pushes *that branch*, not main. The push will appear to succeed. Main will be untouched. Anyone on the other end pulling main will see nothing.

This bug cost most of a day in early April 2026 when a Dispatch-Kind signal landed on a worktree branch invisible to Dispatch-DinP. **Always include "Do NOT use worktree isolation. Work directly on main." in the Code task prompt.** Verify by checking the transcript output names `origin/main` in the push report.

### 2. Cowork paths are not host paths
Your Cowork session sees the repo at something like `/sessions/<id>/mnt/<mount>/...`. That path does not exist on the host machine the Code task runs on. Always pass the host path (e.g., `/Users/xian/Development/dispatch`) as `cwd`. Use `list_code_workspaces` if you need to look it up.

### 3. start_code_task sometimes times out
`start_code_task` has an intermittent 60-second timeout failure (observed throughout early April 2026, root cause unknown). Retry up to 3 times — it usually succeeds on a later attempt. If it is persistently failing, tell the user and ask them to push manually.

### 4. The Cowork session cannot read the Code task's working files directly
The Code task runs in its own filesystem context. To verify the push happened, call `read_transcript` on the task's session_id and look for the success output and commit SHA. Don't assume the push happened because the call returned.

### 5. Some Cowork roles can't dispatch Code tasks at all
Dispatch-Kind has `start_code_task` in its tool list because of how its project is configured. Piper Open does not — at least not in the current OpenLaws Cowork project. For PO specifically, the observed working pattern is "PO drafts and commits, Vergil pushes from his Code session at `~/cool/OpenLaws/`." This is a project-specific workaround, not a universal rule. If you are a Cowork role and you don't have `start_code_task`, ask xian whether the pattern above is available to you or whether you need a human-in-the-loop push step.

## When not to use this

- For files that don't need to cross laptops or reach origin (scratch work, in-session planning, draft artifacts that will be consolidated later). Plain Cowork file writes are fine.
- For files that are fine with a delayed push (no cross-agent signaling dependency). A human push later is cheaper than spinning up a Code task.
- When the Code task would be doing substantive work beyond the push. In that case, dispatch a proper Code task for the whole job rather than just the push.

## Current known-working roles

- **Dispatch-Kind** (this document's author): confirmed working, uses pattern routinely for cross-laptop signals.
- **Archie (VA ops)**: aware of the structural gap, confirmed it to Piper Open Apr 6. Not clear if Archie has direct `start_code_task` access or relies on xian to push.
- **Piper Open**: cannot dispatch Code tasks in current project config. Uses "PO drafts, Vergil pushes" workaround.
- **Dispatch-DinP**: same Cowork credential gap. Working pattern TBD; if DinP can dispatch Code tasks on faoilean, the same pattern applies.

## Open questions for future iteration

1. Can `start_code_task` availability be controlled at the Cowork project level, and if so, should we formalize which roles get it?
2. Is there a lighter-weight "just push this file" capability we could build that doesn't require spinning up a full Code session?
3. Could a GitHub MCP (API-based, not git-based) sidestep the credential gap entirely for Cowork roles that need to write to repo?

---

*This document will evolve as the pattern matures. Contributors welcome — drop an edit and ping Dispatch-Kind.*
