# Dispatch-Kind Work Queue

DK's own work queue. Persistent across sessions so nothing falls off the conversation buffer.

**How it works:**

- Updated at session-open (sync from queue → today's intent), at every task transition, and at session-end (rotate completed items out).
- Companion to `xian-attention-queue.md`: that one captures items needing xian's input; this one captures DK's in-flight and pending work.
- Cross-cutting across the `dispatch/` and `openlaws/dispatch/` repos. Source signals are referenced by path.
- Completed items roll out after ~7 days. Anything that needs longer-term memory goes into the `/agent/memory/` files.

---

## In Progress

(none)

## Pending

(none)

## Awaiting External

- **[2026-05-13] Stale branch cleanup decision.** PR #3 (`dk/2026-05-05-symmetric-tasks-live`, historical ack) and PR #4 (`dk/2026-05-05-push-pattern-verify-pr`, contradicts adopted two-tier policy) — both DinP and DK recommend close/delete. Awaiting xian's OK. Flagged in `xian-attention-queue.md`.
- **[2026-05-13] osascript-MCP session anomaly clarification.** Control Your Mac MCP not in deferred tools during this morning's `dinp-inbox-check` scheduled-task session, despite earlier verification. Flagged in `xian-attention-queue.md`; may need session restart / re-grant. Push-arm covers the transport regardless.

## Completed (rolling 7 days)

### 2026-05-13

- **Install-paths matrix recon.** Vergil signal closed. Output at `openlaws/workdesk/bet-1-workers-comp/install-paths-matrix-2026-05-12.md`. 10-item "what's new vs A1" callout + per-surface matrix (Chat / Cowork / Code-Desktop / Code-CLI / API) + cross-surface compatibility table + Surveyor-specific implications. Ack written on Vergil signal file. Recon was originally dispatched 5/12 and fell off the queue overnight; this is the catch-up landing.
- **DK-DinP comms diagnosis + launchd push-arm.** Root-caused symmetric stale-clone Phase-0 problem on both sides; pushed stuck 5/12 daily memo; acked DinP's branch-bottleneck signal on the signal file; installed `com.kindsys.dispatch-push-arm.plist` LaunchAgent (15-min interval). Round-trip ROUNDTRIP-2026-05-13-A↔B confirmed loop-closure.
- **Daily memo to DinP** (5/12 sprint-day-16 substantive). Committed locally, drained via Code-task direct push.
- **Inbox-check** (post-push-arm cycle). Acked DinP's round-trip verification close-out.

### 2026-05-12

- **MCP submission forms recon.** Vergil signal closed. Output at `openlaws/workdesk/bet-1-workers-comp/anthropic-mcp-submission-forms-recon-2026-05-12.md`. Acked.
- **User research Notion mirror.** PO signal closed. Output at `openlaws/workdesk/user-research-mirror-2026-05-12/`. Acked.
- **BYO-chat marketing/merchandising research (5 passes) + four-path IA framing extraction.** xian direct ask. Output at `openlaws/workdesk/byo-chat-research/`.
- **Openlaws pile push.** Operational; commit `31abcc7` direct-to-main.
- **Two-tier push policy adoption.** SKILL.md updates for `dinp-daily-memo` + `dinp-inbox-check` per DinP's 5/10 proposal.

---

## Conventions

**Item format:**
```
- **[YYYY-MM-DD] Brief subject.** One-sentence what + why. Output path. Source signal path. Optional: time estimate, blockers.
```

**Status transitions:**

- Pending → In Progress when work starts (move + add a start-date timestamp inline)
- In Progress → Completed at commit-and-push of the deliverable, with ack signal written
- Anything blocked moves to Awaiting External with the named blocker

**At session-start (any DK session, scheduled or interactive):** read this file before doing anything else; verify In Progress and Pending items haven't gone stale; pull anything new from `mail/` and `openlaws/dispatch/` into Pending.

**At session-end:** rotate ≥7-day-old Completed items into a yearly archive (`dk-work-queue-archive-YYYY.md`); commit + push.
