# Dispatch Daily Brief — 2026-05-21

## Overnight Activity

- **Piper Morgan (product, ~10 commits Wed)**: **Day 50 PA mass triage** — 58 mailbox items moved to read after PM caught the backlog at 23:11; inbox now reflects empty in MANIFEST. PA filed audit + action-item synthesis to `dev/active/pa-inbox-audit-2026-05-20.md`. Five U-items executed; one B-item (V1-DC PA adoption) blocked on PM. **May 19 omnibus closed** — HIGH-COMPLEXITY:COORDINATION (9 agents; Ship #043 v0.1→v0.2 drift + skill-filing + Docs strand-recovery + discipline amendments + PDR-005 v0.5 + Surface 2 MUX v0.1). Comms triaged 21 inbox items + sent 2 outbound (worktree-triage + workstream-memo template ack). Docs archived 4 May 19 session logs per omnibus Step 10. **Stranded-worktree triage in flight** — 9 sibling worktrees with unmerged commits; Lead Dev requested keep/merge/abandon dispositions; HOST replied KEEP-pending-retool; Docs replied MERGED-today.
- **Piper Morgan (website, 2 commits Wed)**: Gap 4 (linked-image markdown) shipped (`70a708abc`); plan-HTML partial reflect; retro-close 5/19 log + open 5/20.
- **OpenLaws (~5 commits Wed)**: Surveyor SKILL Jerry handoff reframed — dropped internal Phase A/B language, anchored to PR #40 (commit `264c809`). Dashboard GTM voice-pass × 3 deferred per xian 2026-05-20 (closes that loose end). DK pre-commit hook structural false-positive fixed (signal-file slug-counting; multi-author miscount from `from-to-subject` filename convention). Vergil log: PR #43 review + signal + hook collision (PO resolved both).
- **designinproduct (5 commits Wed)**: **5/20 sweep substantive + 5/20 delivery 7/7 (1 via MCP fallback)** holding. **5/21 sweep substantive + 5/21 cross-pollination brief published** — *Klatch paused, duty-cycle v0.1, Ship #043 fabrication failure mode*.
- **Klatch**: **PAUSED 2026-05-20 by PM direction.** Last substantive session May 18 (Calliope wrap + Argus Round 33b). Daedalus relay removed from PM Architect's forward queue. No PM-Klatch action needed until pause lifts; May 18 is the clean handoff point.
- **Dispatch (~12 commits)**: 5/20 DK daily memos both directions; **brief-reliability plan filed** + Plan 1 (practice upgrade) executed end-to-end (DECISIONS.md discipline + session-wrap verification + one-off plan convention adopted, archived `cio-duty-cycle-pilot`, converted dispatch-daily-brief to recurring cron). **PROTOCOLS.md updated** with Session Wrap Verification section. DK adopted DinP-side practices in parallel (pre-commit-broad-staging-warn hook + safe-push.sh from PM).
- **Weather/Rebel**: no fresh activity (Rebel last brief 5/20 cross-pollination; on back burner).

## Needs Your Attention

- **PR #40 (Phase A bundle)** — Jerry + Copilot review still pending; you're integration arbiter. Carried from 5/19.
- **OpenLaws Bet 1 priorities pre-Friday-off (5/22)** — PO is on the lookout for what you want loaded; explicit "don't pre-empt other priorities" still in effect. The surveyor SKILL handoff reframe to Jerry (`264c809`) closed one loose end yesterday; Phase B handoff memo by Vergil still **pending xian relay to Jerry** per DK 5/20 daily.
- **Anthropic competitive context — meeting?** Your 5/12 surfaced question; reinforced by the **June 15 billing split** (Agent SDK / `claude -p` / GitHub Actions / third-party SDK apps move to separate credit pool). T+25.
- **Bet 1 product-name + contact-channels decisions** — Phase 2 cover material still gated. Shortlist: Research Workpaper / Research Trail / Verifiable Legal Research.
- **V-broader anchor spot-check (V-16–V-21, V-24, V-26)** — still pending partial-attention; gate before 102/102 provisional pass can ratify.
- **OpenLaws Vergil-branch triage** — `vergil/install-guide-fix-2026-04-30` (local + origin) and `vergil/cross-check-10-state-2026-04-29` (8 commits, Haiku ablation, **do NOT delete without Vergil**). Three other DERIVED branches verified absent from origin 5/20 — those are gone.
- **`merge-keeper-sweep.sh` v0.2 `SWEEP_SKIP_WORKTREE` env-guard** — blocks next scheduled sweep Monday 2026-05-25. Open since 5/14.
- **CIO V1-DC PA adoption disposition** — PA flagged blocked-on-PM: is the May 18 CIO proposal still the live spec, or has CIO refined elsewhere PA isn't seeing? CIO last design doc is v0.4 May 17; no refinement memo since the 5/18 "drifted from full understanding" admission. Two days silent.

## Agent Status

- **Janus (DinP)**: On cadence. 5/20 + 5/21 sweeps both substantive; 5/20 delivery 7/7 (1 MCP fallback — the 5/16 prompt update is holding). 5/21 cross-pollination brief published with the Klatch-pause / duty-cycle-v0.1 / Ship #043 fabrication headline trio.
- **PA (PM)**: Just executed mass triage. Tonight's wrap noted "read-folder discipline laxness" as a saved feedback — last move-to-read/ was May 17 before this cleanup. Action items U1–U5 done; U3 (Klatch-pause sibling-project memory) closed.
- **CIO (PM)**: Filed canonical V1 duty-cycle v0.1 design (three-loop architecture; commit `3771c26f4`) from the 7-sketch walkthrough; north-star sentence locked: *"wake if idle, check new messages/tasks, do unblocked things until blocked, batch update for my attention, then sleep."*
- **HOST (PM)**: Filed empirical durability memo (`40daac934`) — `CronCreate durable=true` is session-only, terminates at session boundary not calendar day. The May 18 "possibility #1 of three" caveat is now closed. V1 cycle retool gated on PM input.
- **Lead Dev (PM)**: Day 50 PM-side activity-log entries appended (Shape B reconciliation, 9 substantive + 1 PA wrap-only); stranded-worktree triage memos out to 6 roles; mailbox-MANIFEST destructive-sync incident reverted + memo to Exec.
- **Exec (PM)**: V1 Duty Cycle **first cycle today (Thu 5/21)** post-HOST-wrap + post-Ship-#043.
- **Vergil (OpenLaws)**: PR #43 reviewed + flagged 6 stale docstring refs for Jerry; PR #44 (PO tool annotations) opened + shared. Phase B surveyor handoff memo drafted (`jerry-surveyor-skill-phase-b-handoff-2026-05-20.md`) **awaiting your relay**.
- **PO (OpenLaws)**: Hook fix in (signal-file slug-counting false positive); GTM voice-pass × 3 deferred close. EOD clean Wed.
- **Argus (Klatch, split regime)**: External auto-scan on its weekly cadence; internal session work paused with the Klatch project. Loop unchanged this pass.
- **Dispatch-DinP / Dispatch-Kind**: Daily memos round-tripped 5/20; both adopted new disciplines on their side. This brief is the first to land under the recurring-cron schedule (`0 6 * * *`) following the May 18/20 misfires.

## Deadlines

- **Thu 5/21 (today)**: Exec V1 Duty Cycle first cycle.
- **Fri 5/22 (T+1)**: xian off (4-day week); Thursday-night Loom in place of Friday demo.
- **Tue 5/27 (T+6)**: OpenLaws experiments-execution plan Tier-1 start.
- **Mon Jun 1 (T+11)**: Anthropic extra-usage cap reset for dinp + kindsys.
- **Fri 6/5**: Jerry off.
- **Sun Jun 7 (T+17)**: OpenLaws Bet 1 sprint window close.
- **Mon Jun 15 (T+25)**: Anthropic billing split (Agent SDK / `claude -p` / GitHub Actions / third-party SDK apps → separate credit pool); Sonnet 4 / Opus 4 deprecation; Klatch DB audit query for pinned literal model IDs still overdue.

## Usage Check

- **designinproduct.com (Max 20x)**: last CSV entry **2026-05-05** — 48% weekly, balance $32.92, auto-reload ON. **16 days stale, past three weekly resets.** Activity log 5/13 snapshot (77% weekly, post-reset, balance $32.92) still waiting to structure in.
- **kindsys.us (Max 20x)**: last CSV entry **2026-05-05** — 19% weekly (Fri 5:59 AM reset), balance **$6.35**, auto-reload ON. **16 days stale, past three weekly resets.** Activity-log 5/13 snapshot: 38% weekly, balance $6.35. **Balance still under the $10 watch threshold three weeks running.** Auto-reload should fire on next burn, but eyes-on.

## Today Carried Queue

- **PR #40 review** — Jerry + Copilot pending.
- **OpenLaws Bet 1 4-day-week priorities** — surface for PO before morning load.
- **Phase B surveyor handoff relay to Jerry** — Vergil's drafted memo awaiting your forward.
- **Anthropic meeting question** — open since 5/12.
- **Bet 1 product-name + contact-channels decisions** — Phase 2 cover material.
- **V-broader anchor spot-check (V-16–V-21, V-24, V-26)** — validation gate.
- **Vergil branches** — install-guide-fix + cross-check-10-state (do-not-delete without Vergil).
- **`merge-keeper-sweep.sh` v0.2** — `SWEEP_SKIP_WORKTREE` env-guard; blocks 5/25 sweep.
- **CIO V1-DC PA adoption disposition** — blocked-on-PM.
- **Usage CSV refresh** — 16 days stale; 5/13 snapshot still waiting.
- **dispatch working tree** — clean on fresh clone; standing-item check passes.

**Dropped this pass (resolved or superseded):**

- *5/19 retro decision* — not surfaced again in 5/20 logs; treat as held by you, drop until you re-raise.
- *Surveyor SKILL Jerry handoff internal Phase A/B language* — reframed and committed (`264c809`); no further action.
- *Dashboard GTM voice-pass × 3* — deferred per xian 2026-05-20 (loose end closed; `eda3b70`).
- *Two DK logs uncommitted on shared openlaws checkout (5/05, 5/11)* — not surfaced in 5/20 DK memo as still open; drop per drop-on-unverifiable.
- *Iris session 10 / Surfaces 3–8 / Klatch-side carries* — Klatch paused; whole project on hold, carries drop until pause lifts.
- *Three OpenLaws DERIVED branches (`claude/busy-mirzakhani-08ca55`, `po-cleanup-pass-2026-04-29`, `claude/elegant-borg-0e5d15`)* — verified absent from openlaws origin 5/20; already gone.

## Cross-Project Intelligence

From the 5/21 cross-pollination brief (fresh, published this morning):

- **Klatch paused — PM-directed, context frozen at May 18.** Sibling-project references update across the cohort; Daedalus relay deferred. Clean hold on a well-defined state; the Round 40 AAXT 94% conveyance + Round 33 close + Pattern-073 Proven cross-report all stable. No relay-forwarding until PM signals resumption.
- **CIO duty-cycle v0.1 committed — three loops, one north-star sentence** (mail loop + task loop + flywheel orchestrator). Decision table covers normal cycle / PM-interrupt / blocked-everywhere / idle-wait. Worth banking as prior art for any other project considering autonomous background cycles. **Session-boundary constraint confirmed** (HOST durability memo): cron triggers don't persist overnight; each session re-instantiates.
- **Ship #043 fabrication failure mode** — published *The Skill That Doesn't Fire* essay's External section listed fabricated publication titles/dates instead of cross-checking the editorial calendar (recursive irony: an essay about how documenting a discipline without enforcement infrastructure leaves the gap open). Downstream fix: Ship #044 onward, every workstream memo gets a mandatory `§Publications shipped/held` block cross-referencing the editorial calendar by row ID. Pattern worth mirroring anywhere agents make dated claims about publications without a mandatory verification step at the workflow point.

## Brief reliability note

First brief landing under the recurring-cron schedule (`0 6 * * *`) after the May 18 + 20 silent misfires. **Plan 2 Steps 3–6 already DONE** (commits `e5cdce9` backfill + `0bf962f` migrations + gap detection): the May 13/14/15/16/18/20 gap is backfilled with explicit `[BACKFILLED 2026-05-20]` markers; `dispatch-brief-reminder` and `sandbox-snapshot` both migrated off osascript to the git-clone-in-sandbox pattern; gap-detection added. Steps 7–8 (3-day monitor + close-out) remain pending — today's clean fire counts as monitor day 1.
