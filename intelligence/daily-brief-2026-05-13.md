# Dispatch Daily Brief — 2026-05-13

**[BACKFILLED 2026-05-20 — reconstructed from available records]**

*Sources: activity log (limited; primary log entry is 5/15), `intelligence/cross-pollination/2026-05-13.md`, dispatch commit history for May 13, DK 5/13 daily memo, dispatch mail dated 5/13. Live brief never generated; the `dispatch-daily-brief` scheduled task was firing ghost-runs through 5/12–5/14 (root-caused 5/15).*

## Overnight Activity

- **Piper Morgan (product)**: **M2f-E cohort closed end-to-end — 4 issues, 12 hours.** #984 CONTEXT-CACHE (`ContextCache` helper with graceful Redis fallback, 31 tests); #983 CONTEXT-BLOCKED (top 10 open blocked issues surfaced to floor, 7 tests); #985 CONTEXT-SPRINT (active GitHub milestones sorted by `due_on`, 7 tests); #986 CONTEXT-ACTIVITY (issues + PRs touched last 7 days, type-distinguished, 8 tests). Floor context inventory closes Tuesday at 7 cached, fail-graceful, fresh surfaces (trust_profile, pending_todos, completed_todos, reminders, calendar, projects, user_context, blocked_items, active_milestones, recent_activity). Straggler sweep: #1068 + #1069 + #1078 also shipped; #1070 deferred. Total day: 7 issues closed, 57 new tests. *Audit and Talk* published on pipermorgan.ai.
- **Klatch (~6 commits)**: **Opus 4.7 default-flip shipped** via `ba69f7f` — `DEFAULT_MODEL` `claude-opus-4-6` → `claude-opus-4-7` + Vitest singleThread fix for ~8% client-suite flake. 1263 tests green (1085 server + 178 client). The +35% tokenizer compaction-threshold concern Daedalus had held the flip on yesterday did not materialize in his own 4.7 sessions — xian released the hold mid-morning. **Argus Dreaming research spike published** — 478-line, 5-pass, 2-hour doc (`docs/research/anthropic-dreaming-import-export-impact-2026-05-12.md`) confirming Anthropic's Managed Agents memory store is architecturally identical to Klatch's L3 (markdown filesystem, hierarchical namespace, session-persistent). April 12 Janus synthesis predicted this shape with ~90% accuracy. Five decisions named (D1–D5); D1 (`extensions.klatch.l3_snapshot` for export packages) is load-bearing. **Iris session 11 wrap** — vocabulary V1–V5 resolved (`chats`/`klatches`/`agent`/`role`/`invite`/`convene`), `docs/ux/object-model.md` updated, holistic 1.0 design brief filed at `docs/ux/design-brief.md`.
- **OpenLaws (DK, several commits)**: **SKILL fix PR #35 opened and merged** — 844-char description passed full 12/12 spike regression battery + 3-query smoke test. Jerry rebased `feature/expand-hierarchy`; PR #34 reviewed clean (54/54 tests pass; live API end-to-end confirmed for TX-RR navigation). Both PRs in same morning. **Trust artifacts Phase 1 source-of-truth revised** — six John-feedback points applied + significant BYOC architectural correction surfaced by xian (Anthropic is the *customer's* AI provider, not OpenLaws's sub-processor; customer-dashboard audit-log claim pulled; ZDR-with-Anthropic declared moot; Pillars 4/5/6 rewritten). Phase 2 outlines (System Card, Evaluator Brief) updated to match. **Wireframes v0.1.1 → v0.1.6** — openlaws.us-faithful stylesheet reverse-engineered from live Hugo bundle; Typekit `freight-sans-pro`/`freight-text-pro`, tan/wine/eucalyptus palette confirmed live. **MCPB submission timing recommendation** delivered by Vergil subagent: submit now, don't wait for hosted Remote MCP. **Persona ratified by John** — regulatory analyst + industry-specialist SME combined as primary; auditors dropped. PO batch: consolidated 54-query regression catalog, SME pipeline plan, bet-status overview, level-5/6 stretch doc.
- **designinproduct**: 5/13 cross-pollination brief published (4.7 ships, Floor expands) covering Opus 4.7 default-flip, Argus Dreaming spike, Iris session 11 vocabulary + 1.0 critical path, PM M2f-E cohort.
- **Dispatch (~7 commits)**: **Round-trip verification completed** — DinP sent token A, DK acknowledged + returned token B; both clones confirmed synced; both Phase 0 pull gaps acknowledged. **PR #3 merged** (`dk/2026-05-05-symmetric-tasks-live`). DK opened follow-up signals: bottleneck-followup (push-arm landed), osascript-bridge reply + queue MCP-verification, roundtrip-verification-ack-complete, roundtrip-verification-ping. **Usage snapshot logged** (5:32 AM PT) — DinP 77% weekly (resets tonight), balance $32.92; kindsys 38% weekly (resets Fri), balance $6.35. DinP scheduled task was ghost-running; no DinP→DK daily memo on this date (covered later by 5/14 backfill memo `816a298`).

## Needs Your Attention

- **DinP `dk-daily-memo` ghost-running** — task fires, makes ~4 tool calls, stalls without writing a memo. Three days running (5/12, 5/13, 5/14). Root cause unknown at this point. Top priority for next interactive DinP session.
- **DK stale branches** — `dk/2026-05-05-push-pattern-verify-pr` and `dk/2026-05-05-symmetric-tasks-live` (the latter was merged in PR #3 today but origin branch remains). Both DinP + DK vote delete (superseded by two-tier push policy). Open since 5/13.
- **Usage CSV reconciliation** — snapshot logged in activity log this morning (DinP 77%, kindsys 38%); not yet structured into the CSV file.

## Agent Status

- **Janus (DinP)**: Backlog still resumable; activity-log catch-up landed 5/10; awaiting next session.
- **Daedalus (Klatch)**: Big day — default-flip ratified after compaction-threshold check, Iris faint-token Tier-1 patch shipped same day. Track 1 cadence is working.
- **Argus (Klatch)**: Dreaming research spike — full 5-pass research doc in 2 hours; D1–D5 decisions named for Daedalus.
- **Iris (Klatch)**: Session 11 wrap — vocabulary V1–V5 resolved, 1.0 critical path design brief filed.
- **Calliope (Klatch)**: Commissioned Argus spike in the morning; Step 11 scoping doc; entity-reframe blog draft; default-flip routing.
- **Lead Dev (PM)**: M2f-E cohort closed end-to-end (4 issues / 57 tests / 12 hours).
- **Docs (PM)**: *Audit and Talk* published; activity-log row-add discipline (Step 10.5) ratified yesterday, first run pending tomorrow.
- **Vergil (OpenLaws)**: Trust artifacts Phase 1 revised (BYOC correction); MCPB submission timing recommendation.
- **PO (OpenLaws)**: 54-query regression catalog consolidated; persona ratified by John; SME pipeline plan filed.
- **Dispatch-DinP / Dispatch-Kind**: Round-trip closed (tokens A↔B exchanged); push-arm follow-up landed.

## Deadlines

- **Mon 5/18 (T+5)**: Merge-keeper sweep next due.
- **Fri 5/22 (T+9)**: OpenLaws Friday demo (Loom backup + 2–3 min live).
- **Sun Jun 7 (T+25)**: OpenLaws Bet 1 sprint window close.
- **Sun Jun 15 (T+33)**: Sonnet 4 / Opus 4 deprecation. Klatch DB audit query for pinned literal model IDs overdue.

## Usage Check

- **designinproduct.com (Max 20x)**: 77% weekly (resets ~9 PM tonight), Sonnet 6%, Claude Design 0%, balance $32.92, auto-reload ON. Snapshot logged this morning but not yet in CSV.
- **kindsys.us (Max 20x)**: 38% weekly (resets Fri 6:00 AM), Sonnet 2%, balance $6.35, auto-reload ON. Snapshot logged but not yet in CSV.

## Cross-Project Intelligence

From today's 5/13 brief:

- **Opus 4.7 default-flip is empirical evidence the +35% tokenizer concern is real in principle but not necessarily a problem in practice on current session patterns.** PM (Lead Dev) — watch PreCompact hook fire timing on 4.7 vs 4.6 baseline.
- **Anthropic memory store ≅ Klatch L3 — import/export contract intact.** Strategic finding holds: don't compete on "external memory layer for Claude"; compete on assembly-layer differentiation. D1 (`extensions.klatch.l3_snapshot`) is load-bearing for Daedalus's Step 11 scoping.
- **Iris vocabulary principle V4 (verb pairs: `invite` for adding to existing, `convene` for creating new)** transferable to PM's multi-agent session gestures.
- **PM `ContextCache` helper pattern** — cache the superset at API level, slice at consumer level. One cache entry serves multiple query shapes. Worth noting for Klatch eval/research pipelines hitting external APIs repeatedly.
