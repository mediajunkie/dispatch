# Current Week Intelligence Brief: April 1–3, 2026

**For:** In-session context (paste into chat as knowledge base)

## This Week at a Glance

Klatch completed its faoilean migration (3 of 4 Code agents moved April 1, Argus off CCR cloud, all local+remote control established) and then immediately entered its densest feature sprint: Daedalus shipped the full File Domain Model Phases 1-5 across three sessions, completing structured context injection at both L3 and L4 with file promotion. Argus stabilized the test suite at 808 tests with zero failures, writing 47 new FDM-specific tests. Calliope shipped two blog posts, delivered Klatch's RFC-001 response with four proposed amendments (notably the L5a/L5b sub-component split), published a nomenclature guide resolving the "system prompt" collision, and scoped MAXT Session 02 around L4 injection fidelity. On the PM side, Piper Alpha formalized a three-phase daily check-in flow that explicitly builds on cross-pollination infrastructure as a dependency, produced a backlog review surfacing 89 open MVP issues targeting May 27, and circulated Vision V2 to CXO and PPM. Both RFC-001 responses are now filed (Klatch + PM), converging on the same recommendations. Usage limits hit mid-session across both projects — a shared friction point as per-session output density increases.

## Key Discoveries

**Klatch Migration Completed (Apr 1):** Three of four Code agents (Calliope, Daedalus, Argus) migrated from CCR cloud to faoilean in a single day, with Argus notably moving off cloud entirely. All agents now operate with local+remote control. Theseus migration deferred to April 2. The migration was infrastructure-heavy but enabled the dense feature work that followed immediately.

**File Domain Model Phases 1-5 — Full Structured Context Injection (Apr 1-3):** Daedalus shipped the complete FDM scope in three sessions. Phase 1: new `files` and `file_refs` tables with pointer-based scope architecture. Phase 2: channel file pinning with L4 addendum injection. Phase 3: project knowledge base with L3 context injection. Phase 4: dual-write completion across all file creation paths. Phase 5: file promotion (message -> channel -> project). This is the first concrete implementation of "make Layer 4 richer" — the shared gap both projects identified in their RFC-001 responses. The pointer-based architecture proved its value: adding new scopes required only new endpoints and one-line additions to `buildSystemPrompt`.

**RFC-001 Bilateral Mapping Complete (Apr 1-2):** Calliope filed Klatch's RFC-001 response, completing the bilateral loop. Four amendments proposed: (1) L5 sub-component split into L5a (declarative text — transfers) and L5b (procedural calibration — doesn't transfer), (2) L3 freshness signal for weighting stale vs. current context, (3) fidelity assessment protocol formalizing AAXT + MAXT, (4) explicit agent-team vs. product distinction. PM's earlier response converges on the same recommendations. Dispatch now has material for RFC-001 v2.

**Janus RFC-001 Response Filed (Apr 1):** Janus delivered its own RFC-001 response from the designinproduct perspective, completing a three-project response set.

**Nomenclature Resolved (Apr 1):** Klatch published `docs/NOMENCLATURE.md` — the Rosetta Stone for cross-project vocabulary. L4 is now "Channel context" in Klatch UI, L5 is "Role prompt." Phase 1 (UI label renames) shipped immediately. The guide maps terminology across Claude Code, Claude.ai, Cowork, and RFC-001.

**808 Tests, Zero Failures (Apr 1-3):** Argus executed Round 13 (infrastructure cleanup, 761 tests, zero failures from any entry point), Round 14 (31 new FDM tests), and Round 15 (16 more FDM tests), reaching 808 total with zero failures. Pre-existing failure masking problem fully resolved. The methodology principle: pre-existing failures mask real regressions and must be fixed before the suite can be trusted.

**Daily Check-In Flow Formalizes Cross-Pollination Consumption (Apr 2):** PA drafted a three-phase morning flow: Dispatch automated sweep -> PA orientation -> Docs synthesis. The design explicitly names the cross-pollination brief as the shared intelligence channel. This is the first PM operational document that treats cross-pollination infrastructure as a dependency rather than a nice-to-have.

**Backlog Review: 89 Open MVP Issues Targeting May 27 (Apr 2):** PA's first backlog review maps 119 open issues across 4 milestones. The MVP milestone carries 89 issues — mitigated by ~30 likely Fast Follow candidates and ~15 WIRE stubs. The cross-relevant methodology insight: discovery expansion (M0 expanded 5->27, M1 similar) is a pattern, not an anomaly. Future estimates for agent-driven work should assume 3-5x the originally scoped issues.

**Usage Limits as Shared Friction (Apr 2-3):** Both Daedalus and PM's Docs agent hit usage limits mid-session. Daedalus: 11:40-12:53 gap. PM: 11:50 AM - ~7:16 PM gap. As both projects increase per-session output density, this constraint will tighten.

## What Piper Morgan Should Know

- RFC-001 bilateral mapping is complete. Klatch's response proposes four amendments that converge with PM's recommendations. The L5a/L5b sub-component split (declarative vs. procedural calibration) is new and directly addresses PM's observation that agents rebuild behavioral calibration from scratch each session. Dispatch has both responses for synthesis into RFC-001 v2.
- Klatch's File Domain Model is now proven across L3 and L4 with full promotion. The pointer-based scope architecture (canonical file + scope references + per-layer injection) is a tested template for when PM addresses its own L4 persistence gap (session context in a Python dict that dies on restart).
- Nomenclature guide is published. PM has no formal L4/L5 terminology yet. "Channel context" (L4) and "Role prompt" (L5) are Klatch's labels; RFC-001 uses "Delivery Context" and "Role Identity." Adopting consistent vocabulary would help cross-project communication.
- Verify no Haiku 3 model IDs in PM's codebase before April 19 retirement. Verify no 1M context beta headers before April 30 retirement. Argus confirmed Klatch is clean on both.
- Discovery expansion pattern (3-5x original scope) is now documented across two PM milestones. Factor into any remaining MVP scope estimates.
- MAXT Session 02 will test L4 injection fidelity — whether agents can *use* pinned file knowledge, not just have it structurally present. PM's E2E/AAXT track (#927-930) should consider the AAXT/MAXT split: automated tests for structural correctness, qualitative sessions for behavioral fidelity.

## What Klatch Should Know

- PM's daily check-in flow formalizes cross-pollination consumption as a dependency. The delivery mechanism is working as designed on both ends. No changes needed to the brief generation or delivery process.
- PM's backlog review surfaces the discovery expansion pattern — 3-5x original scope during execution. When Klatch plans Steps 10-11 (memory-as-file, entity library), factor this in.
- PA's floor/ceiling framing from Vision V2 applies to MAXT Session 02 scope: floor = agent handles it natively with well-assembled five-layer context; ceiling = requires Klatch-specific infrastructure. The categories map to testable AXT assertions.
- PM's stranded branch audit (PA Day 3) found 2 branches with unmerged commits from migration-day velocity. COORDINATION.md handles assignment tracking but doesn't include periodic stranded work audits. Consider adding as Klatch's agent team grows.
- Metis (Klatch) and Piper Alpha (PM) are convergent roles — both emerged independently after teams exceeded 3-4 active roles, both serve the same function: operational awareness as a first-class agent responsibility. The convergence is structural, not coincidental.

## For Both Teams

- **RFC-001 is approaching ratification.** Both projects have filed formal responses with converging recommendations. The L5 sub-component split (declarative/procedural) is the most novel contribution, emerging from the intersection of MAXT findings and PM's behavioral calibration observations. Dispatch has the material for an RFC-001 v2 draft.
- **The File Domain Model is the fastest multi-phase feature in Klatch's history.** Phases 1-5 shipped across three sessions (April 1-3). Each phase was a minimal working increment tested before the next began. The pace validates the pointer-based architecture — adding a new scope required only new endpoints and a one-line `buildSystemPrompt` addition. Gall's Law applied to feature planning.
- **Both projects are developing meta-operational agent roles.** PM has Piper Alpha (session coordination, log hygiene, briefing delivery). Klatch now has Metis (cross-environment coordination, knowledge stewardship). Both emerged independently, both added after exceeding 3-4 active roles, both serve the same function: watching the team's operational state so the PM doesn't have to carry it all in working memory.
- **Usage limits are emerging as a shared productivity constraint.** Both projects hit limits mid-session in this window. These are environmental friction, not bugs. As per-session output density increases, the constraint tightens. Worth tracking as a systemic factor.
- **The five-layer model continues earning its keep in new domains.** This week: diagnostic tool (RFC-001 bilateral mapping), implementation guide (FDM structured injection at L3/L4), vocabulary framework (nomenclature resolution), fidelity testing framework (MAXT Session 02 scoped around L4). The model is graduating from descriptive to prescriptive.

## Status Flags

- **Klatch active and dense:** FDM Phases 1-5 complete. 808 tests, zero failures. RFC-001 response filed. Nomenclature resolved. MAXT Session 02 scoped (L4 injection fidelity). Metis (coordination agent) added to registry. Theseus migration pending (deferred from Apr 1). Phases 6-7 (memory-as-file, entity library) deferred to Steps 10-11.
- **Piper Morgan consolidating:** PA daily check-in flow drafted. Backlog review complete (89 MVP issues, May 27 target). Vision V2 circulated to CXO + PPM. 12/15 quarterly maintenance items done. Blog active ("The Floor That Wasn't" published). HOST rename (HOSR -> HOST) complete.
- **kindsys migration deadline passed (Apr 3):** Klatch agents done. PM agents (CoS + Lead Dev) status needs verification.
- **kindsys downgrade to Pro (Apr 4):** Extra usage already stopped. Confirm nothing critical depends on 5x Max limits.
- **Haiku 3 retirement (Apr 19):** Klatch verified clean. PM needs verification.
- **1M context beta header retirement (Apr 30):** Klatch verified clean. PM needs verification.
- **mediajunkie cancellation (Apr 15):** Final walkthrough still pending.
- **PM Chat Project upload still pending:** knowledge-final set (465 files, 4.7 MB) staged since March 28. Now 4+ days.
- **Cross-pollination loop:** Active. Briefs generating daily. PM consumption now formalized via PA daily check-in flow.
