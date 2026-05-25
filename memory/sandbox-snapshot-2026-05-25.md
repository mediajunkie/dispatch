# Sandbox Snapshot — 2026-05-25

## Purpose
Re-inflate pointers for the week (May 18–25). If sandbox state is lost, host artifacts listed here are the authoritative source. This is the weekly checkpoint; daily-brief / memo paths handle the high-frequency record.

## Active Scheduled Tasks

- **dispatch-daily-brief** — 06:09 AM daily (`0 6 * * *`). Last run 2026-05-24 12:01 UTC. Outputs: `intelligence/daily-brief-YYYY-MM-DD.md` in dispatch repo. **Plan 2 Step 7 monitor failing**: 5/24 + 5/25 briefs both missing (last is 5/23). Cron survives session, content production does not.
- **dispatch-brief-reminder** — 06:21 AM daily (jittered to `20,50 6-8 * * *`). Last run 2026-05-24 12:52 UTC. Reads brief, DMs summary to xian.
- **connector-health-check** — 06:09 AM daily. Last run 2026-05-24 12:01 UTC. Probes Cowork connectors, reports re-auth needs.
- **dispatch-activity-log** — 06:41 AM daily. Last run 2026-05-24 12:01 UTC. Appends to `memory/dispatch-activity-log.md` via git clone/push.
- **dk-daily-memo** — 20:09 PT daily. Last run 2026-05-25 09:35 UTC (this session's predecessor). Outputs: `mail/memo-dispatch-dinp-to-dispatch-kind-daily-YYYY-MM-DD.md`.
- **dk-inbox-check** — 07:31 AM daily. Last run 2026-05-24 12:01 UTC. Scans `dispatch/mail/` for unanswered DK memos >24h.
- **sandbox-snapshot** — Sundays 20:06 PT (`0 20 * * 0`). Last run is **this run** (2026-05-25 09:35 UTC). Outputs: `memory/sandbox-snapshot-YYYY-MM-DD.md`.
- **brief-reliability-closeout** — one-time fire 2026-05-28 16:00 UTC. Checks whether 5/21–5/23 monitor cleared. With 5/24 + 5/25 misses, it will report failure.
- **cio-duty-cycle-pilot** — **disabled** (archived 2026-05-20).
- **pat-rotation-reminder** — **disabled**, fired once 2026-05-20.

## This Week's Work (by repo)

### dispatch
- 5/20 — **Plan 1 (practice upgrade) executed**: DECISIONS.md discipline, session-wrap verification (`git log origin/main --oneline -3` paste), one-off plan convention. PROTOCOLS.md updated with Session Wrap Verification section. `cio-duty-cycle-pilot` archived. `dispatch-daily-brief` migrated osascript → bash + cron.
- 5/20 — **Plan 2 (brief reliability) drafted** (`plans/brief-reliability-fix-2026-05-20.md`). Steps 3–6 executed by 5/21 (backfill 5/13–5/18 briefs + gap detection).
- 5/21 — First clean recurring-cron brief landed.
- 5/22 — Brief miss (xian off Princeton reunion, no autonomous run); monitor counter reset.
- 5/23 — Brief landed; monitor day 1 again.
- 5/24, 5/25 — Brief misses; monitor failing again.
- Cadence holding: DK ↔ DinP daily memos both directions through 5/23 (DK side quiet since 5/21 outbound).

### designinproduct
- 7/7 cross-pollination delivery sustained 5/21 → 5/24 (1 via MCP fallback each day).
- Briefs published this week: *Klatch paused, duty-cycle v0.1, Ship #043 fabrication failure mode* (5/21), *Voice of Denial, V1 retired, BYOC PoC, Slack search.messages corrected* (5/22), *Slack OAuth healthy, ROSTER filed, Project Biorhythms queued* (5/23), *KG privacy layer ships, CIO CHECK reframed, Comms arc complete* (5/24).

### piper-morgan-product
- 5/19 banner Monday: CIO V1 duty cycle cohort adoption rollout (HOST/Docs/Exec); Pattern-073 promoted Proven (11 instances / 9 surfaces); PDR-005 BYOC v0.4; methodology-30; PP-004 instance #2.
- 5/20 — V1 Duty Cycle formally retired.
- 5/21 — CIO Duty Cycle v0.1 committed; Day 50 PA mass triage (58 items).
- 5/22 — Light Friday (xian off), HOST v0.3 thread + PA outcomes lane ack.
- 5/23 — **KG privacy layer shipped** (`#1089` Phase 0 — 79 tests, 7 ACs, 1,530 LOC); CIO duty cycle **v0.2** design landed PROVISIONAL.
- 5/24 — CIO duty cycle **v0.3** reframe (CHECK is a dispatcher, not a mail-check; IDLE formally defined); Comms 9-essay arc complete; mail/log triage activity throughout.

### piper-morgan-website
- CLI B walking-skeleton (`publish-cli.js` + engine queue) + enrichment pass + conversion-rule corpus harness (15 entries).
- Blog posts shipped: *The Log That Fact-Checked Itself*, *Ship #043 — The Skill That Doesn't Fire*, *The Voice of a Denial*, *Project Biorhythms*, *Five Whys for Design Decisions*.
- `publish-post.js` gaps closed: Gap 2 (block-level HTML), Gap 3 (empty-frontmatter), Gap 4 (linked-image markdown).

### OpenLaws
- 5/22 — Path D preliminary filed (Python→Node MCP port baseline for Jerry's Tue 5/27 spike); PR #46 customizer-collision-guard signal acked.
- 5/23 — `briefs:` cross-pollination receipts only.
- PR #40 (Phase A bundle) still pending Jerry + Copilot review; xian is integration arbiter (open since 5/19).

### klatch
- **PAUSED 2026-05-20.** Repo returning 404 to PAT-authed clone since 5/18 (also Rebel + Weather new this run). Daedalus relay removed from PM Architect's forward queue. Formal hold, not stop-work.

## Memos Filed This Week

### DinP → DK (daily + signals)
- `mail/memo-dispatch-dinp-to-dispatch-kind-daily-2026-05-18.md` — 5/18 daily
- `mail/memo-dispatch-dinp-to-dispatch-kind-daily-2026-05-19.md` — 5/19 daily
- `mail/memo-dispatch-dinp-to-dispatch-kind-daily-2026-05-20.md` — 5/20 daily
- `mail/memo-dispatch-dinp-to-dispatch-kind-daily-2026-05-22.md` — 5/22 daily
- `mail/memo-dispatch-dinp-to-dispatch-kind-daily-2026-05-23.md` — 5/23 daily
- `mail/memo-dispatch-dinp-to-dispatch-kind-daily-2026-05-25.md` — 5/25 daily (flags brief reliability re-failure + merge-keeper sweep deadline)
- `mail/memo-dispatch-dinp-to-dispatch-kind-daily-briefing-recipe-2026-05-19.md` — recipe packaging of daily-brief SKILL.md for DK adaptation
- `mail/memo-dispatch-dinp-to-dispatch-kind-openlaws-logs-2026-05-18.md`
- `mail/memo-dispatch-dinp-to-dispatch-kind-uncommitted-logs-2026-05-18.md`
- 6x `signal-...inbox-check-clean` (5/18–5/23)

### DK → DinP
- `mail/memo-dispatch-kind-to-dispatch-dinp-daily-2026-05-18.md`, `-05-19.md`, `-05-20.md`, `-05-21.md` (silence since)
- `mail/memo-dispatch-kind-to-dispatch-dinp-ack-openlaws-logs-2026-05-19.md`
- `mail/signal-dispatch-kind-to-dispatch-dinp-2026-05-19-stale-clone-observation.md`

### DinP → Vergil
- `mail/memo-dispatch-dinp-to-vergil-ablation-branch-2026-05-18.md`

## Plans Filed / Active
- `plans/brief-reliability-fix-2026-05-20.md` — Step 7 monitor **failing again** (5/24 + 5/25 misses). Diagnostic owed to xian.
- `plans/dispatch-practice-upgrade-2026-05-20.md` — executed (Plan 1). Practices live.

## Cross-Pollination Briefs
- `intelligence/cross-pollination/2026-05-18.md` through `2026-05-24.md` — daily, 7-recipient delivery, 1 MCP fallback per day holding.
- `intelligence/cross-pollination-current-week.md` — rolling alias.

## Daily Briefs
- `intelligence/daily-brief-2026-05-20.md`, `-05-21.md`, `-05-23.md` filed.
- **Gaps**: 5/22 (xian off), 5/24, 5/25 (Plan 2 monitor regression).

## Ongoing Threads

- **Brief reliability monitor** — second consecutive failure. 5/22 first miss, 5/23 clean restart, 5/24 + 5/25 both missed. HOST's `CronCreate durable=true` is session-only finding (5/21 `40daac934`) is the leading hypothesis. Files: `plans/brief-reliability-fix-2026-05-20.md`, `intelligence/daily-brief-2026-05-23.md`, today's DK memo.

- **CIO Duty Cycle design evolution** — v0.1 committed 5/21, v0.2 page 6/7 PROVISIONAL 5/23, v0.3 CHECK-vs-WORK reframe 5/24 (CHECK is dispatcher; IDLE formally defined). Files: `piper-morgan-product/docs/operations/duty-cycle design/duty-cycle-design-v0.3.md`; cross-pollination 5/24.

- **Knowledge Graph privacy layer** — PM's largest single-session delivery this week (5/23). Pattern transferable to Klatch (Daedalus) + designinproduct (Janus). Three-layer enforcement: service gate → repository safety net → audit log. Files: `cross-pollination/2026-05-24.md` §1.

- **Merge-keeper-sweep v0.2 `SWEEP_SKIP_WORKTREE` env-guard** — **today is sweep day (Mon 5/25)**, blocker now 11 days open. Without the guard, scheduled run repeats 5/14 self-worktree-removal. DK has applied inline-only one-off twice. Files: `xian-attention-queue.md`, today's DK memo.

- **OpenLaws PR #40 Phase A bundle** — pending Jerry + Copilot review since 5/19; xian arbiter. Likely first movement today now that xian is back from Princeton.

- **UV fork decision (Path B bundle UV vs Path D Node port)** — Bet 1 architectural call. Jerry's spike Tue 5/27 (T+2). OpenLaws 5/22 committed Path D preliminary baseline.

- **Slack OAuth five-bug chain → "Slack: Healthy"** — resolved 5/22. Two transferable findings filed (OAuth state must be process-global; health checks must read same source as writer). Pattern-073 instance.

- **ROSTER.md as org-shape document** — PM Docs filed first formal org-shape view 5/23. Threshold heuristic: ~8 rows in CLAUDE.md role table. Worth banking for Klatch and DinP.

## What's NOT Captured Here

- Anything that lived only in this run's session state (the clone/parse work, the diagnostic noise on shallow clones, the `nobody:nogroup` ownership snag on `/tmp/dispatch` after the parallel-clone race).
- Live CIO duty-cycle v0.3 page-7 walkthrough — PM-side artifact, not reflected to dispatch yet.
- Anything filed after 09:35 UTC on 2026-05-25 (this snapshot's clone point).

---

*Filed by sandbox-snapshot scheduled task. Co-authored by Claude Opus 4.6.*
