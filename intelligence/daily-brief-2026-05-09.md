# Dispatch Daily Brief — 2026-05-09 (Saturday)

## Overnight Activity

- **Piper Morgan (product, ~17 commits)**: Late-day Friday surge. **PreCompact hook (#86) shipped** — third sign-off layer (warn-only, fires before context compaction; logs to `dev/active/session-end-warnings.log`). **#1063 stale-test rewrite closed in 15 min**: 12 skips → 0; standup directory now 363/363 zero-skip (subagent-annotates → next-session-rewrites arc clean). **P0 #1064 fabrication-regression hypothesis REFUTED** — apparent 9% drop (72.1% → 65.6%) is judge miscalibration + fixture pollution, not LLM degeneration. Smoking gun: Q56 "show my todos" flagged as fabrication, but the canonical user had 15 real DB rows accumulated from prior retest "add todo" mutations without cleanup. 0/10 auto-fails were pure fabrication; 7/10 false flags; 3/10 narrow code bugs (`intent_service.py` setup-wizard refs, slot-filling `#N`). **CIO promoted Patterns-063, -064, -065 Emerging → Proven** (the 062-family is now fully Proven). M2f opens but audit-cascade work BLOCKED on pre-M2f remediation per CEO directive.
- **Piper Morgan (website)**: No new commits.
- **OpenLaws (~16 commits)**: Sprint Day 11 closed strong. **Spike-decision Friday landed POSITIVE — "Continue the bet."** v0.2 SKILL shipped via PR #29 merged. Vendor-packaging research synthesis filed (3-subagent fan-out). Pre-PR audit checklist patterns #9–#12 added; `Checks` ruleset re-enabled active post-merge. Five strategic open questions queued for Monday retro (cross-client aggressiveness, Smithery vs Anthropic-first, curated-vs-open, OAuth timing, Verified Publisher badge).
- **Klatch**: Cross-pollination 5/9 brief receipt; no session activity.
- **designinproduct (3 commits)**: 5/9 sweep receipt substantive; 5/9 cross-pollination brief delivered (PreCompact hook, #1064 false regression, Patterns-063/064/065 Proven).
- **Dispatch (4 commits)**: 5/8 cross-pollination brief; 5/8 daily memo to DK; auto activity-log + stranded-changes commit.
- **Weather/Zephyr, Rebel**: No activity (xpoll receipt only on Weather; Rebel back-burner).

## Needs Your Attention

- **PM M2f baseline gate** — pre-M2f remediation (fixture reset + judge recalibration confer with CXO/PPM + 3 narrow bug fixes + clean retest) blocks M2f audit-cascade per CEO directive 5/8 17:22. No xian decision required yet, but heads-up: this is the upstream blocker if CXO/PPM coordination needs your nudge.
- **OpenLaws PR #30** (PO's plain-language register layer + fixes) pending Jerry's review **Monday**. No action today.

## Agent Status

- **Argus sweep — split regime nominal**:
  - External (auto): latest external sweep `2026-05-04-sweep.md` (5 days old, within 8-day window). Next CCR auto-trigger Mon 5/11.
  - Internal (curation): latest curated `2026-04-27-sweep-curated.md` (12 days, within 14-day flag).
  - designinproduct Janus sweep receipt 5/9 substantive — fresh.
- **Janus DinP §1 backlog** — bootstrap scaffolding, memory file refresh, daily memo composition. Resumable, no movement.
- **Iris (Klatch) UX walkthrough** — Surfaces 3–8 + Pass 2 still paused; 5/8 resume planned, did not happen.
- **DK side**: 5/8 and 5/9 morning DK→DinP daily memos both unposted at brief time. Per 4/23 DECISIONS.md: skip days OK with backfill on next session. Tracking only.
- **Calliope (Klatch) PO advice-on-working-with-xian reply** — outside original window; tracking only.

## Deadlines

- **Mon 5/11 (T+2)**: Argus next external CCR auto-trigger (7-day cadence); Claude 3.7 Sonnet retires on Vertex AI (no Klatch impact — aliases in place); OpenLaws PR #30 review with Jerry.
- **Sun Jun 7 (T+29)**: OpenLaws Bet 1 sprint window close.
- **Sun Jun 15 (T+37)**: Sonnet 4 / Opus 4 deprecation. Klatch DB audit query for pinned literal model IDs remains overdue.

## Usage Check

- **designinproduct.com (Max 20x)**: last entry Apr 17 — **22 days stale**. Apr 25 + Apr 28 + May 2 + May 5 snapshots in activity log waiting to be structured into `intelligence/usage-tracking.csv`.
- **kindsys.us (Max 5x)**: last entry Apr 17 — **22 days stale**. Same backlog.

## Today Carried Queue

- **Usage CSV reconciliation** — Janus §1; 22 days stale.
- **Janus DinP §1 backlog** — bootstrap, memory refresh, daily memo. Resumable.
- **PM SDK 6 versions behind** — `@anthropic-ai/sdk 0.92.0` vs. pinned `^0.86.1`. Queued for next dep-maintenance window.
- **PM roadmap.md 28 days stale** — last mtime Apr 11; Docs audit (#1049) flagged; PPM cadence proposal pending.
- **#983 CONTEXT-BLOCKED label-convention memo to Architect** — sent Tue 5/05; in arch inbox; awaiting Architect verdict.
- **Iris UX walkthrough Surfaces 3–8 + Pass 2** — paused; resume slipped from 5/8.
- **OpenLaws synonym-registry question to John** — PO draft at `workdesk/draft-question-to-john-synonym-registry-2026-05-04.md` unsent (carried 5 days). Light-touch sanity-check.
- **OpenLaws working-tree hygiene** — `experiments/openlaws-mcp-poc-py/` rename residue (9+ days untracked).
- **Calliope (Klatch) PO advice reply** — tracking only.

Dropped from yesterday's queue (verified resolved):

- **OpenLaws Bet 1 Friday spike-decision gate** — landed POSITIVE; PR #29 merged; v0.2 SKILL shipped. Per OpenLaws 5/8 EOD log.
- **OpenLaws SKILL v0.2 jurisdiction-generalization slip** — folded into spike-decision; closed.

## Cross-Project Intelligence

Weekly cross-pollination brief (`intelligence/cross-pollination-current-week.md`) is **5 days stale** (mtime May 4, covers Apr 27–May 3). Skipped per >2-day rule. Today's daily xpoll brief (`intelligence/cross-pollination/2026-05-09.md`) is fresh; three Klatch-relevant items:

1. **PreCompact hook portable to Klatch** — 3 git checks (uncommitted / unpushed / ahead-of-origin), warn-only, exit 0 always. The three-layer model (agent checklist → merge-keeper sweep → PreCompact hook) is complete in PM. Staged-rollout decision worth adopting: defer SessionEnd until PreCompact catch-rate is observed; adding two hooks simultaneously makes attribution hard.
2. **Eval-harness fixture-hygiene** — Q56 finding (DB mutations from one run polluting next without visible error) maps to any Klatch eval that writes to DB. Add per-run teardown or per-run isolated schema. Also: judge calibration should distinguish queries that need user-context-specificity from those that don't — a single dim=0 → FAIL on identity queries is a common false-positive shape.
3. **Pattern-064 "alive scaffolding" Proven** — directly Klatch-relevant; the 062/063/064 architectural-debt diagnostic (seams / vocabulary / extension) now fully Proven and ready as a portable triage tool.
