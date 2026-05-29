# Sandbox Snapshot — 2026-05-29

## Purpose
Re-inflate pointers for the week (May 25–29). If sandbox state is lost, the host artifacts listed here are the authoritative source. This is the weekly checkpoint; daily-brief / memo paths handle the high-frequency record.

*(Off-Sunday run — fired 2026-05-29 00:14 UTC rather than the scheduled Sun 20:06 PT slot. Next scheduled run: 2026-06-01.)*

## Active Scheduled Tasks
- **dispatch-daily-brief** — 06:09 AM daily (`0 6 * * *`). Last run 2026-05-29 00:10 UTC. Outputs: `intelligence/daily-brief-YYYY-MM-DD.md`. Recurring-cron path producing again (5/25, 5/27, 5/28 clean; 5/26 weekday miss).
- **dispatch-brief-reminder** — 06:21 AM daily (jittered `20,50 6-8 * * *`). Last run 2026-05-29 00:10 UTC. Reads brief, DMs summary to xian.
- **connector-health-check** — 06:09 AM daily. Last run 2026-05-29 00:10 UTC. Probes Cowork connectors, reports re-auth needs.
- **dispatch-activity-log** — 06:41 AM daily. Last run 2026-05-29 00:11 UTC. Appends to activity log via git clone/push.
- **dk-daily-memo** — 20:09 PT daily. Last run 2026-05-29 00:14 UTC. Outputs: `mail/memo-dispatch-dinp-to-dispatch-kind-daily-YYYY-MM-DD.md`.
- **dk-inbox-check** — 07:31 AM daily. Last run 2026-05-28 11:30 UTC. Scans `mail/` for unanswered DK memos >24h.
- **sandbox-snapshot** — Sundays 20:06 PT (`0 20 * * 0`). This run. Outputs: `memory/sandbox-snapshot-YYYY-MM-DD.md`.
- **brief-reliability-closeout** — **disabled**; one-time fired 2026-05-28 16:00 UTC (closeout window included the 5/26 miss).
- **cio-duty-cycle-pilot** — **disabled** (archived 2026-05-20).
- **pat-rotation-reminder** — **disabled**, fired once 2026-05-20. PAT still hardcoded in task SKILL.md files (rotation still owed).

## This Week's Work (by repo)

### dispatch
- DK ↔ DinP daily memo cadence holding both directions through 5/27 (DK outbound 5/26, 5/27).
- Inbox-check 5/28 clean — DK 5/27 EOD acked (<24h, no asks); **Pattern-073 closed**.
- Cross-pollination brief 5/28: nine-role cohort rollout.
- DK duty-cycle exploration doc filed (`ef00b90`).

### designinproduct
- 7/7 cross-pollination delivery sustained 5/26 → 5/28 (1–2 via MCP fallback each day).
- Brief themes: v0.6.3 idle-to-output, GitHub Actions decay, day-boundary confirmed (5/28); overnight continuity, "Two Migrations" published, publish-post.js hashId bug (5/27).
- Daily sweep receipts substantive 5/26–5/28.

### piper-morgan-product
- Autonomous CIO/Exec/Arch duty cycle running multi-fire days; Exec Fire 9 clean IDLE + logging-convention shift (batch quiet fires to cut main-churn).
- Docs triage-routing resolved: #972 (no-flattened-referents / read-whole-artifact-first), #973→Lead, #941/PR→Comms; 16-item CIO inbox drain.
- Arch #1016 verification complete; boundary-map v0.2; close-ready. personality_bridge F-anomaly reclassified (pure transform, not boundary).

### piper-morgan-website
- Blog posts published: "Two Migrations in One Day," "Weekly Ship #044: What Survives an Experiment," "The Misfiled Voice Guide," "Five Whys for Design Decisions."
- publish-post.js edit-pass mirror bug worked around (corrected content moved into live hashId 91d148229561; orphan dropped).
- About-page bio fix (removed hallucinated employers); footer typo fix.

### piper-morgan-product / OpenLaws (Bet 1)
- Week-5 autonomous loop running; first overnight 6 AM START test flagged for tonight (needs laptop awake).
- MCP-enrichment three-layer rewrite shipped to Slack (5/27); optional post-hoc accuracy pass on `server.py` line refs owed to Vergil.
- Synthetic-SME harness plan drafted (PO starter for xian review + Vergil pickup) per Week-5 directive.

## Memos Filed This Week
DinP → DK: daily memos `...daily-2026-05-25/26/27.md`; inbox-check-clean signals `...2026-05-25/27/28...`.
DK → DinP: daily memos `...daily-2026-05-26/27.md`.

## Ongoing Threads
- **Brief reliability** — recurring-cron path produces again; weekday miss count is 1 (5/26), not 3. Fix-not-monitor diagnostic still owed; faoilean durability fix is leading-but-not-only hypothesis. Files: `plans/brief-reliability-fix-2026-05-20.md`, `intelligence/daily-brief-2026-05-28.md`.
- **Pattern-073 (Asserted-Behavior/Content Drift)** — closed this week after stale-clone echo (DK 5/26, DinP 5/27); companion `git fetch && git diff origin/main` step-0 check accepted both sides. Files: 5/27–5/28 briefs.
- **OpenLaws Bet 1 Week 5** — autonomous loop overnight test, product-name decision (Research Workpaper/Trail/Verifiable Legal Research), PR #40 Phase A bundle review (9d open), Vergil-branch triage (14d). Files: `OpenLaws docs/working/bet-1-week-5.html`, `plans/`.
- **UV/Node + hosted-MCP w/ Jerry** — clean A/B still standing; Jerry moved May 31→June 15, off Fri Jun 5; window narrowing. Files: 5/28 brief "Needs Your Attention."
- **Klatch repo unreachable** — 10+ days; org listing shows neither klatch nor weather repo (likely rename/visibility change, not PAT scope). Clone still fails this run. Files: 5/28 brief.

## What's NOT Captured Here
- Anything living only in Cowork session state not reflected to a host file.
- **klatch repo** — not cloneable (`Repository not found`); excluded from this week's repo scan.
- PAT still hardcoded across scheduled-task SKILL.md files; rotation reminder fired 5/20 but rotation not confirmed done.
- Usage CSV stale since 2026-05-05 (last `intelligence/usage-tracking.csv` entry); kindsys balance $6.35 under $10 watch.
