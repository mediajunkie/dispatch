# Sandbox Snapshot — 2026-04-26

## Purpose
Re-inflate pointers for the week (Apr 20–26). If sandbox state is lost, host artifacts listed here are the authoritative source. Previous snapshot: `memory/sandbox-snapshot-2026-04-21.md`.

## Active Scheduled Tasks
- **dispatch-daily-brief** — Morning briefing across projects. Last run: 2026-04-26 06:09 PT. Outputs: `~/cool/dispatch/intelligence/daily-brief-YYYY-MM-DD.md`.
- **dispatch-brief-reminder** — Slack summary of the daily brief. Last run: 2026-04-26 10:52 PT. Outputs: Slack DM, no host artifact.
- **connector-health-check** — Probes Cowork connectors. Last run: 2026-04-26 06:09 PT. Outputs: ephemeral Slack DM (no host file).
- **dispatch-activity-log** — Appends daily summary. Last run: 2026-04-26 06:41 PT. Outputs: `~/cool/dispatch/memory/dispatch-activity-log.md`.
- **sandbox-snapshot** — This memo. Schedule: Sun 20:06. Last run: now (2026-04-26). Outputs: `~/cool/dispatch/memory/sandbox-snapshot-YYYY-MM-DD.md`.

## This Week's Work (by repo)

### dispatch
- Dispatch-Kind successor bootstrapped on rebuilt Kindbook (Apr 22). Daily memo cadence DK↔DinP formalized in `DECISIONS.md` along with hygiene rule + project autonomy decisions.
- Cross-pollination briefs Apr 22–26 all shipped substantive. Apr 26 brief: "Chat→Code wave completes."
- Mail traffic dominated by DK↔DinP daily exchanges + bundle relays (PO advice, OpenLaws xpoll questions, DRAGONS response, consolidated PO replies).

### klatch
- Phase 5c-i shipped: MCP write-path (reflect) + `kit_briefing` prompt + URL-decode fix.
- Step 10 close-out: helper + ingress consistency + assembly refactor + retrospective + MCP setup doc.
- Daedalus Argus Round 27b sign-off — MCP feature-complete for 1.0. Daedalus stood down on xian's direction pending test-driven findings.
- Argus 4/26: Pattern-062, PM #995 outreach, intel sweep #8.

### designinproduct
- Apr 26 cross-pollination brief substantive (3 sources: klatch, piper-morgan, nyt-crossword). 7/7 delivery receipts Apr 24, 25, 26.
- DinP backlog restructured into xian's five role-anchored categories — `docs/backlog.md` is now the goals register (6 open / 4 watch / 2 parked).
- OpenLaws xpoll question bundle relayed to Janus for routing.
- NYT Crossword Relay added to gallery + xpoll sources.
- DRAGONS reply on PO advice routed back through chain.

### piper-morgan/piper-morgan-product
- **#992 ETHICS-ACTIVATE Phase E** ran live, signed off, merged to main. New finding: "floor-bypass-by-routing" (harassment input routed to `list_prs_query` upstream of ethics floor) — PM-level call pending.
- **Five-role Chat→Code migration wave complete** (HOST, CIO, Comms, CXO, PPM). Migration handoff packages shipped Apr 24–25.
- **#1004 contract v1.0 stable** — Architect refinements applied; confidence-only locked + 3 refinements.
- **Workstream-040 Ship #040 draft** — "The Methodology Audits Itself" + date-bleed pass. Inbox triage across all roles for #1004 + ship-040 feedback.
- #997 dead-flag cleanup (`FeatureFlags.should_use_mock_services`).

### piper-morgan/piper-morgan-website
- Blog posts published this week: "The Gate" (Apr 22), "Four Roles, Ninety Minutes" (Apr 22), "Weekly Ship #039 - The Voice Takes Shape", "The Multi-Wave Investigation" (Apr 25), "Verify the Paraphrase" (Apr 26 insight).
- Schema fix for Four Roles content (bare string → dict).

### rebel
- No commits. Still not a git repo at top level — back burner since Apr 9.

### weather
- Cross-pollination briefs Apr 22–25 shipped. Janus added Weather as xpoll scan source.

### OpenLaws
- **Bet 1 pitch sealed v1.0** with breadboards (3 low-fi rendered images), Vergil TX WC verification, anti-hallucination scan, MVP plan + timeline + operationalization. Sprint kicks off **Monday Apr 27** for six weeks (through Jun 7).
- xian-collaboration-patterns synthesis (source memo for "advice on working with xian" distribution).
- Two-week Vergil-Claude pairing experiment captured.
- Apr 26: Bill citation-batch help opportunity surfaced + Vergil signal.

## Memos Filed This Week (`~/cool/dispatch/mail/`)
DinP → DK:
- `memo-dispatch-dinp-to-dispatch-kind-bootstrap-2026-04-22.md` — bootstrap memo for new DK on rebuilt Kindbook
- `memo-dispatch-dinp-to-dispatch-kind-welcome-2026-04-23.md` — welcome
- `memo-dispatch-dinp-to-dispatch-kind-reply-2026-04-23.md` — reply on bootstrap-ack: brief process, anti-zombie, DECISIONS.md role, hygiene
- `memo-dispatch-dinp-to-dispatch-kind-corrections-2026-04-23.md` — xpoll path fix, DECISIONS.md autonomy, daily memo format confirmed
- `memo-dispatch-dinp-to-dispatch-kind-welcome-reply-2026-04-25.md` — 4 asks closed
- `memo-dispatch-dinp-to-dispatch-kind-dragons-response-relay-2026-04-25.md` — DRAGONS Product reply for PO chain
- `memo-dispatch-dinp-to-dispatch-kind-daily-2026-04-25.md` — Apr 25 daily memo (filed Apr 26, miss owned)
- `memo-dispatch-dinp-to-dispatch-kind-consolidated-replies-2026-04-26.md` — 4 respondents replied to PO advice + Bet 1 bundle, route before Monday sprint

DK → DinP:
- `memo-dispatch-kind-to-dispatch-dinp-bootstrap-ack-2026-04-23.md`
- `memo-dispatch-kind-to-dispatch-dinp-welcome-reply-and-cadence-2026-04-23.md`
- `memo-dispatch-kind-to-dispatch-dinp-cross-pollination-questions-bundle-2026-04-23.md` — OpenLaws bundle
- `memo-dispatch-kind-to-dispatch-dinp-daily-2026-04-24.md`
- `memo-dispatch-kind-to-dispatch-dinp-janus-relay-2026-04-24.md` — PO Janus memo on working with xian

## Plans / Intelligence Filed This Week
- No new files in `~/cool/dispatch/plans/` this week (`source-of-truth-v0.md` Apr 11 still latest).
- `~/cool/dispatch/intelligence/`: daily briefs Apr 22–26 + cross-pollination dailies Apr 22–26 + `cross-pollination/current.md` (Apr 26 mirror).
- Usage tracking CSV last appended Apr 17 — usage snapshot for Apr 25 captured in activity log but **not yet pushed to `usage-tracking.csv`**.

## Ongoing Threads

- **OpenLaws Bet 1 six-week sprint** — Pitch v1.0 sealed; sprint kickoff T-1 (Mon Apr 27). Key files: `~/cool/OpenLaws/` (pitch + breadboards + Vergil verification + xian edit passes), `~/cool/dispatch/mail/memo-dispatch-dinp-to-dispatch-kind-consolidated-replies-2026-04-26.md`.
- **Dispatch-Kind successor onboarding** — DK rebuilt Apr 22, fully operational by Apr 25 with DECISIONS.md cadence. Key files: `~/cool/dispatch/DECISIONS.md`, the bootstrap/welcome memo chain above.
- **Five-role Chat→Code migration wave** — Now complete across HOST, CIO, Comms, CXO, PPM. Key files: `~/cool/piper-morgan/piper-morgan-product/` migration packages + `intelligence/cross-pollination/2026-04-26.md`.
- **#992 floor-bypass-by-routing finding** — Phase E shipped Apr 25 but new bypass class identified upstream of ethics floor. Cross-import candidate for Klatch Phase 5c write-path design. Key file: `intelligence/cross-pollination/2026-04-25.md` (DinP-side coverage); PM-level call still pending.
- **PO advice-on-working-with-xian** — Distributed via Janus to DRAGONS, Calliope (Klatch), CoS+PA (PM), Janus. DRAGONS replied Apr 25; others within 5–7 day window. Consolidated relay went out Apr 26 ahead of Monday sprint. Tracking only.
- **DinP backlog role-anchored restructure** — `~/cool/designinproduct/docs/backlog.md` now goals register (6 open / 4 watch / 2 parked). Resumable from Apr 25 11:35 pause.
- **Cross-pollination 9-repo expansion** — Option 1 dedicated delivery CCR trigger built (13:00 UTC). Now stable cadence: substantive briefs + 7/7 delivery receipts daily.
- **Argus internal curation 14-day flag** — Last internal curation Apr 13. Hits 14-day flag Apr 27 if no session today/tomorrow.
- **Usage caps** — Both extra-usage caps reset May 1 (T-5). dinp at 100% of $200; kindsys 101% over at $151.85, balance thin at $14.46 heading into OpenLaws sprint.

## What's NOT Captured Here
- Mid-run reasoning from this scheduled task and other Cowork sessions — only their committed outputs survive.
- Apr 25 usage snapshot exists in `dispatch-activity-log.md` but has not yet been appended to `intelligence/usage-tracking.csv`.
- PM-level decision on the #992 floor-bypass-by-routing remediation approach (re-run Scenario 1 with rephrased input vs. score literal output as gate result) — not yet memo-ized.
- Outstanding PO-advice replies from Calliope, CoS, PA still pending — will be the next routing surface once they land.
