# Sandbox Snapshot — 2026-05-03

## Purpose
Re-inflate pointers for the week (Apr 27 – May 3). If sandbox state is lost, host artifacts listed here are the authoritative source. Previous snapshot: `memory/sandbox-snapshot-2026-04-26.md`.

## Active Scheduled Tasks
- **dispatch-daily-brief** — Morning briefing across projects. Last run: 2026-05-03 06:10 PT. Outputs: `~/cool/dispatch/intelligence/daily-brief-YYYY-MM-DD.md`.
- **dispatch-brief-reminder** — Slack summary of the daily brief (now 20/50 past every hour 6–10 AM). Last run: 2026-05-03 10:52 PT. Outputs: Slack DM, no host artifact.
- **connector-health-check** — Probes Cowork connectors. Last run: 2026-05-03 06:09 PT. Outputs: ephemeral Slack DM (no host file).
- **dispatch-activity-log** — Appends daily summary + auto-commits stranded changes. Last run: 2026-05-03 06:41 PT. Outputs: `~/cool/dispatch/memory/dispatch-activity-log.md`.
- **sandbox-snapshot** — This memo. Schedule: Sun 20:06. Last run: now (2026-05-03). Outputs: `~/cool/dispatch/memory/sandbox-snapshot-YYYY-MM-DD.md`.
- **dk-daily-memo** *(NEW this week, adopted May 2)* — Daily DinP→DK memo, 6:09 PM. Last run: 2026-05-03 18:09 PT. Outputs: `~/cool/dispatch/mail/memo-dispatch-dinp-to-dispatch-kind-daily-YYYY-MM-DD.md`.
- **dk-inbox-check** *(NEW this week, adopted May 2)* — Scans `mail/` for unanswered DK memos >24h. Last run: 2026-05-03 07:31 PT. Outputs: Slack flag if anything stale, otherwise silent.

## This Week's Work (by repo)

### dispatch
- **Inter-Dispatch process formalized** — `xian-attention-queue.md` + pull-before-read convention adopted (DECISIONS.md May 2). `dk-daily-memo` and `dk-inbox-check` scheduled tasks adopted.
- **Topology Shape A** — DK mail-deposit-topology question resolved (Apr 30) with convention lift; PR #1 (DK→DinP routing) and PR #2 (DK merge-keeper-sweep standards v0.1) merged.
- **DK↔DinP daily cadence stable** — backfilled Apr 30 + May 1 EOD memos; full daily exchange running Apr 28 → May 3 with miss owned + fallback discipline drafted.
- **Cross-pollination briefs** — substantive every day Apr 28 – May 3 except Apr 29 (orphan recovery). Apr 30 brief: orphan-sweep recovery; May 1: ethics enforcement live; May 2: formal UX walkthrough begins; May 3: audit ships, drift caught.
- **Post-reset usage snapshot** (May 2) — both caps fresh, kindsys upgraded to Max 20x.

### klatch
- **Iris UX walkthrough begins** — session 6 caught up after 2-week gap (UX synthesis closure); session 7 (May 2) started two-pass walkthrough, Surfaces 1–2 captured (12 findings, 2 cross-cutting patterns), paused with explicit resume plan for Fri May 8.
- **/import/klatch round-trip shipped** — Round 31 + 31b extended coverage; `POST /api/projects` memory field added; Argus 4/28–4/29 follow-ups including provenance-summary fix; first live MAXT.
- **Argus orphan-sweep recovery** (Apr 29) — recovered orphan 4/27 sweep, curated, routed findings.
- **Daedalus stood down** at xian's direction pending test-driven findings (Apr 28 wrap log finalized).
- **Calliope** — 4/28 routed round-trip findings to Iris (UX) + Daedalus (impl + design); 4/27 wrap relays + retrospective complement + MCP setup augmentations.
- No klatch commits Sat May 2 → Sun May 3.

### designinproduct
- **Mail-on-main protocol formalized** — Themis introduction memo extracted from claude branch per new rule. CLAUDE.md gained trigger-discipline section (silent claude-branch push + mid-run abort failure modes).
- **Backlog evolution** — closed §1a/1c/1d/PA-reply-convention; closed §1e/g; added §1f Themis. CSV reconciliation surfaced as active.
- **April research drafts committed** — `resources/labrador/`, `resources/memory-research/`, `resources/sneakernet-test/`. Apr 26–30 + May 2 session logs committed (working tree resolved May 3).
- **Daily xpoll briefs Apr 28 – May 3** — all substantive; 7/7 delivery receipts each day except Apr 29 (brief missing). Mon May 4 trigger-health verification checklist filed.
- **Janus → CEO PO collaboration-patterns synthesis** distributed May 2 (reciprocal complement to closed PO advice cycle).

### piper-morgan/piper-morgan-product
- **M2d audit-cascade gate NOT PASSED** on first read May 3 — #707/#714 stale "TBD pending discovery" framing from March, #703 silent-omission of COMPOSTED state. Restructured into 4 new issues (#1030/#1031/#1032/#1033). **Conceptual-integrity gate added** to `m2-structure.md` (Topic 2 decided shape C at M2 super-epic).
- **MUX cluster shipped Apr 30 – May 3**: #1030 INSIGHT-PULL, #1031 INSIGHT-PASSIVE, #1032 INSIGHT-PUSH, #1033 COMPOSTED-EXPERIENCE (anti-surveillance framing), #714 LISTS-STALENESS-UI, #704 LIFECYCLE-UI-A, #1034 STANDUP-STRUCTURED-WORKITEMS. M2d complete.
- **#1018 Phase 2** — `audit_transparency` durable Postgres storage, cluster #1006/#1007/#1008 closed, 17/17 tests pass.
- **M2 review walk Sun May 3** — decision log opened, 5 M2e gameplans drafted with audit-cascade matrices; **M2e Phase -1 infra verification spike** opened; #864 split into #1039 + #1040; #1041 WIRE-triage filed.
- **BRIEFING-ESSENTIAL-CIO v3** — Section 4 structural gaps applied + notification memo.
- **PA Day 33 opened** May 3 (return after 4-day gap; M2 review queued).

### piper-morgan/piper-morgan-website
- **4 new posts**: "The Deeper Why" narrative (Apr 28), Weekly Ship #040 "The Methodology Audits Itself" (Apr 29 publication, Apr 17–23 window), "The Floor Comes Alive" (May 1), "The Drift You Don't Notice" (May 3, first `/blog/insight` category post), "Friction-Focused Feedback" (May 3). Plus heading fix on Drift post.

### rebel
- No commits this week. Still back-burner.

### weather (Zephyr)
- Cross-pollination briefs only — Apr 27, 28, 30; May 1, 2. Otherwise dormant.

### OpenLaws
- **Bet 1 sprint week 1 wrapped** (Sprint Day 5 May 1; week-1 retro input filed with prompt mapping + 4-person scaling answer).
- **POC → bet rename** — `openlaws-mcp-poc-py` becomes `openlaws-mcp-bet`; package + paths + forward-looking refs updated; pre-merge cleanup completed; rename branch ready signal to PO.
- **Pitch artifacts** for JB4-10 + JB13 — Notion download + suggested-edits doc.
- **Research/decisions filed** — comp-landscape, ha-phan, turnbull deep-dives, ADR-tool-naming, john-bet-archive.
- **PO Thursday morning prep rollup** + reply on build-pace estimate.
- **Parallel-work track** Apr 30 — cite-validator design, plugin spike + scaffold, demo polish.
- **Day 8 v0.1 stub** — synonym table v0.3, surveyor skill, install guide, API issues fix-ready.
- **DK sweep-standards PR #8** merged May 3 (formalize merge-keeper sweep + Vergil tmp-worktree question + Sat log).
- **Cross-pollination briefs** Apr 30 → May 2 mirrored.

## Memos Filed This Week (`~/cool/dispatch/mail/`)

DinP → DK:
- `memo-...-consolidated-replies-2026-04-26.md` — 4 respondents replied to PO advice + Bet 1 bundle (filed Apr 26, week-boundary)
- `memo-...-path-correction-openlaws-brief-2026-04-28.md` — `dispatch/briefing-YYYY-MM-DD.md` not `current.md`
- `memo-...-daily-2026-04-28.md` — Apr 26–28 catch-up + cadence question
- `memo-...-daily-2026-04-29.md` — backfilled, one day late, miss owned
- `memo-...-daily-2026-04-30.md` + `memo-...-daily-2026-05-01.md` — backfilled together (miss owned, fallback discipline drafted)
- `memo-...-topology-reply-2026-05-01.md` — Shape A with convention lift + collab-patterns routing ack
- `memo-...-collab-patterns-routing-ack-2026-05-01.md`
- `memo-...-daily-2026-05-02.md`
- `memo-...-implementation-reply-2026-05-02.md`
- `memo-...-process-improvements-2026-05-02.md`
- `memo-...-daily-2026-05-03.md` (auto, dk-daily-memo task)

DK → DinP:
- `memo-...-monday-relay-received-2026-04-27.md`
- `signal-...-mail-deposit-topology-question-2026-04-28.md`
- `memo-...-2026-04-28-route-collaboration-patterns-synthesis.md`
- `memo-...-2026-05-02-process-improvements-reply.md`

Also (Apr 27 boundary): `signal-dispatch-dinp-to-dispatch-kind-bundle-complete-2026-04-27.md`, `signal-dispatch-dinp-to-dispatch-kind-po-relay-ready-2026-04-27.md`.

## Plans / Intelligence Filed This Week
- No new files in `~/cool/dispatch/plans/` (still `source-of-truth-v0.md` Apr 11).
- `~/cool/dispatch/intelligence/`: daily briefs Apr 27, 28, 29 + May 3 (Apr 30 / May 1 / May 2 missed at the dispatch path — DinP xpoll briefs are the fresh source of record). Cross-pollination dailies Apr 27, 28, 30 + May 1, 2, 3. `current.md` mirror updated.
- `intelligence/standing-items.md` added (kindsys balance watch, auto-commit hygiene).
- Usage tracking CSV last appended Apr 17 — Apr 25 + Apr 28 + May 2 (post-reset) snapshots in activity log waiting to be structured. **16 days stale.**

## Ongoing Threads
- **OpenLaws Bet 1 sprint week 2** — week 1 wrapped, POC→bet rename complete, JB4-10 + JB13 pitches filed. Sprint window closes Sun Jun 7 (T+35). Key files: `~/cool/OpenLaws/` + `~/cool/dispatch/intelligence/cross-pollination/2026-05-01.md`.
- **DK↔DinP automation maturity** — dk-daily-memo + dk-inbox-check adopted; topology Shape A; mail-on-main protocol; xian-attention-queue + pull-before-read convention. DK-side `dinp-daily-memo` (6:30 PM) + `dinp-inbox-check` symmetric automation pending. Key files: `~/cool/dispatch/DECISIONS.md`, daily memos chain above.
- **PM M2 super-epic review** — M2d audit-cascade NOT PASSED + restructure complete (4 issues filed); M2e Phase -1 infra verification spike opened with 5 gameplans + conceptual-integrity gate at M2 super-epic. Key files: `~/cool/piper-morgan/piper-morgan-product/` (`m2-structure.md`, M2e gameplans, decision log).
- **Klatch Iris UX walkthrough** — session 7 paused mid-walkthrough (Surfaces 1–2 of 8 + Pass 2 Shipping News scenario pending). Resume planned Fri May 8. "Functional artifacts surviving early development" pattern flagged for reuse. Key files: Klatch session logs + `intelligence/cross-pollination/2026-05-02.md`.
- **/import/klatch round-trip + first live MCP integration** — Round 31b shipped Apr 28; AAXT regression + threshold + first live MCP integration in Round 29–30. Key files: Klatch session wrap logs Apr 27–28.
- **DinP mail-on-main + trigger-discipline** — Themis introduction extracted; CLAUDE.md trigger-discipline section formalized; April research drafts committed (labrador / memory / sneakernet). Key files: `~/cool/designinproduct/CLAUDE.md`, `docs/backlog.md`, `resources/labrador|memory-research|sneakernet-test/`.
- **PM publication tracks structurally distinct** — Ship newsletters (operational), Building Piper Morgan Medium series (narrative), `/blog/insight/` (methodology). The Drift You Don't Notice is the first insight post.
- **Janus PO collab-patterns synthesis** — Janus→CEO memo May 2; reciprocal complement to closed PO-advice cycle. Action: read + fold + push back if anything doesn't match self-observation.
- **Cross-pollination 9-repo cadence** — DinP xpoll briefs are now the fresh source of record; dispatch-side `cross-pollination-current-week.md` is stale (covers Apr 21–27, mtime Apr 27).
- **Sun Jun 15 (T+43)** — Sonnet 4 / Opus 4 deprecation. Aliases in place; DB audit query for pinned literal IDs remains (Argus-tracked).

## What's NOT Captured Here
- Mid-run reasoning from this scheduled task and other Cowork sessions — only their committed outputs survive.
- Three usage snapshots (Apr 25 + Apr 28 + May 2 post-reset) live in `dispatch-activity-log.md` but have not been appended to `intelligence/usage-tracking.csv`. **16 days stale.**
- Calliope (Klatch) PO advice-on-working-with-xian reply — outside the original 5–7 day window. Tracking only.
- Several PM-product working-tree items 6 days stranded as of May 3 morning (`dev/active/merge-keeper-2026-04-28.md` + 11 modified MANIFEST.md + new Janus CEO memo). OpenLaws `experiments/openlaws-mcp-poc-py/` rename residue.
- Janus DinP backlog three §1 items (bootstrap scaffolding, memory file refresh, daily memo composition) — resumable.
