# Dispatch-Kind Work Queue

DK's own work queue. Persistent across sessions so nothing falls off the conversation buffer.

**How it works:**

- Updated at session-open (sync from queue → today's intent), at every task transition, and at session-end (rotate completed items out).
- Companion to `xian-attention-queue.md`: that one captures items needing xian's input; this one captures DK's in-flight and pending work.
- Cross-cutting across the `dispatch/` and `openlaws/dispatch/` repos. Source signals are referenced by path.
- Completed items roll out after ~7 days. Anything that needs longer-term memory goes into the `/agent/memory/` files.

---

## In Progress

- **[2026-05-21] Cross-pollination adoption proposals — working through six.** Three of six landed; three remaining. Next session resumes wherever xian directs. Doc: `proposals/2026-05-19-cross-pollination-adoptions.md`.
  - #1 safe-push.sh wrapper ✓ ADOPTED 5/20 (commits `b11bf6d` dispatch, `212bf5e` openlaws + companion). Self-tested in production on first invocation; routine scheduled-task usage on 5/20 daily-memo confirmed clean.
  - #2 pre-commit-broad-staging-warn hook ✓ ADOPTED 5/20 (commits `8c26574` dispatch, openlaws via PO `25a80f2` calibration). **Calibration open:** PO surfaced structural false-positive on signal filenames and fixed it; my `exit 2 = warn` comment is wrong (git blocks on non-zero); my warn-mode fix was reverted to block-mode; xian to decide warn vs block. See `signal-piper-open-to-dispatch-kind-2026-05-20-hook-false-positive-fixed.md`.
  - #3 Pattern-073 + doc-sync-sweep — pending
  - #4 mail/read/ close discipline — pending
  - #5 worktree.bgIsolation: "none" — pending
  - #6 June 15 billing-split awareness to John — pending

- **[2026-05-20] Notion DB rediscovery + build pass.** PO requested four Notion DBs covering the missing regression batteries (raw-MCP-vs-wrapper, V-broader wrapper, FAR, 5/13 baseline). PO signal: `openlaws/dispatch/signal-piper-open-to-dispatch-kind-2026-05-20-notion-db-build-bundle.md`. Forensic memo: `openlaws/workdesk/bet-1/research/notion-db-forensic-2026-05-20.md`. Discussion still pending with xian on schema + priority + shape; rediscovery pass needed before build work.

## Pending

(none — both items above absorbed all prior pending state)

## Awaiting External

- **[2026-05-21] Hook block-vs-warn decision.** Three options proposed to xian (warn-only / block-on-trigger / threshold-tiered). DK lean: warn-only. PO lean: warn-only. xian's revert preserved block; final call pending. See in-progress item above.
- **[2026-05-19] Six adoption proposals — work through one at a time.** xian green-lit proceeding in order; #1 + #2 done.
- **[2026-05-14] merge-keeper-sweep.sh v0.2 fixes.** Worktree-scope bug (Phase 3 nukes ALL worktrees, not just EMPTY-pinning ones). Documented in `xian-attention-queue.md`.
- **[2026-05-14] Vergil branches review.** `origin/vergil/cross-check-10-state-2026-04-29` (8 commits, Haiku ablation work — needs Vergil's input, not xian's).

**Resolved on prior cycles:**
- ~~Stale branch cleanup~~ — PRs #9 #10 merged 5/20; branches deleted; queue cascade-resolved 5/20.
- ~~osascript-MCP session anomaly~~ — three consecutive scheduled-task fires confirmed working; queue item closed 5/14.

## Completed (rolling 7 days)

### 2026-05-21

- **DinP comms — round-trip transport verified healthy in both directions.** xian acknowledged 5/21 morning. Daily-memo and inbox-check both running clean on osascript bridge + safe-push.sh + Phase 0.5 verify-before-querying. DinP-side reform (DECISIONS.md adoption, CIO duty-cycle skill archive) showing up in our Phase 0 pulls without intervention.

### 2026-05-20

- **safe-push.sh wrapper (proposal #1).** Lifted from PM commit `04a86ef6`, adapted to drop `-u` from stash (shared-checkout discipline), installed in both dispatch + openlaws. Standards doc at `dispatch/standards/SAFE-PUSH.md`. Self-tested in production on its first invocation (the very push that landed the script exercised the retry logic — landed at attempt 2 after auto-rebase).
- **pre-commit-broad-staging-warn hook (proposal #2).** Lifted from PM, adapted per-repo. Installed via `scripts/hooks/*.sh` + `scripts/install-hooks.sh` + `.git/hooks/pre-commit` symlinks in both repos. Bug: BSD sed alternation unreliable, rewrote with awk. Second bug: exit-2-as-warn comment is Pattern-073 (PM's claim doesn't match git semantics; git blocks on non-zero); PO surfaced and partially patched with signal-filename exclusion; calibration decision still open.
- **Six-proposal adoption batch initiated.** Cross-pollination innovations from PM + Klatch sized as individual decisions, working through in order per xian's preference for thorough/methodical over fast.
- **Openlaws missing DK content backfilled.** Two stale DK session logs (5/05 + 5/11) landed at `a669a2a` after merge-keeper sweep flagged them. xian asked, DK delivered.
- **Merge-keeper sweep on openlaws.** First weekly run since 5/13. Surfaced two safety bugs in the sweep script itself (Phase 3 worktree over-removal, missing safelist). Sweep report at `logs/2026-05-14-dispatch-kind-log.md`; queue items for fixes still active.

### 2026-05-19

- **Six adoption proposals authored.** Single doc at `proposals/2026-05-19-cross-pollination-adoptions.md` with summary table + per-proposal decision shape. Caught up on cross-pollination briefs 5/16–5/19.
- **Stale-clone-or-context signal to DinP.** Brief observational signal at `mail/signal-dispatch-kind-to-dispatch-dinp-2026-05-19-stale-clone-observation.md`; updated my own SKILL.md Phase 0.5 to verify-before-querying.

### 2026-05-13

- **Install-paths matrix recon.** Vergil signal closed.

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
