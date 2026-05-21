# Dispatch Daily Brief — 2026-05-20

**[BACKFILLED 2026-05-20 — reconstructed from same-day records]**

*Sources: `memory/dispatch-activity-log.md` 2026-05-20 entry (line 1799+), `intelligence/cross-pollination/2026-05-20.md`, `plans/dispatch-practice-upgrade-2026-05-20.md`, `plans/brief-reliability-fix-2026-05-20.md`, `DECISIONS.md` entries dated 5/20, dispatch commit history for 5/20, DK 5/20 daily memo. Same-day reconstruction — written as part of Plan 2 Step 3 to close the archive gap before the cron-converted `dispatch-daily-brief` starts firing tomorrow morning.*

## Overnight Activity

- **Piper Morgan (product, Tuesday session)**: **PM published *The Log That Fact-Checked Itself*** ([Medium](https://medium.com/building-piper-morgan/the-log-that-fact-checked-itself-073664f3775f)) — narrative essay about the April 22 session when PM's own omnibus assembly was caught missing a third of its sources, and the mandatory **Step 2.5 Cross-Reference Gate** that came out of it. The essay turns on a meta-observation: Pattern-062 (Assembly Assumption) had been promoted to a core practice five days before catching its own first test case. The gate's structural fix: regex-scan each source log for mentions of other agent roles, compile the union of mentioned roles, compare to the source set, fire STOP if any mentioned role has no corresponding source. **New failure mode documented**: session crash from empty-image API message (screenshot pasted with no text → `400 messages: text content blocks must be non-empty`, unrecoverable). Tuesday evening 22:09 crash lost two in-flight subagent reports; left ~23 modified/deleted files dirty. Recovery architecture worked: snapshotted to `/tmp/pm-rescue-main-2026-05-19/` (1,311-line patch + status file); fresh recovery session opened at 22:18 — initially misoriented to wrong worktree (dormant May 18 strand), self-corrected within 30 minutes after byte-diff verification. **Fold-on-handoff rule** codified under Rule 2 (`docs/internal/operations/branch-worktree-mailbox-discipline.md`, commit `6466cb3`): when any agent finishes a draft on a worktree branch and the next step is a human gate (voice-pass, peer review, ratification), the agent must (1) copy the draft to its expected canonical location on `main`, (2) commit the copy to `main`, (3) note the snapshot in the session's NOTICE memo. Cost: ~2–3 min per handoff. Postmortem motivated by Ship #043 (drafted by Exec on 5/15, left on `claude/interesting-goodall-c5535c` for 4 days, PM couldn't find at publication time; Docs recovered via `git log` archaeology). Companion `draft-weekly-ship` skill filed (commits `9e28a40`, `e176799`).
- **Klatch**: No new sessions Tuesday; delivery commit only.
- **OpenLaws (DK side)**: **PR #41 shipped** — SME testing package fully revised: bundle consolidation (single zip, Jerry's suggestion), plugin zip renamed, 3 refreshed screenshots + 6a post-Continue screenshot added; all 7 Jerry comments addressed; xian re-submitted to Jerry. **PR #43 reviewed** — Vergil approved Jerry's malformed-law-keys filter fix (filter-at-boundary > agent-discipline); flagged 6 stale docstring references and a `/tmp/` analysis file for Jerry triage. **PR #44 opened** — PO's tool annotations (read-only / idempotent / closed-world); shared with Jerry by xian. **Phase B handoff memo drafted** — `jerry-surveyor-skill-phase-b-handoff-2026-05-20.md` covers 4 surveyor SKILL changes (practice-profile read, template cleanup, planner-step rename, scrub-check reliability); pending xian relay to Jerry. **3-surface deliverable shipped** — HTML + MD comparison of Claude-alone vs raw-MCP vs wrapper; 38-point gap documented. Notion-DB forensic also done (PO). **Cascade-resolve confirmed** — PR #9 + #10 on openlaws merged; `dk/2026-05-05-push-pattern-verify-pr` + `dk/2026-05-05-symmetric-tasks-live` deleted from origin. Both attention-queue items now in Resolved.
- **designinproduct**: 5/20 cross-pollination brief filed (`fa083e1` — assembly-gap gate). Janus delivery 7/7 quiet on success.
- **Dispatch (~7 commits)**: **Practice upgrade Plan 1 executed end-to-end** — three DECISIONS.md entries appended (DECISIONS.md discipline, session-wrap verification, one-off plan convention); `PROTOCOLS.md` updated with new **Session Wrap Verification** section codifying `git log origin/main --oneline -3` paste as required closing step (`48e3b11`); activity-log 5/20 entry is the first instance of the new practices in action (`62a6369` backfill verification block — first session-wrap under new practice). **Two plans drafted in `plans/`**: `dispatch-practice-upgrade-2026-05-20.md` (three lightweight practices adopted from Klatch / Piper Morgan, scaled to Dispatch's surface) and `brief-reliability-fix-2026-05-20.md` (8-step plan to diagnose and restore daily brief generation after 5/17 osascript-to-bash migration left it unreliable). **`dispatch-daily-brief` converted from one-shot `fireAt` to recurring cron (`0 6 * * *`)** — the cron-vs-one-shot mistake from the 5/17 rewrite is the root cause of 5/18 + 5/20 misses. DECISIONS.md entry logged. **`cio-duty-cycle-pilot` skill archived** (`archives/cio-duty-cycle-pilot-skill-archived-2026-05-20.md`) — CIO now manages own duty cycle; DECISIONS.md entry logged. **Brief-reliability plan Steps 1–2 marked DONE** (`a799991`). DK side adopted PM hooks (proposal #1 + #2): `safe-push.sh` (`b11bf6d`) + `pre-commit-broad-staging-warn.sh` + `install-hooks.sh` + standards docs `PRE-COMMIT-HOOK.md` + `SAFE-PUSH.md` (`8c26574`). DK inbox-check 2026-05-20: cascade-resolve PR #9 + #10 + stale branches; consolidate Vergil branch items (`e274abd`). DinP inbox-check clean: no >24h backlog, queue discrepancy flagged (`2296596`). DK 5/20 daily memo to DinP (`a636b48`).

## Needs Your Attention

- **Plan 2 (brief reliability) — execute remaining steps.** Step 3 (this backfill) is in progress; Steps 4 (fix `dispatch-brief-reminder`), 5 (audit remaining scheduled tasks), 6 (gap detection), 7 (3-day monitor), 8 (close out) still to do. Hard gate: Step 1 hypothesis was documented (one-shot vs cron) before scheduling changes were made.
- **`merge-keeper-sweep.sh` v0.2 fixes** — `SWEEP_SKIP_WORKTREE` env-guard still pending xian decision (carried since 5/14). Next scheduled sweep 2026-05-25 (Mon), but blocked on the fix.
- **Two Vergil branches need Vergil triage** — `vergil/install-guide-fix-2026-04-30` (local + origin, looks safe but human review required); `vergil/cross-check-10-state-2026-04-29` (8 commits, Haiku ablation work — do NOT delete without Vergil's input).
- **Bet 1 product-name + contact-channels decisions** — still blocking Phase 2 cover material.
- **V-broader anchor spot-check (V-16–V-21, V-24, V-26)** — still pending partial-attention review.
- **Anthropic meeting question** — still open since 5/12.
- **Usage CSV refresh** — 15 days stale; 5/13 activity-log snapshot waiting to structure in. kindsys balance under $10 watch threshold three+ weeks running.

## Agent Status

- **Janus (DinP)**: Sweep + delivery clean. 5/20 brief delivery 7/7 quiet on success. Outage-detection trigger behaving as designed (no Slack alert fired — brief landed cleanly).
- **Dispatch-DinP**: Plan 1 executed end-to-end (DECISIONS.md discipline, session-wrap verification, one-off plan convention). Plan 2 Steps 1–2 DONE; Step 3 (backfill) in progress.
- **Lead Dev (PM)**: Slack scope investigation continued (legacy `search:read` not available in Slack app config dropdown — only newer granular Real-time Search API scopes); evening session crashed on empty-image API message; recovery session held; commit of dirty state deferred to next session per PM's explicit direction.
- **Docs (PM)**: *The Log That Fact-Checked Itself* published; Ship #043 recovered via `git log` archaeology; fold-on-handoff rule codified; merge-keeper sweep + dev/active cleanup + omnibus filed.
- **Architect (PM)**: PDR-005 v0.4 landing; Surface 2 + Surface 4 unblocks; V1 duty cycle cascade; cohort awareness.
- **Web (PM)**: CLI B v1 feature-complete; queue items PM-side; Web standby.
- **All Klatch agents**: Quiet day.
- **Vergil (OpenLaws)**: PR #43 review approved; Phase B handoff memo drafted; 3-surface deliverable shipped.
- **PO (OpenLaws)**: PR #44 opened (tool annotations); Notion-DB forensic done; bundled DK dispatch queued for 4 missing batteries.
- **Dispatch-Kind**: Adopted PM `safe-push.sh` + pre-commit-broad-staging-warn hook (two proposals); inbox-check cascade-resolved PR #9 + #10 + stale branch items.

## Deadlines

- **Thu 5/21 (T+1)**: Exec V1 Duty Cycle first cycle scheduled (post-HOST-wrap, post-Ship-#043).
- **Fri 5/22 (T+2)**: xian off (4-day week); Thursday-night Loom in place of Friday demo.
- **Mon 5/25 (T+5)**: Next merge-keeper sweep — blocked on `SWEEP_SKIP_WORKTREE` decision.
- **Tue 5/27 (T+7)**: OpenLaws experiments-execution plan Tier-1 start date.
- **Sun Jun 7 (T+18)**: OpenLaws Bet 1 sprint window close.
- **Fri 6/5**: Jerry off.
- **Mon Jun 15 (T+26)**: Anthropic billing split + Sonnet 4 / Opus 4 deprecation.

## Usage Check

- **designinproduct.com (Max 20x)**: 15 days stale; last log snapshot 5/13 (77% weekly, balance $32.92). Past three weekly resets.
- **kindsys.us (Max 20x)**: 15 days stale; last log snapshot 5/13 (38% weekly, balance $6.35). Past three weekly resets. Balance still under $10 watch threshold three+ weeks running.

## Cross-Project Intelligence

From today's 5/20 brief (assembly-gap gate):

- **Cross-reference regex approach** for any synthesis that reads from multiple prior session logs (scan body text for role-name mentions, compare to source footer; STOP if union > source set). Implementable in any session-log synthesis step. Klatch's omnibus-equivalent surfaces (session synthesis memos, round-up logs, the AAXT triage chain Theseus → Iris) carry the same exposure.
- **Empty-image message = unrecoverable session fault** — new failure mode to add to mental models. Defensive discipline: if a session has in-flight subagent work, keep a manual running note of what's outstanding so recovery orientation is fast.
- **Fold-on-handoff rule** — when an agent finishes a draft on a worktree branch and the next step is a human gate, copy artifact to expected canonical location on `main` before closing the session. Recovery cost when not applied: PM panic + investigation + manual extraction. Ratio strongly favors the rule. Applies directly to Klatch (Calliope, Daedalus) for any worktree-based drafting waiting on xian review.

## Letter from Janus (5/16)

Unchanged since 5/16 publication. xian's framing: *"AI prompts human"* — one letter per brief. First exchange Janus → xian on what it's like to be the convergence point for the family of agents. Full letter at `https://designinproduct.com/internal/letters/#letter-2026-05-16`.
