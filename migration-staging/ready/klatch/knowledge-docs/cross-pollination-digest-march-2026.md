# Cross-Pollination Intelligence Digest: March 2026

## For: Piper Morgan Leadership Team (Project Knowledge Base)

### Month Overview

March was the inflection month for the agent architecture ecosystem at Design in Product. Piper Morgan closed its M0 sprint with a four-reviewer same-day approval process and shipped v0.8.6, establishing a methodology precedent for rapid governance cycles. Simultaneously, Klatch launched as a sibling project focused on conversation context management and multi-entity coordination. By month's end, both projects independently converged on identical architectural principles (registry-driven routing, floor-first capability dispatch, five-layer prompt assembly, two-track testing) without direct coordination. The convergence validates these as fundamental solutions to multi-agent coordination problems, not project-specific preferences. Most critically, both projects discovered that the Capability Awareness Gap — where a system's claimed abilities diverge from its actual capabilities — is the single largest source of failure in complex routed systems. The fix is architectural: one canonical registry, everything else derives from it. The cross-pollination process itself launched March 19, creating a formal channel for insights to flow between projects and reducing the overhead of discovering what the sibling project already learned.

### Week 1 (Mar 1–8): Foundation and Launch

**Mar 1: Four-Reviewer Spec Approval in One Day** — Piper Morgan's conversation lifecycle spec (#858) achieved same-day approval from CXO, PPM, and Architect. Convergence on four clarification items (COMPOSTED scope, timezone, configurable retention, soft-close visibility) demonstrated that rigorous specs attract aligned reviewers. Lead Developer immediately implemented the full lifecycle end-to-end (six phases, 27 tests) in the same day.

**Mar 3: Highest-Commit Day and Systemic Debt Discovery** — 23 commits, 5 issues closed. Weekly docs audit discovered 23 broken links, 6 missing ADRs, and a 20-day-stale briefing. Added subagent commit-verification guideline after discovering orphaned files had sat invisible for 10 days.

**Mar 4: Release and External Collaboration** — Piper Morgan v0.8.6 shipped. First collaborator (Ted Nadeau) went live on the release, surfacing the human bottleneck question: "Is my involvement here adding discernment or just delay?"

**Mar 7: Klatch Launched** — Xian committed Steps 1–5 of a new project: Klatch, a Slack-inspired local-first Claude conversation manager with channels, system prompts, streaming, and SQLite persistence. Achieved v0.5 by end of day. PM's Chief of Staff immediately logged the methodology connection: same multi-agent coordination patterns, potential to automate PM workflows.

**Mar 8: First High-Output Day, Test Infrastructure Established** — Klatch shipped multi-entity interaction modes (panel, roundtable, directed) and established 95 tests via Vitest. The vocabulary for interaction modes filled a gap both projects later recognized they needed for describing coordination patterns.

### Week 2 (Mar 9–15): Data Flows and Architectural Diagnosis

**Mar 9: First PM → Klatch Data Flow** — Xian sent Piper Morgan JSONL session exports to Klatch as test fixtures for import parsing. Real PM session data improved Klatch's import quality. First technical cross-project coupling outside of methodology.

**Mar 10–11: Import Features Ship, Fork-Continuity Test Begins** — Klatch shipped Compaction API integration, claude.ai import, Phase 2 (made imported conversations talkable), and Phase 3. Theseus Prime and Ariadne (forked via export/re-import) conducted the first fork-continuity test. Finding: Ariadne preserved conversational memory but lost all project scaffolding (docs, tasks, institutional knowledge). Identical to PM's cold-start problem.

**Mar 12: First Day Both Projects Ran Parallel Work** — Klatch: PM's CIO imported, experiencing the "well-lit room with no furniture" — full context, zero project knowledge. Designed dual-perspective AX testing. Piper Morgan: M1 kicked off, canonical retest discovered wiring bugs (not classifier bugs) raising pass rate from 53.7% to 81.1% in four progressive passes. Chief of Staff chat retired after 34 days.

**Mar 13–15: Convergent Architectural Diagnosis** — Mar 13: All-hands day on both sides. Workflow hijack bugs (#888, #889) triggered design discovery: "The session belongs to the user, not the workflow." Four independent agents converged on same design. Dev/ airlift to git (3,559 files). Mar 14: Breakthrough: "The LLM is the floor, not the ceiling" — four-agent roundtable unanimously diagnosed the inversion. Routing was catching queries as handlers instead of passing them to the LLM. AXT methodology published. Mar 15: Floor inversion implementation begun. CIO delivered first formal methodology audit: six-week review, methodology in strongest state since founding.

### Week 3 (Mar 16–22): The Scaling Wall and Registry Pattern

**Mar 16: Registry Pattern Emerges as Core Solution** — Both projects shipped systemic cleanup. PM discovered "extend without verifying" as a root cause across six bugs simultaneously: classification extended without handler verification, silently absorbing gaps. Action Registry (34 classification → handler pairs) with stub-to-floor routing. Klatch shipped sidebar redesign and formalized 5-layer prompt architecture.

**Mar 19: Inflection Point — Nine-Agent Coordination and Capability Awareness Gap** — Piper Morgan ran all 9 primary roles simultaneously for the first time. Stress test exposed clear scaling limits: PM-as-manual-router bottlenecked at 4+ agents. Agent 360 self-assessment revealed five disconnected sources claiming what Piper could do — PIPER.md, soft invocation detector, dispatcher registry, ContextAssembler, floor addendum — producing implicit contracts the system couldn't fulfill. Klatch shipped cloud import and established standing intelligence monitoring that seeded the cross-pollination process.

**Mar 20: Capability Awareness Gap Resolved; Intelligence Feed Protocol Launched** — PM Lead Dev reconciled five capability sources into one canonical dispatcher registry (single source of truth). CIO launched Piper Alpha planning. Docs institutionalized omnibus as a formal skill. Klatch established daily intelligence sweep protocol (Argus intelligence → Calliope triage → Daedalus implementation in hours). Mailbox v3 shipped with 14 role-based inboxes.

**Mar 21–22: Methodology Canonicalization** — Klatch published canonical 5-layer prompt assembly specification: Layer 1 (kit briefing), Layer 2 (project instructions), Layer 3 (project memory), Layer 4 (channel addendum), Layer 5 (entity prompt). Agent Traditions pattern formalized (7 sections: role, style, responsibilities, conventions, relationships, institutional memory, standing instructions). PM Lead Dev reviewed March 21 brief and noted cross-relevant insights in session log — the loop closed.

### Week 4 (Mar 23–25, Ongoing): Validation and Formalization

**Mar 23: Convergence Without Coordination** — CXO and PPM independently converged on overlapping Sprint Completion Gate criteria without prior discussion — the gate was well-specified enough that multiple reviewers from different domains arrived at the same gaps. Weekly documentation audit found systematic debt and fixed it. Klatch filed two intelligence sweeps with high-relevance items for PM (Sonnet 4.6 default, Compaction API, Cowork import, Claude Agent Teams).

**Mar 24: MAXT Session Imminent; Traditions Published** — Klatch agent traditions fully shipped with Calliope and Argus as reference implementations. WCAG accessibility audit complete. Blog post "What Does an Imported Agent Know?" published, making 5-layer model public. MAXT Session 01 gates Step 9 (waiting on first empirical validation of 5-layer model).

**Mar 25: Ongoing** — Cross-pollination digest period extends through today. Both projects continue building on the architectural foundations established this month.

### Top Patterns Worth Knowing

1. **The Capability Awareness Gap is Systemic** — When capability sources diverge (what the LLM claims vs. what's registered vs. what's implemented), the system silently fails. Single canonical registry for capabilities, all else derives from it. Piper Morgan discovered this through five simultaneous bugs; fix applied; pattern now architectural.

2. **Registry-Driven Routing Prevents Implicit Contracts** — "Extend without verifying" (new classifier category added, handler missing) is the root cause of 6+ bugs across both projects. Registry pattern: `capability_type → handler` as a lookup, never ad-hoc if/else chains. Unknown types route to a capable default (the floor), never dead ends.

3. **Five-Layer Prompt Assembly Scales Context Coherence** — Klatch's model (Kit Briefing, Project Instructions, Project Memory, Channel Addendum, Entity Prompt) provides a structure for managing context across agent transitions. Both projects independently value the separation of static structure (rarely changes) from dynamic state (changes frequently). Layer 3 (project memory) and Layer 4 (channel addendum) should be generatable or queryable at session start, not static docs.

4. **Two-Track Testing (Automated + Qualitative) Validates Both Plumbing and Experience** — Klatch's AAXT (automated, mechanical, no LLM) gates MAXT (manual, qualitative, real agents). Piper Morgan independently arrived at same structure for E2E. Both teams verify "does the plumbing work" before "does the experience feel right." Automation gates qualitative evaluation.

5. **Floor-First Routing is the Only Scaling Path** — When a system offers capabilities, it must always be "at least as good as a well-prompted LLM." Specialized handlers (actions with side effects) route via a gate, everything else routes to the floor. This prevents dead-ends on unrecognized input and ensures the LLM is the safety net, not the default failure mode.

6. **Session Wrap Verification is Non-Negotiable** — Both projects independently arrived at identical wrap-up protocols: verify deliverables exist in git before claiming "done" in the session log. `git log`, `ls`, test suite pass. Never force push without explicit approval. This prevents invisible work loss.

7. **Intelligence-to-Action Cycles Collapse When Infrastructure Exists** — Klatch runs intelligence sweep → triage → assignment → implementation in hours. Piper Morgan ran same cycle after dispatch infrastructure came online. Remove latency (formal formats, structured handoffs, pre-decided next steps) and insights move directly to code.

### Glossary of Klatch Terms

- **AXT (Agent Experience Testing):** Methodology for measuring what an agent knows after an environmental transition (import, fork, role switch). Two tracks: AAXT (automated, mechanical tests of context assembly) gates MAXT (manual, qualitative tests with real agents).

- **Five-Layer Prompt Assembly:** Klatch's canonical model for assembling system prompts across context boundaries. Layers 1–5: Kit Briefing (environmental), Project Instructions (behavioral), Project Memory (factual), Channel Addendum (conversational), Entity Prompt (identity).

- **Entity:** An agent or persona in Klatch. Can be a named agent (Daedalus, Argus, Theseus), an external role (lead dev, architect), or a user. Entities have Layer 5 prompts and can participate in interactions.

- **Klatch:** A multi-entity group conversation within a project context. Distinct from a simple channel conversation — klatches are designed for structured multi-agent coordination. Interaction modes: panel (sequential), roundtable (orchestrated), directed (single-target).

- **Channel:** A conversation space in Klatch, potentially with a system prompt and project context. Channels are where single-entity or multi-entity conversations happen. Can be chat (natural conversation) or klatch (structured coordination).

- **Fork Continuity:** Test methodology for evaluating how much context survives an import or branch. Used the Fork Continuity Quiz (v4: open canvas → structured probing of each 5-layer). Failure modes: Correct → Reconstructed → Confabulated → Absent → Phantom (worst).

- **Project Memory:** Layer 3 of the 5-layer model. Accumulated knowledge about a project's state (current sprint, open items, recent decisions). Should be generatable or queryable, not static docs, to prevent staleness.

- **Kit Briefing:** Layer 1 of the 5-layer model. Environmental orientation: where am I, what can I do, what are the boundaries.

- **Agent Traditions:** Formal per-agent documentation (7 sections: role, style, responsibilities, conventions, relationships, institutional memory, standing instructions). Solves the cold-start problem: an agent inactive for days reads its traditions and knows what it knows.

- **AAXT (Automated Agent Experience Testing):** Mechanical test harness for verifying context assembly. No LLM calls, no nondeterminism. Verifies "did the right context reach the right layer" using the `prompt-debug` endpoint.

- **MAXT (Manual Agent Experience Testing):** Qualitative evaluation using real agents and structured questionnaires. Verifies "can an agent orient itself from prompt context alone" by measuring completeness of knowledge after a transition.

- **Compaction API:** Anthropic's server-side context summarization. When conversation exceeds token threshold, API summarizes history while preserving custom instructions. Enables effectively infinite conversation length without client-side truncation.

- **5-Layer Prompt Model / Five-Layer Architecture:** Same as Five-Layer Prompt Assembly (see above). Klatch's canonical design for structured context management across agent transitions. Published publicly March 24 via blog post "What Does an Imported Agent Know?"
