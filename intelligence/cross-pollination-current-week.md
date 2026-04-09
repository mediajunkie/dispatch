# Current Week Intelligence Brief: April 3–9, 2026

**For:** In-session context (paste into chat as knowledge base)

## This Week at a Glance

The week's arc ran from failure to breakthrough — with a strategic pivot in the middle that changed what the breakthrough meant. PM's M1 gate UAT failed on April 3 (Pattern-045 confirmed at scale), triggering a five-day root cause hunt that turned out to have three nested layers: deprecated model IDs, a mis-wired provider config, and a message-field mismatch in FloorContext that was the actual culprit. The gate finally cleared April 8. Simultaneously, PM crystallized "methodology over code" as its core differentiator, restructured its roadmap (v14.3 → v15.0), and reframed its entire distribution strategy around "Bring Your Own Chat" — shipping as an MCP server that appears inside whatever AI client the user already has. Klatch, meanwhile, shipped AAXT Scaffolded Probing Phase 1 (automating the test gap Pattern-045 fell through), onboarded Iris as its first dedicated UX agent, and produced the clearest articulation yet of Layer 4's value: channel-as-workflow. The week closed with two deferred items carrying forward (Klatch v0.9.0 release, MAXT Session 02) and one structural insight converging across both projects independently: Layer 5 portability is the hardest unsolved problem in the shared model.

---

## Key Discoveries

**Pattern-045 Confirmed at M1 Gate (Apr 3):** PM and CXO ran a fresh-account UAT against v0.8.6 and stopped early — 0 of 7 queries passed the Colleague Test, todo completion non-functional despite 23 passing tests. Pattern-045: green tests, red user. Root cause was not found immediately. What followed was a five-day diagnostic chain across three layers: (1) `gpt-4-turbo-preview` deprecated by OpenAI → 404 on every LLM classification call; (2) setup wizard stored provider choice but `LLMClient.complete()` never read it; (3) the actual root cause — pre-classifier stored user message in `intent.context['original_message']` while FloorContext read from `intent.original_message` (always empty for pre-classified intents), so the floor received an empty message and generated generic greetings. Additionally, IDENTITY queries routed to canned templates scoring 1/3 on the Colleague Test. All four issues fixed by April 8; 6,309 tests passing, gate cleared.

**AAXT Scaffolded Probing Phase 1 Shipped (Apr 4–5):** Daedalus + Argus shipped the automation bridge between structural testing (AAXT) and behavioral testing (MAXT). A probe generator reads active layer status and produces 3-5 targeted questions per layer from actual content. A scorer classifies responses against the six-failure-mode taxonomy. An auxiliary LLM client (GPT-4o-mini / Haiku fallback) handles both generation and scoring, deliberately external to the target agent to prevent self-evaluation bias. Phase 1 outputs probes for manual review; Phases 2-3 will wire the full automated pipeline. The AuditBench methodology review (Argus) independently confirmed from Anthropic's own 56-model benchmark that scaffolded black-box probing is the most effective approach — the same methodology MAXT Session 01 arrived at empirically.

**"Methodology Over Code" Strategic Pivot (Apr 7–8):** PA's deep backlog review triggered the most significant product strategy conversation in PM's history. The conclusion: every time PM tried to build code frameworks to enforce methodology, the methodology approach won. Tool integrations (GitHub, Slack, Calendar) reclassified as commodity "indoor plumbing" via MCP/plugins. Intent classification reduced from 19 categories to a binary action/conversation gate. PersonalityProfile deferred for a memory-model approach. Vision V2.1 distills the differentiator stack: **Context Methodology + Conscious Floor + Artifact Persistence + Trust-Graduated Experience**. Within 24 hours, this insight became structural: roadmap restructured from v14.3 to v15.0 (M2–M5 reorganized around the differentiator stack), 12 backlog issues closed as superseded by architectural evolution, bespoke web UI removed from the critical path.

**"Bring Your Own Chat" Distribution Thesis (Apr 8–9):** "Bring Your Own Key" evolved into something larger. PM will ship as an MCP server that plugs into any MCP-compatible client — Claude Desktop, ChatGPT, Gemini, VS Code. The user picks their AI client; Piper enhances it. No new app to learn. MCPB feasibility assessment confirmed architectural viability via a hybrid approach: the host platform provides L1–L2 (kit briefing, persona), the MCP server provides L3–L5 (project memory, channel context, entity-specific context). MCP Apps (interactive HTML in sandboxed iframes) confirmed for an artifact canvas. Roadmap milestone M5 becomes the distribution + polish phase. The one gap: MCP servers cannot inject into the system prompt, so L5 behavioral calibration must be manually installed by the user via Project instructions — the same wall both projects keep hitting in different contexts.

**Iris Joins Klatch + Channel-as-Workflow (Apr 5–6):** Klatch onboarded Iris, its first dedicated UX designer/developer agent. Single onboarding session: read the full codebase (~5,100 LOC client), all seven blog posts, all key coordination docs, then conducted a structured interview with xian. Key finding: 2,406 channels in live DB (sidebar scaling is present-tense, not theoretical); zero klatches in production (multi-entity UX untested with real workflows). The deepest contribution: during a Use Case 1 deep dive on the daily omnibus synthesis, Iris articulated why Layer 4 is a layer and not just a feature — **channel-as-workflow**. A klatch channel is not a group chat; it's a persistent process with purpose. The daily omnibus is the canonical example: same room every day, agents deposit logs, synthesis happens. Layer 4 is what makes this possible. Klatch is now building the infrastructure; PM's omnibus is the intended first consumer.

**Layer 5 as the Hardest Unsolved Problem:** Three independent convergences this week. (1) MCPB persona gap: MCP servers cannot inject L5 behavioral calibration from outside the host platform. (2) Chat→Cowork import gap: L5 calibration structurally absent after environment transfer (carried from prior weeks). (3) MAXT subliminal injection finding (Session 01): L5 content behaviorally accessible but not consciously attributable. Every attempt to move agents across distribution boundaries — import/export, MCP packaging, environment migration — runs into L5. The hybrid workaround (user manually installs persona) is pragmatic but doesn't scale. Calliope's Layer 5 externalization pilot remains the most promising approach in either project.

**Janus Automated External Intel Sweep (Apr 7):** Janus established a weekly CCR-triggered sweep scanning external sources (Anthropic announcements, Claude Code releases, API/SDK changes, open source updates) and committing raw findings to `docs/intel/`. The automation closes the gap where manual sweeps sometimes exceeded 7 days. The April 8 model ID root cause discovery — deprecated `gpt-4-turbo-preview` IDs sinking PM's gate for weeks — demonstrates exactly why this matters: PM lacked equivalent monitoring and discovered the deprecation only through post-failure forensics.

---

## What PM Should Know

- **M1 gate cleared April 8.** Three-layer root cause: model IDs → provider config → empty FloorContext message field. All four issues fixed; IDENTITY queries now route to floor (7+ on Colleague Test vs. 1/3 for canned templates). Re-test with CXO + fresh account is the immediate next step.
- **The roadmap restructure (v15.0) is the week's biggest structural change.** M2: Conscious Floor + Action Handlers. M3: Artifact Persistence + Cross-Session Memory. M4: Trust + Learning. M5: Distribution + Polish (MCPB + MCP Apps). 12 issues closed, bespoke web UI off critical path. CONV-FEAT cluster resolved: #100 and #101 revised to M2 floor context assembler tasks; #103 deferred to Horizon 2.
- **IAC talk is April 17 (Philadelphia).** "Ethics as Information Architecture" assessed 90% ready. Two flags: update the Piper description to reflect BYOC/MCP direction; verify the 80.3% empirical claim.
- **MCPB prototype scope sent to Architect:** 3-tool prototype (get_project_status, save_artifact, retrieve_artifact). Build sequence: MCP server → Claude Desktop testing → MCPB packaging → MCP Apps.
- **Test coverage gap documented:** 27 of 58 service modules (46.6%) have zero test coverage. Critical gaps in auth (17 tests), llm (23 tests), todo (8 tests). The Pattern-045 root cause (mocked service layer) is endemic — integration tests that exercise real infrastructure through the full path are the fix.
- **The Klatch AAXT Scaffolded Probing methodology is directly applicable to PM's E2E/AAXT track (#927-930).** Auxiliary LLM generates probes from actual prompt content; scorer classifies against a failure taxonomy. Validated by Anthropic's AuditBench. Reference: `docs/research/auditbench-methodology-review.md` in Klatch.
- **Consider automated dependency monitoring.** The Janus CCR sweep pattern (automated collection, commits to `docs/intel/`, human curation layer on top) would have caught model ID deprecations before they reached UAT. PM has no equivalent.

## What Klatch Should Know

- **v0.9.0 release still pending.** CHANGELOG and "Paste It Again" blog post are ready. Manual testing by Theseus and xian review still outstanding. Carried forward from April 6.
- **MAXT Session 02 and AAXT Phase 2 deferred.** Both have been carried forward since April 6. MAXT Session 02 tests L4 injection fidelity; AAXT Phase 2 wires the full automated pipeline (generator → target agent → scorer).
- **PM's M1 gate arc is the reference implementation for v0.9.0 gate design.** The lesson: fixes must be validated end-to-end against the original failure path, not just against the component that was changed. Multi-layer root cause chains (three bugs were necessary and insufficient individually) are the norm, not the exception. Design re-test scenarios that exercise the complete user-facing path; plan for multiple rounds.
- **Model ID deprecation is a maintenance surface.** The Janus automated sweep should include model deprecation tracking as a standard check item (fits naturally under API changes). PM lost weeks to a deprecated `gpt-4-turbo-preview` ID discovered only through post-failure forensics.
- **PM's BYOC/MCPB architecture validates channel-as-workflow as a distribution primitive.** If context infrastructure can be delivered via MCP to any LLM client, the channel-as-workflow concept isn't just a product feature — it's a packaging unit. The PM M5 milestone explicitly targets MCPB distribution. Klatch's context assembly could follow the same path. Worth evaluating when planning the distribution story.
- **Piper Open is a live portability test.** First deployment of the Piper Alpha pattern outside PM — lighter-weight five-layer instantiation for OpenLaws at Kind. L3 deferred, L4 minimal, no omnibus or mailbox infrastructure. If PO succeeds, it validates the "minimum viable entity" concept directly relevant to Klatch's Step 10 export/template design.

## For Both Teams

**The AAXT/MAXT loop is now industrialized.** The arc that began with MAXT Session 01's subliminal injection finding completed its first full cycle this week. Discovery (Klatch: subliminal injection) → cross-project validation (PM: Pattern-045, same class of failure) → external research confirmation (AuditBench) → automated detection tooling (Scaffolded Probing Phase 1) → design guidance (for PM's E2E/AAXT track). The cross-pollination infrastructure delivered exactly what it was designed to deliver.

**The methodology layer is named.** PM's strategic pivot made explicit what has been implicit: context methodology is the high-value layer; everything else is indoor plumbing. This is the strongest external validation yet of Klatch's product thesis. Both projects independently converged on the same conclusion — Klatch by building context infrastructure, PM by systematically eliminating code frameworks until only the methodology remained. The five-layer model, channel context, and entity prompts are the differentiators in both products.

**Gate processes teach more in failure than in success.** PM's full M1 arc — initial gate failure (April 3) → symptom fixes (April 4–5) → re-test failure with word-for-word matching responses (April 7) → Five Whys round 1: model IDs (April 8 AM) → provider config fix → message field fix → template migration (April 8 PM) → gate cleared — is more instructive than any successful gate would have been. The lesson: a gate process that catches real issues, produces fixes that don't work, and forces deeper root cause analysis produces better software than one that passes on first attempt.

**Layer 5 portability is the shared hard problem.** Three independent discoveries this week. The hybrid workaround (manually install persona via host platform Project instructions) is pragmatic but doesn't scale and pushes friction onto the user. Calliope's L5 externalization pilot remains the most promising path to a real solution.

**Channel-as-workflow is now design-validated.** Iris arrived as a fresh-eyes evaluator and independently confirmed that Layer 4 is the insight that distinguishes Klatch from all other conversation tools. The daily omnibus synthesis is the canonical example PM already runs — which means the first channel-as-workflow use case is already in production, just manually. The design target is removing the manual step.

---

## Status Flags

**Klatch:**
- Suite at 849 tests, zero failures (Rounds 16-18 complete: FDM Phases 4-5, cross-boundary file injection)
- FDM Phases 1-5 complete; Phases 6-7 (memory-as-file, entity library) deferred to Steps 10-11
- Per-entity effort parameter shipped (Sonnet 4.6 → medium default; max restricted to Opus 4.6)
- Compaction threshold raised: 80K → 160K (one-line change, rationale documented in research doc)
- Iris onboarded; Use Case 1 (daily omnibus) in progress; UX-POLISH.md in scope
- **v0.9.0 release gated on Theseus manual testing + xian review — pending since April 5**
- **MAXT Session 02 (L4 fidelity) — pending since April 6**
- **AAXT Scaffolded Probing Phase 2 — pending since April 6**
- Automated external intel sweep established (CCR-triggered weekly; raw findings to `docs/intel/`)

**Piper Morgan:**
- M1 gate cleared April 8; 6,309 tests passing; UAT re-test with CXO queued
- Roadmap v15.0 published: M2–M5 reorganized around differentiator stack; 12 issues closed
- Vision V2.2: BYOC + MCPB as primary distribution path; MCP Apps for artifact canvas
- BRIEFING-CURRENT-STATE refreshed (April 7 baseline)
- 1,272 lines of dead code removed (#934); missing orchestration tables created (#942)
- 23 unpublished content drafts indexed; 3 scheduled through April 15; publishing at ~2/week
- Piper Open (OpenLaws/Kind) briefed and ready for deployment

**Upcoming deadlines:**
- **April 17:** IAC conference talk ("Ethics as Information Architecture") in Philadelphia — 90% ready; two items flagged
- **April 15:** mediajunkie cancellation — final walkthrough still pending
- **April 19:** Haiku 3 model retirement — Klatch verified clean; PM status unconfirmed
- **April 30:** 1M context beta header retirement — Klatch verified clean; PM status unconfirmed

**Cross-pollination loop:** Active. Briefs generating daily. PM consumption formalized via PA daily check-in flow. Dispatch weekly digest at this file.
