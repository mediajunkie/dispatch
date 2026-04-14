# Sandbox Snapshot — 2026-04-14

## Purpose
Re-inflate pointers for the week. If sandbox state is lost, host artifacts listed here are the authoritative source.

## Active Scheduled Tasks
- **dispatch-daily-brief** — morning project briefing. Last run: 2026-04-14 ~08:42 AM PT. Outputs: `~/cool/dispatch/intelligence/daily-brief-YYYY-MM-DD.md`
- **dispatch-brief-reminder** — Slack headline summary from the daily brief. Last run: 2026-04-14 ~09:52 AM PT. Outputs: Slack DM (no host file).
- **connector-health-check** — probes all Cowork connectors for auth health. Last run: 2026-04-14 ~08:42 AM PT. Outputs: Slack DM (no host file).
- **dispatch-activity-log** — appends daily activity summary after brief runs. Last run: 2026-04-14 ~08:43 AM PT. Outputs: `~/cool/dispatch/memory/dispatch-activity-log.md`
- **sandbox-snapshot** — this task, weekly. Last run: 2026-04-14 ~10:38 AM PT. Outputs: `~/cool/dispatch/memory/sandbox-snapshot-YYYY-MM-DD.md`

## This Week's Work (by repo)

### dispatch
- CLAUDE.md added — behavioral contract for the Dispatch switchboard; high-value file for future session bootstrap.
- Project roadmap created (`memory/dispatch-project-roadmap.md`) and source-of-truth v0 design sketch filed (`plans/source-of-truth-v0.md`).
- Daily briefs running cleanly Apr 8–14; cross-pollination digest for Apr 7–13 filed; sneakernet xpoll delivery tested Apr 11 (OpenLaws as source, passed).
- Usage snapshots filed Apr 12: DinP upgraded to Max 20x, kindsys idle, mediajunkie dormant.
- Registry UI doc updated Apr 13: OpenLaws, Rebel, Weather, Iris added; trigger migration complete.

### klatch
- **Phase 3.5 behavioral calibration — fully shipped.** All five design questions answered; Argus, Daedalus, and Iris each submitted positions; consensus document ratified. Three mechanisms: 3.5a (self-authored handoff brief), 3.5b (external behavioral extraction at export), 3.5c (micro-reflections at session boundaries).
- Layer 5 transfer mechanism designed and built in ~12 hours on Apr 13. Argus reached 910 passing tests; session wraps filed.
- **Hot issue:** Haiku 3 MODEL_ALIASES bug found in Apr 13 sweep — 7-day deadline (~Apr 20). Alias key typos causing wrong model IDs. Validation tests added.

### designinproduct
- New agent UI page shipped: light theme, mobile responsive, 10 agents listed.
- Daily sweeps running normally Apr 8–14; triggers investigation complete; cross-poll briefs filed each day.
- Project tracker + Ted email draft noted in commits (Apr 14).

### piper-morgan/piper-morgan-product
- M1 CLOSED. Vision V2.3 defined. M2 greenlit.
- STATUS/PRIORITY migrated to floor-first routing (#925); temporal routing migrated (#965); canonical retest run 3 post-migration complete. 910 tests.
- Memory architecture: 5 issues filed (#972–976) from Janus research synthesis. Docs responded with hybrid recommendation.
- Inversion sweep (#962): 8 components audited, 3 inversions found. LLM consolidation phases 2–3 architecture memo filed.

### piper-morgan/piper-morgan-website
- 6 blog posts published: "Archaeological Debugging", "The No-Anchoring Roundtable", "Nine Voices (act 5)", "Fixing the Foundation", and others. Ship #037 live.

### rebel
- No git repo initialized — activity not tracked via commits. Agent welcomed (memo filed Apr 9).

### weather
- Custom domain `weather.dinp.xyz` deployed. Mobile dashboard added. Daily GitHub Pages deploy pipeline operational. IEM gap-fill added for near-real-time precipitation data. Email failure made non-blocking.

### OpenLaws
- Eval harness v1.1 built by Vergil (50 queries, runner, initial baseline). Dual-ranking tool shipped. Pincite chunking validated; Path C (BM25) confirmed. PO Week 0 close-out filed. Session handoff memos in place.

## Memos Filed This Week

**Janus → outbound:**
- `mail/memo-janus-memory-research-synthesis-2026-04-12.md` — full synthesis of memory prior art research
- `mail/signal-janus-to-dispatch-labrador-research-2026-04-11.md` — Labrador research flagged to Dispatch
- `mail/signal-janus-to-pa-temporal-validity-approved-2026-04-13.md` — PA temporal routing cleared
- `mail/signal-janus-to-dispatch-new-agent-welcomes-2026-04-10.md` — Rebel + Zephyr welcome delivery confirmed
- `mail/signal-janus-to-piper-open-briefing-2026-04-09.md` — xpoll integration briefing to Piper Open
- `mail/memo-janus-to-dispatch-argus-sweep-split-2026-04-10.md` — Argus sweep automation operational
- `mail/memo-janus-to-rebel-alliance-agent-welcome-2026-04-09.md` — formal Rebel Alliance agent welcome

**Docs → Janus:**
- `mail/memo-docs-to-janus-memory-prior-art-2026-04-12.md` — detailed prior art response, hybrid recommendation
- `mail/memo-docs-to-janus-memory-followup-2026-04-12.md` — follow-up routing memo

**PA → Dispatch:**
- `mail/memo-pa-to-dispatch-haiku3-response-2026-04-09.md`
- `mail/memo-pa-to-dispatch-comms-protocol-2026-04-09.md`
- `mail/memo-pa-to-dispatch-for-piper-open-session-log-discipline-2026-04-09.md`

**Zephyr → Janus:**
- `mail/signal-zephyr-to-janus-2026-04-10-welcome-ack.md` — welcome acknowledgment from Zephyr

**DinP ↔ Kind:**
- `mail/signal-dispatch-dinp-to-dispatch-kind-2026-04-08-catch-up-reply.md`
- `mail/signal-dispatch-dinp-to-dispatch-kind-2026-04-07-morning-routine.md`

## Plans & Intelligence Filed This Week
- `plans/source-of-truth-v0.md` — v0 design sketch for decisions/status ledger (new this week)
- `intelligence/daily-brief-2026-04-08` through `2026-04-14` — 7 briefs
- `intelligence/cross-pollination/2026-04-14.md`, `2026-04-11-rev2.md`, `current.md` — xpoll digests

## Ongoing Threads

- **Klatch Phase 3.5 behavioral calibration** — COMPLETE. Consensus ratified, all three mechanisms shipped. Next: monitor Haiku 3 alias bug fix by ~Apr 20. Key files: klatch session wraps Apr 13, Phase 3.5 design docs, Argus/Daedalus/Iris position files.

- **Memory architecture (Janus → Piper Morgan)** — Research synthesized, Docs responded with hybrid recommendation, 5 issues filed. Thread may be in implementation phase. Key files: `mail/memo-janus-memory-research-synthesis-2026-04-12.md`, `mail/memo-docs-to-janus-memory-prior-art-2026-04-12.md`, piper-morgan-product #972–976.

- **OpenLaws eval harness / Vergil** — Eval harness v1.1 built and running. Path C validated. PO Week 0 closed. Thread is mid-evaluation-cycle. Key files: OpenLaws `vergil/` eval harness, `docs/` session logs and PO session logs.

- **Piper Morgan M2 / floor routing** — M1 closed, M2 greenlit, floor-first routing migrated. Active development sprint. Key files: piper-morgan-product session omnibus logs, canonical retest run 3 results.

- **Source-of-truth ledger** — Early-stage design only. v0 sketch filed. No implementation yet. Key file: `dispatch/plans/source-of-truth-v0.md`.

- **DINP agent UI** — Agent page shipped. Monitors: light theme + mobile. Key file: designinproduct repo latest commit.

- **DinP/weather.dinp.xyz** — Deployed and operational with daily pipeline. Low-maintenance state. Key files: weather repo deploy pipeline.

## What's NOT Captured Here
- Rebel repo has no git — any activity there is invisible unless memo'd to dispatch/mail.
- Connector health check and brief reminder outputs live only in Slack (no host file).
- Any mid-session reasoning in active Cowork conversations not yet reflected to a commit or memo.
- Ted email draft (noted in designinproduct Apr 14 commit) — not yet sent or filed as a memo.
