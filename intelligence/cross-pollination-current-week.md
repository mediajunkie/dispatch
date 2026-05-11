# Current Week Intelligence Brief: May 4–10, 2026

**For:** In-session context (paste into chat as knowledge base)

---

## This Week at a Glance

The week's arc runs from sprint surge to sprint gate: M2d completed in one session (May 3 Sunday, 8 issues, 221+ tests), M2e launched the same day and closed out Thursday, then M2f opened — but blocked immediately on a quality-regression investigation that had to clear before audit-cascade could proceed. By Saturday, the gate was cleared (Run 7 at 68.9% PASS), M2f Group A+B shipped, and −2,229 LOC was removed via dead-code deletion rather than migration. Two operating disciplines reached codification this week: audit-cascade as a mandatory pre-implementation gate (now validated by three independent catching events) and multi-agent git collision prevention (evolved from incident pattern to four specific mitigations now embedded in hub CLAUDE.md). Klatch had no session activity for the full seven days; its open items — SDK 6 versions behind, Iris walkthrough Surfaces 3–8, June 15 deprecation DB audit — all remain untouched.

---

## Key Discoveries

**Pre-work investment eliminates implementation-phase discovery.** The week's sharpest velocity signal: #1052's persistence layer (22 tests, shipped May 4 evening) made #900 mechanical. Actual wall-clock: 2 hours vs. 12–14 hour estimate. Lead Dev's analysis — Phase 1's state-machine design made downstream phases mechanical, and #1052 had already solved everything Phase 4 needed before Phase 4 code ran. Same pattern was validated in M2e: #1042's RepoResolver cleanup (220 LOC, 4-level cascade, 14 hardcoded literals removed) ran first because it was a dependency; the three INTENT-COVERAGE issues shipped cleanly in sequence behind it. The discipline is: file the pre-work as a standalone ticket, ship it first, then execute the main issue.

**Audit-cascade caught three blocking gaps before implementation ran.** Three distinct incidents, same family: (1) StandupConversation persistence was a module-level singleton dict — lost on restart — caught during #900 gameplan refresh before any code; (2) 12 M2d issues shipped without GitHub state-transition; caught Monday morning, retroactively corrected; (3) M2f Group A+B Phase 0 investigations found 3 of 5 issues describing dead or unreachable code — #936's UserService had zero production callsites, #935's INSERT gate never fired, #933's bypass had outlasted its reason by 6 months. Without Phase 0, all three would have been implemented as written. Pattern-067 (Issue-Body Reality Mismatch) filed Emerging by Lead Dev: *trigger conditions: "TODO to enable X," "lost on restart," line-number citations from triage runs N months ago.*

**Multi-agent git collision discipline reached CLAUDE.md.** Four technical findings across the week, each adding precision to the earlier "commit-per-functional-unit" mitigation: (1) commit after each functional unit, not at phase boundary — minimizes loss when collision happens; (2) subagent deployment requires `git worktree add` or commit-before-deploy — `git checkout <branch>` in a shared `.git` flips HEAD for the deploying agent; (3) `&&`-chain verification doesn't gate — `git branch --show-current` exits 0 regardless of output, so `git branch --show-current && git commit` commits even on the wrong branch; (4) pre-commit gated check (`[ "$(git branch --show-current)" = "main" ]`) caught a mid-#932 collision with exit 1, preventing a bad commit. The PreCompact hook (#86) shipped Friday as the third automated layer: three git checks (uncommitted changes, unpushed commits, commits ahead of origin/main), warn-only, fires before context compaction.

**M2f quality regression was judge miscalibration and fixture pollution — not fabrication.** Run 4's apparent regression from 72.1% to 65.6% (9% drop) triggered a CEO P0 investigation. Lead Dev's findings: 0 of 10 auto-fails were pure LLM fabrication; 7 were judge-calibration or fixture artifacts. Smoking gun: Q56 "show my todos" flagged as fabrication — the test user had 15 real todos accumulated from prior retest runs executing Q53/Q54 mutations without cleanup. Rubric gap also found: PASS/MARGINAL criteria required "no zeros" while FAIL only fired on 2+ zeros — single-zero responses defaulted to FAIL. Three narrow bug fixes shipped (#1065 hardcoded setup-wizard references, #1066 `#N` slot-fill regex, #1067 subsumption filter). Run 7 result: 68.9% PASS (+5.0 vs Run 6), exceeding Apr 12 baseline. CEO gate criterion met; M2f audit-cascade unblocked.

**Pattern-062 family fully Proven; Pattern-067 filed Emerging.** CIO promoted Patterns-063 (Parallel-Authoring Drift), -064 (Extension Without Integration), and -065 (Continuity Memo Before the Seam) from Emerging to Proven in a single session — the 062 architectural-debt family is now complete. Pattern-064's reference instance closed this week: #1055 removed the `KnowledgeGraphService` alive scaffolding and the legacy `boundary_enforcer.py` (−1,518 LOC, all 112 ethics tests pass) — the first substantial PM cleanup directly attributable to a pattern diagnosis. Pattern-067 joins the library at Emerging: the Issue-Body Reality Mismatch shape, validated by M2f Group A+B's −2,229 LOC deletion result.

**#1053 subagent arc validated "annotation not improvisation" as the correct scoping behavior.** The test-migration subagent deployed Thursday and found Phase 2 over-scoped — 12 tests already passing, no migration needed. Behavior: annotated the discrepancy in a commit message ("annotate test_standup_routing_585.py rationale — no migration needed"), did not improvise. 12 stale tests (#1063) discovered and filed with consistent skip rationale; Lead Dev rewrote them the next session in 15 minutes. The arc (staged gameplan → subagent annotates discrepancy → next-session cleanup) operated cleanly end-to-end. The 16-check post-execution audit matrix committed to the repo before merge is now the reference format.

**Three publications shipped; Ship #041 is the largest to date.** "Six Issues Before Dinner" (Medium, Tuesday), Ship #041 "The Methodology Closes Its Own Loops" (canonical + LinkedIn, Wednesday — 27,716 chars HTML, largest Ship to date), and "A Hail of Memos" (pipermorgan.ai, Thursday). Docs fact-check caught a Haiku 3 retirement timing inaccuracy in "Six Issues Before Dinner" before publish. Footer-tease rule encoded in memory. Three active tracks (Ship newsletters, Building Piper Morgan narrative, insight posts) are now operating in steady cadence.

---

## What PM Should Know

- **M2f is unblocked.** Run 7 at 68.9% PASS exceeds Apr 12 baseline; CEO gate criterion met. M2f Group A+B complete. M2f Group C is the next execution unit.
- **Pre-M2f remediation is complete.** Fixture reset baked in; rubric recalibration memo distributed to CXO+PPM (PM authorized "proceed without sign-off"); 3 bug fixes shipped; discovered work filed (#1068 milestone routing failures, #1069 templated attention_query, #1070 multi-turn eval harness).
- **Pattern-067 (Issue-Body Reality Mismatch) is actionable now.** Before any M2f Group C or M2g gameplan: run a Phase 0 dead-code check on any issue body with "TODO to enable," "lost on restart," or stale line-number citations. The cost is 30 minutes; the M2f Group A+B experience shows the alternative is implementing features nobody can reach.
- **#1058 agent-prompt-template hygiene review is filed.** Trigger: audit-cascade audit prep for #1053 generated 6 N/A flags in one pass, signaling template drift. N/A count ≥5 in a single audit = the template is worth reviewing for that issue class, independent of whether the audit passed.
- **Notion Phase -1 investigation (#1059) filed.** Actual codebase: 1,504 LOC (up 35% from Aug 2025 estimate of 1,112). #304 sub-epic placement gated on the Phase -1 memo. PM ratified: Notion IS in alpha scope.
- **#1047 M2D-UAT is open (P3).** One-agent, one-sitting UAT pass targeting the UI issues from the M2d sprint. Deferred browser smoke for #704, #714, #1030–#1033, #1035. Produces a `dev/YYYY/MM/DD/m2d-uat-report.md`.
- **Hub CLAUDE.md updated.** Multi-Agent Operation subsection (mail-on-main rule, branch hygiene, lightweight concurrent-operation discipline) and Janus Layer 5 expansion (4 named working areas, Active Stewardship principle) committed Saturday.

---

## What Klatch Should Know

- **No session activity this week.** All open items from last week's digest remain unchanged. The items below are updates from PM that are cross-relevant; none require Klatch action until sessions resume.
- **June 15 SDK deprecation: 35 days.** DB audit for live channels pinned to literal model IDs (`claude-sonnet-4`, `claude-opus-4`) is overdue since April 29. SDK at `^0.86.1` — target should now be `^0.92.0` (0.92.0 released May 1), not 0.90.0. Batch with Hono dep-maintenance window.
- **Iris walkthrough Surfaces 3–8 + Pass 2 still pending.** No progress this week.
- **Multi-agent git collision discipline — four specific findings to absorb.** The &&-chain gating gap and the worktree-required-for-subagents findings are new precision beyond what was in last week's digest. For any Klatch multi-agent or subagent deployment: pre-commit check must be gated form (`[ "$(git branch --show-current)" = "main" ]`), not inline `&&` prefix. Subagents that run `git checkout` require a dedicated worktree or pre-deploy commit of all foreground work.
- **RepoResolver 4-level decision-tree (#1042)** is directly applicable to any Klatch capability that needs to resolve an implicit target at runtime. The cascade (explicit arg → user preference → env var → error) cleanly separates "what the user said" from "what we infer." Negative-test patterns in #1040's pre-classifier (explicitly testing that `label this as urgent` does NOT route to `list_labels_query`) are worth adding to AAXT for any capability whose routing vocabulary overlaps with conversational English.
- **Eval harness findings for Argus.** Two structural findings from #1064: (1) add explicit fixture teardown per eval run — DB mutations from one run contaminate the next and produce repetition patterns that look like hallucination; (2) audit rubric symmetry — if FAIL fires on 2+ zeros but PASS requires "no zeros," single-zero responses fall into a scoring limbo and FAIL even when overall quality is marginal. Both are directly applicable to the AAXT eval harness.
- **Pattern-064 (Extension Without Integration)** is now Proven. The "alive scaffolding" framing — code that exists, has structure, but is not integrated or reachable — applies to any Klatch subsystem with partial implementations. The promotion process (≥3 surface validations before Emerging→Proven) is worth borrowing if Argus tracks emerging diagnostic patterns.

---

## For Both Teams

**"Persistence-first" is now a validated velocity pattern, not just a principle.** The #1052→#900 sequence produced a 7× wall-clock speedup (2h vs. 12–14h) because data-layer pre-work eliminated the discovery-mid-implementation delay that costs the most time. The discipline: when any issue has a data-layer dependency, file the persistence pre-work as a standalone ticket with its own tests and ship it first. This applies equally to Klatch issues involving storage, session state, or cross-session recall.

**Issue bodies drift from reality silently.** Three this week described code that no longer existed, bypass conditions that had already been resolved, or features with zero reachable callsites. The Pattern-067 trigger-condition language is the fast diagnostic: "TODO to enable X," "lost on restart," line-number citations from triage runs more than 90 days ago. A Phase 0 check before any gameplan takes 30 minutes; the alternative — discovering the gap mid-implementation — costs a full session and leaves the issue body wrong in perpetuity.

**Audit telemetry needs rubric symmetry from day one.** PM's judge miscalibration this week (single-dimension zero → FAIL even when total score was marginal) compounded with fixture pollution to produce a 9% apparent regression that wasn't real. Both teams running eval harnesses: (1) define PASS, MARGINAL, and FAIL bands on the same scale with no scoring limbo between them; (2) treat DB-mutating test steps as requiring explicit cleanup. Retrofitting these after operators are relying on the audit shape is the harder path.

---

## Status Flags

**Piper Morgan:**
- M2d complete: 8 issues, 221+ tests ✅
- M2e complete: RepoResolver (#1042), milestones/releases (#1039), labels/branches (#1040), CLAUDE_OPUS repoint (#1027), tabs (#869 Phase 1), StandupConversation persistence (#1052 Phases 1+2), standup 3-part flow (#900), Project Config IA (#869), Architect cleanup (#1055 −1,518 LOC) ✅
- M2f Group A+B complete: −2,229 LOC via dead-code deletion ✅; Group C pending
- Run 7 baseline: 68.9% PASS — exceeds Apr 12 baseline; M2f audit-cascade unblocked ✅
- Pattern 062 family: all four (062/063/064/065) Proven ✅; Pattern-067 Emerging
- PreCompact hook (#86) live ✅
- Architect's 5-item soundness punch list: fully closed ✅
- #1047 M2D-UAT: open, P3, not yet executed
- #1058 agent-prompt-template hygiene: filed, pending execution
- #1059 Notion Phase -1 investigation: filed, pending memo
- #1063 stale standup tests: resolved (12 skips → 0 skips) ✅
- Ship #041, "Six Issues Before Dinner," "A Hail of Memos": all published ✅
- ADR-061: verbal ratification recorded; formal paperwork pending

**Klatch:**
- No session activity this week
- UX walkthrough: Surfaces 1–2 documented (12 findings); **Surfaces 3–8 + Pass 2 pending**
- MAXT round-trip testing: queued after walkthrough
- **June 15 SDK deprecation: 35 days — DB audit for literal model ID pins overdue**
- SDK: `^0.86.1` → target `^0.92.0` (was 0.90.0; 0.92.0 released May 1)
- Calliope PO calibration response: overdue (window was 5–7 days from April 26)

**Cross-pollination:**
- 9 repos in constellation (primary: Klatch, PM, hub; secondary: 6 repos fast-checked daily)
- 7 delivery readers
- All four trigger configs confirmed stable with `allow_unrestricted_git_push: true`
