# Sandbox Snapshot — 2026-04-21

## Purpose
Re-inflate pointers for the week. If sandbox state is lost, host artifacts listed here are the authoritative source.

## Active Scheduled Tasks
- **dispatch-daily-brief** — morning briefing across all projects. Last run: 2026-04-21 17:45 UTC. Outputs: `~/cool/dispatch/intelligence/daily-brief-YYYY-MM-DD.md`.
- **dispatch-brief-reminder** — Slack summary of today's brief. Last run: 2026-04-21 17:45 UTC. Outputs: Slack DM to xian.
- **connector-health-check** — probes Cowork connectors, reports live/dead. Last run: 2026-04-21 17:45 UTC. Outputs: Slack DM + terminal output (no persistent host artifact).
- **dispatch-activity-log** — appends day's summary to activity log. Last run: 2026-04-21 17:46 UTC. Outputs: `~/cool/dispatch/memory/dispatch-activity-log.md`.
- **sandbox-snapshot** — this memo. Last run: 2026-04-21 17:46 UTC. Outputs: `~/cool/dispatch/memory/sandbox-snapshot-YYYY-MM-DD.md`.

All five tasks enabled and firing on cadence. No disabled or failing tasks.

## This Week's Work (by repo)

### dispatch
Cross-pollination machinery hummed on schedule: weekly digest shipped (c806195), daily briefs + revised Apr 21 brief. DECISIONS.md introduced (699efbd) and broadcast to all agents (97d59cd) as lightweight per-project decision log for anti-zombie brief checks. SSH port 443 workaround propagated from Calliope across every repo (e6f97e7). Previous snapshot filed 2026-04-20 (0f58176) — note the cadence has drifted from Sunday-only to mid-week runs.

### klatch
Phase 5 shipped big: **Phase 5a (Klatch as MCP server, read-only resources)** at 05e1373, **Phase 5b (MCP tools surface with list_channels, get_context_package, get_manifest)** at 18894fa, then extended coverage in Round 26b (b44ebb6). Entity reframe filed and Phase 5 green-lit on 4/18. Calliope flagged Argus routing fix + SSH-443 workaround same day. Apr 15 brief redacted + superseded notice sent to Calliope (cef20a3).

### designinproduct
High-velocity publishing week. **Blog launches:** The Migration (Apr 16, ahead of schedule), Thirteen Mailboxes (LinkedIn + Medium syndication), Sibling Intelligence (Apr 19). Editorial calendar updated with syndication URLs. Session log maintenance hook added + CLAUDE.md log discipline strengthened (8cbdff53). Apr 16 went omnibus (6 sessions, HIGH-COMPLEXITY: COORDINATION).

### piper-morgan/piper-morgan-product
**Ethics activation unblocked** (Apr 18 brief 98b0246); M2b + M2c gates closed (57d6a7ca); ethics verification complete with 3 follow-ups (a6b3a6de). **PDR-004 canonical-term discipline** landed Apr 21 (66f4280) alongside ethics voice architecture and cross-pollination mechanism verification. Identity context anchoring + sharper prompt for #950 (ae92803f); Gemini wired as real primary/fallback in LLMClient (1a8fdde6); floor prompt evolved with Five Pillars + grammar + anti-flattening (d9f9b3f2). Sweep-prompt reference rewritten to match live scan-only trigger (f6ac4f1).

### piper-morgan/piper-morgan-website
Followed designinproduct publishing cadence: Sibling Intelligence, Thirteen Mailboxes (with hero + body image, YAML frontmatter support added), The Migration, The Closing Sprint, Weekly Ship #038 — The Floor Comes Alive. PDR-004 principle name fixes in Closing Sprint + Ship #036 (ca153b88a). RSS + Medium dedup fixes (b263634ad, 493250e54).

### rebel
Quiet: only cross-pollination brief receipts (5 commits, no substantive work).

### weather
No commits this week.

### OpenLaws
Steady weekday work blocks. Tuesday: domain briefing, principles seed, cross-pollination synthesis, eval harness roadmap (1f117b0). Wednesday: two briefings, citation gap analysis, FED-USC finding, all-hands script (61bf1d1). Thursday: John call synthesis, Bet C work plan, all-hands v0.2, Monday plan (1d21d74). Friday: Stan MCP reply draft, Monday plan updates, session log through 4/17 (584d175).

## Memos Filed This Week
Mail traffic is mostly embedded in project-repo git history this week rather than `~/cool/dispatch/mail/`. The dispatch mailbox saw one fresh memo:
- `~/cool/dispatch/mail/memo-dispatch-to-all-agents-decisions-practice-2026-04-18.md` — DECISIONS.md practice broadcast from Dispatch to every agent.

Project-repo mail activity (in-repo):
- piper-morgan-product: xian→Lead Dev (Argus local LLM research for PM adaptation), Janus→PA (Apr 15 brief redaction), cover memo to CIO + archaeology deliverable for #982, CXO inbox cleared 7→0, Docs inbox cleared (CIO flywheel audit + Comms PDR-004 corrections), end-of-day mail sweep.
- klatch: Janus→Calliope on Apr 15 brief redaction (cef20a3); Calliope memos on 4/18 re: entity reframe + Phase 5 + Argus routing.

## This Week's Intelligence + Plans
No new files in `~/cool/dispatch/plans/` (newest is `source-of-truth-v0.md` from Apr 11). No new design docs filed in `~/cool/dispatch/intelligence/` beyond the standard daily-brief + cross-pollination outputs — the cross-pollination machinery itself is the week's intelligence artifact.

## Ongoing Threads

- **Klatch Phase 5 (MCP server transformation)** — 5a + 5b shipped, extended coverage in progress. Key files: klatch commits 05e1373, 18894fa, b44ebb6; session wraps from Daedalus 4/18.
- **DECISIONS.md practice rollout** — lightweight per-project decision log for anti-zombie brief checks. Broadcast Apr 18, adopted across dispatch + klatch + piper-morgan. Key files: `~/cool/dispatch/mail/memo-dispatch-to-all-agents-decisions-practice-2026-04-18.md`, dispatch 699efbd, klatch 5a390db.
- **PDR-004 canonical-term discipline + ethics voice architecture** (piper-morgan) — ethics activation unblocked Apr 18, PDR-004 + voice arch landed Apr 21 in the substantive brief. Key files: piper-morgan-product 66f4280, 98b0246, a6b3a6de; piper-morgan-website ca153b88a (principle name fixes).
- **designinproduct publishing cadence** — four posts shipped this week with Medium+LinkedIn syndication plumbing. Key files: f5ff7d14d (Sibling Intelligence), d6293e546 (Thirteen Mailboxes), 20c91ff82 (The Migration), 05ea1df40 (The Closing Sprint). Editorial calendar is the canonical tracker.
- **OpenLaws data boundary enforcement** — Apr 15 cross-pollination brief redacted across all repos after OpenLaws content leaked in. Key files: dispatch e34f700, klatch 2fcba36, rebel 18f6491; Janus→Calliope + Janus→PA superseded notices.
- **SSH port 443 workaround** — Calliope-originated, propagated across dispatch, klatch, designinproduct, rebel, OpenLaws. Key files: e6f97e7 (dispatch) plus matching commits in every repo's CLAUDE.md.

## What's NOT Captured Here
- Scheduled-task run logs live only in the Cowork execution layer — if the sandbox is pruned, the fact that dispatch-daily-brief last ran at 2026-04-21 17:45 UTC is not reflected to host. Outputs persist (in `intelligence/`), but provenance does not.
- Connector-health-check output is ephemeral (Slack DM only). Consider having it also write a host-side status file if the connector state becomes something we want to diff over time.
- Snapshot cadence drift: task was scheduled Sunday 8:06 PM but has been running mid-week (Apr 14 Tue, Apr 15 Wed, Apr 20 Mon, Apr 21 Tue). Either the cron expression is being overridden or the task is being manually re-fired. Not a problem, but worth noting before next week's snapshot.
- Weather repo has been quiet a full week — if that's intentional (paused) it should probably be filed somewhere; if not, it's drift worth flagging.
