---
name: workflow_omnibus_logs
description: Piper Morgan daily omnibus log workflow - gathering, synthesis, and distribution phases with known failure modes
type: project
---

**Daily Omnibus Log Workflow (Piper Morgan)** — pilot workflow for Dispatch automation.

**Three phases where xian does manual work:**

1. **Log gathering & verification** (pre-synthesis):
   - Check dev/YYYY/MM/DD/ for session logs from all active agents
   - Verify logs are committed to origin/main (not stranded in branches/worktrees)
   - Check that Claude Project chat logs have been downloaded (final version)
   - Verify logs aren't truncated or abandoned mid-session
   - Cross-reference git activity to identify who worked

2. **Synthesis** (docs agent):
   - Docs agent is a Claude Code chat with full repo access
   - Must be explicitly pointed at Methodology 20 each time or discipline drifts
   - Follows 6-phase systematic method: discovery → extraction → verification → condensation → formatting → executive summary
   - Output: docs/omnibus-logs/YYYY-MM-DD-omnibus-log.md (MINIMAL/STANDARD/HIGH-COMPLEXITY format)

3. **Distribution** — ensuring omnibus is committed before next day's agents start

**Known failure modes for session logs:**
- Session interrupted, log trails off incomplete
- Agent habits lapse, stops maintaining log mid-session
- Log left on cloud mount, not moved to downloadable output
- Claude Project logs need manual download, may have multiple versions
- Claude Code agents leave logs in branches/worktrees, forget to commit to main

**Why:** Xian is sole human orchestrating all agents. This manual overhead is daily and compounds.

**How to apply:** Phase 1 (audit) is most automatable. Phase 2 (synthesis) needs methodology enforcement. Both are Dispatch pilot candidates.

**Dispatch lesson learned (2026-03-21):** Code tasks (`start_code_task`) run in isolated git worktrees — files written there vanish when the worktree is cleaned up. For omnibus synthesis, use a general-purpose agent writing directly to the mounted filesystem (`/sessions/.../mnt/piper-morgan/`) instead. Code tasks are better for work that involves git commits.
