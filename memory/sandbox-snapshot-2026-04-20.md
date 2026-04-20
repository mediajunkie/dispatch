# Sandbox Snapshot — 2026-04-20

## Purpose
Re-inflate pointers for the week. If Cowork sandbox state is lost, the host artifacts listed here are the authoritative source.

## Active Scheduled Tasks
- **dispatch-daily-brief** — 06:09 daily. Last run: 2026-04-20 12:01Z. Outputs: `~/cool/dispatch/intelligence/daily-brief-YYYY-MM-DD.md`.
- **dispatch-brief-reminder** — half-hourly 06:20-10:50. Last run: 2026-04-20 14:22Z. Output: Dispatch Slack message; no host artifact.
- **connector-health-check** — 06:09 daily. Last run: 2026-04-20 12:01Z. Output: Slack ping; probes Cowork connector auth state.
- **dispatch-activity-log** — 06:41 daily. Last run: 2026-04-20 13:02Z. Outputs append to `~/cool/dispatch/memory/dispatch-activity-log.md`.
- **sandbox-snapshot** — Sundays 20:06. This run. Outputs: `~/cool/dispatch/memory/sandbox-snapshot-YYYY-MM-DD.md`.

## This Week's Work (by repo)

### dispatch
- DECISIONS.md practice introduced as anti-zombie mechanism for briefs; broadcast memo sent to all agents (699efbd, 97d59cd).
- Cross-pollination briefs for 4/16–4/18 filed in batch (aa444ba); 4/15 brief redacted over OpenLaws data boundary (e34f700).
- Agent Q&A channel Phase 1 launched (2c2ff24); CLAUDE.md behavioral contract added to dispatch repo (d5f3e9f).
- SSH port 443 workaround propagated from Calliope (e6f97e7).

### klatch
- **Phase 5a + 5b shipped:** Klatch is now a read-only MCP server (05e1373) with tools surface `list_channels`, `get_context_package`, `get_manifest` (18894fa, b44ebb6).
- **Phase 4 complete:** Claude Code export adapter (cdc3d37) and claude.ai transport with round-trip (61ee685), 27+23 tests.
- **Phase 3.5 behavioral calibration pipeline fully shipped:** 3.5a self-authored handoff (119e273), 3.5b external behavioral extraction (edb99b7), 3.5c micro-reflections (3839df0), 3.5d export review UI (db0d4c2). 910+ tests by session wrap 4/13.
- Haiku 3 MODEL_ALIASES bug caught by curated sweep (61badce) before 4/19 retirement; fix validated (76bf28f).
- Local-model viability research filed with phased adoption plan (c0b7136, e2b5149).

### designinproduct
- **M2c gate closed, ethics activation unblocked** (98b0246). Pattern-062 in Identity landed.
- DECISIONS.md ported (7ae258b); sweep-prompt reference rewritten to match live scan-only trigger (f6ac4f1).
- April 15 brief redacted for OpenLaws data boundary (00d8287).
- New agent UI page (light theme, mobile) shipped with 10 new agents (fb260b2).

### piper-morgan-product
- **#979 Haiku 3 → Haiku 4.5 migration completed** ahead of 4/19 retirement (9a868525).
- **#950 floor prompt evolution:** Five Pillars + grammar + anti-flattening (d9f9b3f2), canonical retest iter 2 reached 72.1% PASS (ae92803f).
- M2 super-epic structure + M2a/M2b gate checkpoints (14724c75, b040ddb8); #964 ethics verification complete (a6b3a6de).
- Gemini wired as real primary/fallback provider (1a8fdde6); linter consolidation to ruff (37cfdfda).
- Omnibus logs for 4/14, 4/15, 4/16, 4/18, 4/19 filed; session-log maintenance hook added (8cbdff53).
- Apr 13 five-layer cross-pollination routed to 5 roles (01d35736); Managed Agents assessment filed (61888328).

### piper-morgan-website
- Three blog posts shipped: **The Migration** (Apr 16), **Thirteen Mailboxes** (Apr 18), **Sibling Intelligence** (Apr 19). Plus Weekly Ship #038 + The Closing Sprint from earlier in the week.
- PDR-004 principle-name corrections (ca153b88a); heading-level / sentence-case cleanup across posts.

### rebel
- `~/cool/rebel` not accessible in this run (directory not readable from sandbox osascript). Flag for xian: verify repo state next snapshot.

### weather
- Only cross-pollination brief updates (4/14–4/18). No substantive weather changes.

### OpenLaws
- **John call synthesis + Bet C work plan + all-hands v0.2 + Monday plan filed** (1d21d74).
- Citation gap analysis and FED-USC finding (61bf1d1); domain briefing + principles seed + eval-harness roadmap (1f117b0).
- Vergil eval harness v1 → v1.1 with PO review additions (0c108d3); 50-query dataset + runner + baseline (2c2940b).
- Laptop-handoff continuity memo + docs/ reorganization (8179c0e, 7ef8b3f).
- 4/15 brief redacted for data boundary (9a9a2c3).

## Memos Filed This Week
Recent additions to `~/cool/dispatch/mail/` (committed in the 4/13–4/20 window):

**Dispatch → all:**
- `memo-dispatch-to-all-agents-decisions-practice-2026-04-18.md` — DECISIONS.md broadcast, now canonical practice across projects.

**PA → Dispatch:**
- `memo-pa-to-dispatch-memory-stores-access-2026-04-14.md` — Memory Stores API access application in progress.

**Docs → Janus (filed retroactively on 4/15):**
- `memo-docs-to-janus-memory-prior-art-2026-04-12.md` — memory research prior-art pass.
- `memo-docs-to-janus-memory-followup-2026-04-12.md` — follow-up items.

**Janus → PA (earlier in week):**
- `signal-janus-to-pa-temporal-validity-approved-2026-04-13.md` — unblocker.

## Intelligence Artifacts
- Daily briefs: 4/13 → 4/19 all present in `~/cool/dispatch/intelligence/`.
- Cross-pollination: `current.md` + 4/11 → 4/18 dailies in `cross-pollination/` subdir.
- Usage-tracking CSV refreshed 4/17 (mediajunkie dropped); 4/14 three-account snapshot and 4/17 two-account snapshot filed.
- Agent Q&A log live at `intelligence/agent-qa-log.md`.
- No new plans/ artifacts this week — latest is `source-of-truth-v0.md` (4/11).

## Ongoing Threads
- **Klatch MCP integration (Phase 3.5 → 5b)** — status: Phase 5b shipped, Klatch is now an MCP server with tools surface. Key files: `cool/klatch/` Phase 5 commits b44ebb6 / 18894fa / 05e1373; Phase 3.5 design doc + consensus.
- **DECISIONS.md practice rollout** — status: canonical in dispatch, klatch, designinproduct, piper-morgan-product, OpenLaws. Broadcast memo filed. Thread to watch: whether it actually gets used or becomes ornamental.
- **Haiku 3 retirement (#979)** — status: migration complete across piper-morgan ahead of 4/19 cutoff; klatch alias bug fixed. Officially closable after one-week verification window.
- **Piper-Morgan M2 super-epic** — status: M2a + M2b closed, M2c closed on 4/18, ethics activation unblocked. Next: #950 floor-prompt iteration toward higher PASS rate.
- **OpenLaws Bet C + all-hands** — status: v0.2 draft + Monday plan filed; eval harness v1.1 ready for baseline. Next checkpoint: Monday session outputs.
- **Source-of-truth v0 design** — status: plan filed 4/11, no updates this week. Thread still live but dormant in plans/.
- **SSH port 443 workaround** — status: propagated from Calliope through dispatch → klatch / designinproduct / piper-morgan-product / OpenLaws CLAUDE.md files. Done.
- **Cross-pollination data boundary** — status: 4/15 brief redacted across 5 repos after OpenLaws boundary concern; redaction pattern established.

## What's NOT Captured Here
- Any mid-run reasoning from Cowork sessions this week that didn't get reflected to a host memo. Daedalus/Argus/Iris Klatch session wraps are all committed, but their intra-session deliberation is only in commit messages.
- Rebel repo state — directory not accessible in this snapshot run; could not confirm whether work happened there this week.
- Scheduled-task run logs beyond what's reflected in the intelligence/ outputs; if a brief failed silently on any given day, there's no host-side breadcrumb other than the missing file.
