# Sandbox Snapshot — 2026-04-15

## Purpose
Re-inflate pointers for the week. If sandbox state is lost, host artifacts listed here are the authoritative source.
Note: a snapshot was also filed 2026-04-14 (yesterday). This run captures one additional day of incremental activity — notable enough to file given several significant launches.

## Active Scheduled Tasks
- **dispatch-daily-brief** — morning project briefing. Last run: 2026-04-15 ~06:09 AM PT. Outputs: `~/cool/dispatch/intelligence/daily-brief-YYYY-MM-DD.md`
- **dispatch-brief-reminder** — Slack headline summary from daily brief. Last run: 2026-04-14. Outputs: Slack DM (no host file).
- **connector-health-check** — probes all Cowork connectors for auth health. Last run: 2026-04-15 ~06:09 AM PT. Outputs: Slack DM (no host file).
- **dispatch-activity-log** — appends daily activity summary after brief. Last run: 2026-04-14. Outputs: `~/cool/dispatch/memory/dispatch-activity-log.md`
- **sandbox-snapshot** — this task, weekly (Sunday). Last run: 2026-04-14. Outputs: `~/cool/dispatch/memory/sandbox-snapshot-YYYY-MM-DD.md`

## This Week's Work (by repo)

### dispatch
- Agent Q&A channel launched (Phase 1) — new `intelligence/agent-qa-log.md` artifact; this is a live log of cross-project Q&A traffic.
- Daily briefs running cleanly Apr 8–15 (8 consecutive). Usage snapshot Apr 14: DinP on Max 20x, kindsys idle, mediajunkie dormant.
- CLAUDE.md behavioral contract and project roadmap remain the key bootstrap artifacts for future sessions.

### klatch
- **Phase 3.5d shipped Apr 14**: export review UI with field note cross-validation. Core insight: "entities are conversations promoted into roles." 32 new tests (Round 22).
- **Phase 4 approved by Daedalus** (session wrap Apr 14) — next major development phase greenlit.
- Iris session 5 delivered Phase 3.5d spec + five UX topics to Daedalus. Blog skeleton started (Phase 3.5 writeup, awaiting results).
- AAXT probe: `known_pathological` classification added to fabrication probes.

### designinproduct
- April 14 log closed: seven items completed, Q&A channel launch noted.
- Agent UI page (10 agents, light theme, mobile-responsive) live.
- Sweeps running daily; project tracker + Ted email draft still noted as pending.

### piper-morgan/piper-morgan-product
- **CI integration shipped (#930)**: GitHub Actions now runs E2E + canonical + AAXT on every push — major infra milestone.
- AAXT golden scenarios (#929, 5 multi-turn tests) + automated canonical suite (#928, two-tier pytest) both landed.
- M2 super-epic structure document filed; M2a gate checkpoint noted.
- Managed Agents assessment complete: two distribution paths identified, Memory Stores API flagged as linchpin. Access application in progress (PA day 15).
- **#979 filed**: Haiku 3 retirement issue formally tracked in piper-morgan-product (parallels Klatch alias bug deadline ~Apr 20).
- Context contract fixes (#960/#961): UNKNOWN enrichment + violation logging.
- Editorial calendar: 243 blogURL/blogPath backfilled + 33 more entries + upcoming narrative drafts added.

### piper-morgan/piper-morgan-website
- "The Closing Sprint" blog post published (Apr 14). RSS dedup fix for Archaeological Debugging. Medium RSS fetch suspended from prebuild.

### rebel
- No git repo — activity invisible. Last memo: welcome filed Apr 9.

### weather
- Stable. Custom domain `weather.dinp.xyz` operational, daily deploy pipeline running.

### OpenLaws
- Tuesday work block (Apr 15): domain briefing, principles seed, cross-pollination synthesis, eval harness roadmap filed.
- Eval harness v1.1 active; Vergil in mid-evaluation cycle; Path C (BM25 + pincite chunking) validated.

## Memos Filed This Week (Apr 8–15)

**New since Apr 14 snapshot:**
- `mail/memo-pa-to-dispatch-memory-stores-access-2026-04-14.md` — PA reports Memory Stores API documented, access application in progress

**Previously filed (carried from Apr 14 snapshot):**
- `mail/memo-janus-memory-research-synthesis-2026-04-12.md` — Janus full memory prior art synthesis
- `mail/memo-docs-to-janus-memory-prior-art-2026-04-12.md` — Docs hybrid recommendation response
- `mail/memo-docs-to-janus-memory-followup-2026-04-12.md` — follow-up routing
- `mail/signal-janus-to-pa-temporal-validity-approved-2026-04-13.md` — PA temporal routing cleared
- `mail/signal-janus-to-dispatch-labrador-research-2026-04-11.md` — Labrador research awareness
- `mail/memo-janus-to-dispatch-argus-sweep-split-2026-04-10.md` — Argus sweep automation operational
- `mail/signal-zephyr-to-janus-2026-04-10-welcome-ack.md` — Zephyr welcome ack
- `mail/signal-janus-to-dispatch-new-agent-welcomes-2026-04-10.md` — Rebel + Zephyr welcomes confirmed

## Plans & Intelligence Filed This Week
- `intelligence/agent-qa-log.md` — NEW: live log for Agent Q&A channel (launched Apr 14)
- `intelligence/daily-brief-2026-04-15.md` (+ Apr 8–14, 8 total)
- `intelligence/cross-pollination/2026-04-14.md`, `current.md`
- `plans/source-of-truth-v0.md` — v0 design sketch (no implementation yet)

## Ongoing Threads

- **Klatch Phase 3.5 → Phase 4** — Phase 3.5 complete (3.5a/b/c/d all shipped); Phase 4 approved. Active. Key files: klatch logbooks Apr 13–14, Phase 3.5d export review UI, Iris session 5 wrap.

- **Memory architecture (Janus → Piper Morgan)** — Research complete, Docs responded, 5 issues filed (#972–976), PA pursuing Memory Stores API access. Key files: `mail/memo-janus-memory-research-synthesis-2026-04-12.md`, `mail/memo-pa-to-dispatch-memory-stores-access-2026-04-14.md`, piper-morgan-product #972–976.

- **Haiku 3 retirement** — Issue #979 filed in piper-morgan-product; Klatch MODEL_ALIASES alias bug has ~Apr 20 deadline. Two-repo concern. Key files: klatch sweep Apr 13, piper-morgan-product #979.

- **Piper Morgan M2 / CI** — M1 closed, M2 greenlit, CI pipeline now live (GitHub Actions). Active sprint. Key files: piper-morgan-product session omnibus logs, #928/#929/#930.

- **OpenLaws eval / Vergin** — Domain briefing + principles seed filed Apr 15. Eval harness v1.1 mid-cycle. Key files: OpenLaws `vergil/` eval harness, PO session logs.

- **Agent Q&A channel** — Phase 1 launched Apr 14. Log at `dispatch/intelligence/agent-qa-log.md`. Early days; watch for traffic patterns.

- **Source-of-truth ledger** — Design sketch only (`dispatch/plans/source-of-truth-v0.md`). No implementation yet.

## What's NOT Captured Here
- Rebel repo has no git — activity invisible unless memo'd.
- Connector health check + brief reminder outputs are Slack-only (no host file).
- Ted email draft (noted in designinproduct Apr 14 commit) — still not filed or sent.
- Any mid-session Cowork reasoning not yet reflected to a commit.
