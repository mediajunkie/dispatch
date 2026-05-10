# Dispatch Daily Brief — 2026-05-10 (Sunday)

## Overnight Activity

- **Piper Morgan (product, ~20 commits)**: **Big Saturday — M2f Group A+B closed end-to-end.** −2,229 LOC removed via dead-code disposition: #933 bypass deletion (un-broke 5 tests; bypass outlasted its reason 6+ months), #936 UserService deletion (dead code, real auth is PostgreSQL+JWT), #935 BudgetManager/APIUsageTracker deletion (transitive dead code, alembic drop). 4 worktrees + 2 subagents in one session. **Pattern-067 (Issue-Body Reality Mismatch) filed Emerging.** Run 7 retest at **68.9% PASS** (vs Apr 12 baseline 65.6%) — **CEO M2f gate criterion met, audit-cascade unblocked.** Three narrow bug fixes shipped (#1065 setup-wizard refs, #1067 4th subsumption rule, #1066 `#N` slot-fill regex). #1072 deprecated `regex=` → `pattern=` migrated. Filed: #1068 (2 pre-existing test failures, unrelated), #1069 templated handler (P:low), #1070 multi-turn harness (P:low).
- **Piper Morgan (website)**: No new commits.
- **OpenLaws (3 commits)**: Quiet Sunday. PRD scrubs (Quality success-criteria heading; Texas-only removed from v1 synthesis as resolved); 5/9 weekend brief logged.
- **designinproduct (~10 commits)**: 5/10 sweep substantive + xpoll brief delivered. **Hub CLAUDE.md gained Multi-Agent Operation subsection** (mail-on-main, branch hygiene, lightweight concurrent-operation discipline) plus follow-up concurrent-operation paragraph — both xian-approved 5/9. **Janus Layer 5 mandate expanded** to four working areas (Public-facing, Cross-pollination, Federated mail, Operational hygiene) with Active Stewardship of Own Context section. Themis chapters 5–12 + Lake Raven inherent-value confirmation + anchor-and-elective principle filed (autonomous chapter work). Agent activity tracker synced.
- **Klatch (1 commit)**: 5/10 cross-pollination brief receipt only. No session activity.
- **Dispatch (6 commits)**: 5/9 daily memo to DK; **activity-log catch-up Mar 31→May 9** (267 rows: PM 148 + DinP 33 + Dispatch 35 + Klatch 51 prelim); **usage-tracking CSV refresh** (Apr 25/28 + May 2/5 — closes 22-day carry); inbox-check ack of DK 5/07; auto stranded-changes commit; yesterday's brief.
- **Weather/Zephyr, Rebel**: No activity (Rebel back-burner).

## Needs Your Attention

(none new — all yesterday's escalations either resolved or already-tracked tomorrow-pending; see Carried Queue)

## Agent Status

- **Argus sweep — split regime nominal**:
  - External (auto): latest `2026-05-04-sweep.md` (6 days, within 8-day window). **Next CCR auto-trigger tomorrow Mon 5/11 9 AM PT.**
  - Internal (curation): latest curated `2026-04-27-sweep-curated.md` (13 days, within 14-day flag — borderline).
- **Janus (DinP)**: 5/10 sweep + xpoll brief delivered substantive. Active. §1 backlog still has bootstrap scaffolding + memory file refresh + daily memo composition — resumable.
- **Themis (DinP)**: Heavy autonomous output Saturday — 8 chapters + Lake Raven entity work + post-merge absorption ack to Janus. Self-driving.
- **Iris (Klatch) UX walkthrough**: Surfaces 3–8 + Pass 2 still paused; 5/8 resume planned, did not happen. Carries.
- **Dispatch-Kind**: silent 3 days (last memo 5/7). Per 4/23 DECISIONS.md skip-days OK with backfill on next session. Tracking only.
- **Calliope (Klatch)**: PO advice reply outside original window; tracking only.

## Deadlines

- **Mon 5/11 (T+1)**: Argus next external CCR auto-trigger; Claude 3.7 Sonnet retires on Vertex AI (no Klatch impact — aliases in place); OpenLaws PR #30 review with Jerry; OpenLaws Monday retro (5 strategic questions).
- **Sun Jun 7 (T+28)**: OpenLaws Bet 1 sprint window close.
- **Sun Jun 15 (T+36)**: Sonnet 4 / Opus 4 deprecation. Klatch DB audit query for pinned literal model IDs remains overdue.

## Usage Check

- **designinproduct.com (Max 20x)**: last 5/5 — weekly **48%** (resets Wed 9PM); $0 extra (post-reset, resets Jun 1); balance $32.92; auto-reload ON.
- **kindsys.us (Max 20x, upgraded 5/2 from Max 5x)**: last 5/5 — weekly **19%** (resets Fri ~6AM); $0 extra (post-reset); balance **$6.35 (thin)**; auto-reload ON.

CSV is now current through 5/5 (closes the 22-day carry). Next refresh likely needed mid-week.

## Today Carried Queue

- **OpenLaws PR #30** — PO's plain-language register layer + fixes pending Jerry's review **tomorrow (Mon 5/11)**. No action today.
- **OpenLaws five strategic questions for Monday retro** — cross-client aggressiveness, Smithery vs Anthropic-first, curated-vs-open, OAuth timing, Verified Publisher badge. **Tomorrow.**
- **OpenLaws synonym-registry question to John** — PO draft at `workdesk/draft-question-to-john-synonym-registry-2026-05-04.md` unsent (carried 6 days, mtime verified 5/5). Light-touch sanity-check.
- **OpenLaws working-tree hygiene** — `experiments/openlaws-mcp-poc-py/` rename residue (10+ days untracked, verified this pass).
- **PM SDK 6 versions behind** — `@anthropic-ai/sdk 0.92.0` vs. pinned `^0.86.1`. Queued for next dep-maintenance window.
- **PM roadmap.md 29 days stale** — last mtime Apr 11; Docs audit (#1049) flagged; PPM cadence proposal pending.
- **#983 CONTEXT-BLOCKED label-convention memo to Architect** — sent Tue 5/05; in arch inbox; awaiting Architect verdict.
- **Iris (Klatch) UX walkthrough** — paused; 5/8 resume planned, did not happen.
- **Calliope (Klatch) PO advice-on-working-with-xian reply** — outside original window. Tracking only.

**Dropped this pass (resolved):**
- *PM M2f pre-remediation gate* — Run 7 PASS=68.9% exceeds Apr 12 baseline; CEO criterion met; audit-cascade unblocked.
- *Usage CSV reconciliation (22-day carry)* — committed yesterday (Apr 25/28 + May 2/5 snapshots structured in).
- *Janus activity-log catch-up* — Mar 31→May 9 landed (267 rows; PM canonical from Docs CSV; Klatch preliminary pending Calliope reply).

## Cross-Project Intelligence

Dispatch's `cross-pollination-current-week.md` is **6 days stale** (mtime May 4, covers Apr 27–May 3). Skipped per >2-day rule.

Today's dinp Janus brief is fresh and substantive. Three portable insights worth lifting:

- **Pattern-067 (Issue-Body Reality Mismatch)**: Phase 0 dead-code/unreachable check on issue bodies matching trigger language ("TODO to enable X", "lost on restart", line-number citations from N-month-old triage runs, parenthetical alternatives in acceptance criteria). PM saved ~−2,229 LOC by *not* implementing nobody's features. Klatch should adopt for any old-triage issue.
- **Eval-rubric symmetry audit**: PASS/MARGINAL criteria stricter than FAIL on the same scale → mid-quality responses fall into scoring limbo and accumulate as FAILs. PM Run 6 closed this gap (PASS = total ≥ 7; MARGINAL = total ∈ {5,6}). Worth checking Klatch's Argus harness if the rubric has the same shape.
- **Mail-on-main + Active Stewardship**: DinP CLAUDE.md's two new rules — mail bypasses branch isolation (lands on main directly so the other agent can read it); agents propose own Layer-5 refinements at session tidy-up rather than waiting for xian to drive. Both transferable to Klatch's Daedalus/Mnemosyne for multi-agent coordination.
