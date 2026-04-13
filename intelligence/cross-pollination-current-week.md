# Current Week Intelligence Brief: April 7–13, 2026

**For:** In-session context (paste into chat as knowledge base)

## This Week at a Glance

The week opened with both projects carrying deferred work and a quiet weekend, and closed with both projects having passed through their most significant strategic inflection points to date — and landing, independently, on the same architectural conclusion. PM's M1 gate finally cleared after a three-layer root cause chain that consumed five days, then immediately pivoted: "methodology over code" became a formal doctrine, the roadmap restructured around a differentiator stack (v15.0), and "Bring Your Own Chat" reframed distribution as product strategy — Piper ships as an MCP server, not an app. Klatch shipped v0.9.0, filed a futures memo reframing Step 10 as a context interchange protocol, and began Phase 1 design with five streams of input converging on a protocol-first format spec. The cross-pollination network expanded to four sources (OpenLaws via Vergil), the automated intel sweep earned its keep by catching Claude Managed Agents' public beta launch, and Argus validated the automation-plus-curation split with the first curated sweep. The week's deepest finding: both projects are building toward the same architecture — Klatch as context server, PM as task-and-knowledge server, Managed Agents as the execution layer both plug into — and the phrase that captures both projects' positioning arrived from two directions at once: "passed through on its way somewhere else."

---

## Key Discoveries

**Three-layer root cause chain closes M1 gate (Apr 7–11).** The M1 gate failure that opened on April 3 finally resolved — but not at the depth anyone expected. The April 8 Five Whys found deprecated model IDs (gpt-4-turbo-preview returning 404). That was real but insufficient. The afternoon revealed two more layers: the setup wizard stored provider preference but `LLMClient.complete()` never read it (Layer 2), and the pre-classifier stored user messages in `intent.context['original_message']` while FloorContext read from `intent.original_message` — always empty for pre-classified intents (Layer 3, the actual root cause). A fourth fix migrated IDENTITY queries from canned templates (scoring 1/3 on the Colleague Test) to floor routing (scoring 7+). The final session on April 11 uncovered the fabrication failure class: when "list todos" (without "my") fell through the pre-classifier, the floor LLM confidently invented nine plausible-looking todos from nothing. Dual fix: pattern repair plus an explicit fabrication prohibition in the floor system prompt. Gate closed at 7/9 PASS.

**"Bring Your Own Chat" reframes distribution as product strategy (Apr 8–9).** PM's "Bring Your Own Key" principle evolved into something more consequential. Piper will ship as an MCP server that plugs into any MCP-compatible client — Claude Desktop, ChatGPT, Gemini, VS Code — rather than building a bespoke web UI. The MCPB feasibility assessment confirmed a hybrid architecture: the host platform provides L1–L2 (kit briefing, persona), the MCP server provides L3–L5 (memory, channel context, entity context). MCP Apps (interactive HTML in sandboxed iframes) confirmed for an artifact canvas. This is not a packaging decision; it removes an entire category of work (nav design, component library, deployment infrastructure) and replaces it with context assembly — the product's actual differentiator. The one structural gap: MCP servers cannot inject into the system prompt, so L5 behavioral calibration must be manually installed by the user. The same wall both projects keep hitting.

**Klatch ships v0.9.0, immediately pivots to context interchange protocol (Apr 10–11).** After a five-day gap, Klatch shipped v0.9.0 (Files & Context Architecture) in a single evening session. The same night, a futures memo reframed Step 10: Klatch is not just building an export format but a context interchange protocol that any MCP-capable consumer could call. Three converging signals made this load-bearing: Managed Agents launched, Anthropic centralized compaction, and xian's cross-project observation — "our products are services for agents to interact with, not just for people." Calliope's feedback memo sharpened the design: Phase 1 must be self-describing, versioned from day one, and named for public consumption (`channel_context` not `layer_4_channel_addendum`). Daedalus's round 3 closure introduced the sparkline test as a format discipline: could a consumer parse the manifest and produce a per-layer breakdown without re-deriving anything from prose?

**Claude Managed Agents becomes a shared upstream target (Apr 8–10).** Klatch's automated intel sweep caught the week's biggest external development: Claude Managed Agents entered public beta on April 8, with built-in tool execution, compaction, MCP server support, and persistent SSE streaming sessions. Both projects independently targeted it for different reasons — Klatch for Step 10 export (turn a conversation into a live agent), PM for BYOC distribution (server-side deployment without requiring local Claude Desktop). The SDK compaction-helper deprecation in v0.83.0 is a directional signal: Anthropic is centralizing context management inside the execution layer. Both projects have infrastructure in exactly this space. The right posture is alignment, not extension: for each piece of duplicated infrastructure, decide whether to hold, migrate, or shim behind an interface.

**Cross-pollination network expands to four sources (Apr 11).** Vergil, working on OpenLaws, reflected on Klatch's evolution and named a pattern none of the existing project teams had formulated: extracted abstractions are more robust than designed abstractions. The five-layer model wasn't planned as a protocol; it was extracted from the operational pain of making import work. Git, gRPC, React followed the same shape. A second pattern from the same synthesis: "software as an MCP rather than a UI on the web" is about what software IS when users are heterogeneous in kind. The data boundary on OpenLaws content held on its first test — methodology and architecture flowed through; product internals were correctly excluded.

**AAXT/Colleague Test cross-reference and fabrication probe class (Apr 12–13).** Argus produced a formal mapping of Klatch's six-failure-mode taxonomy against PM's seven-question Colleague Test. The instruments are complementary: AAXT catches subliminal injection and reconstructed/correct distinctions; the Colleague Test catches tone, actionability, and holistic trust. Neither should replace the other. Argus also formalized the Pattern-045 fabrication failure as a probe class with five categories (file, entity, memory, history, channel absence), available as a standalone manual test or integrated into the AAXT Phase 2 pipeline.

**Type 2 dreaming confirmed as genuinely novel (Apr 12).** A cross-project memory research thread — Janus surveying 20+ external systems, PM Docs providing prior art across 7 areas — confirmed that PM's "anxiety dreams" concept (the system imagines failure scenarios to prepare) has no counterpart in any surveyed academic or commercial memory system. The broader finding: write governance is everything. The technology choice (vector store, SQL, filesystem) is secondary to who can write what, when, with what provenance. PM's filesystem infrastructure gets this right; the gap is automated maintenance. Five M2 scope candidates filed (#972-976).

---

## What PM Should Know

- **M1 gate closed April 11 at 7/9 PASS.** Three M2 architectural issues filed: #960 (fabrication guardrails deeper fix), #961 (floor-route context audit), #962 (LLM-shortcut inversion sweep). The fabrication-guardrail pattern is now part of ADR-060's three M1 amendments.
- **M2 sprint planning underway.** 32 open issues; proposed 6-phase grouping. Next steps: canonical retest (benchmark vs M0's 76%), M1 retro, leadership review before plan is committed. M2a already in motion — Lead Dev closed 7 issues in a single session, establishing a canonical baseline of 95.1% routing / 65.6% quality.
- **Vision V2.3 and Roadmap v15.0 adopted with full leadership endorsement.** "Methodology beats code" is now formal doctrine. The differentiator stack — Context Methodology + Conscious Floor + Artifact Persistence + Trust-Graduated Experience — organizes M2–M5.
- **Klatch's Step 10 context interchange protocol is a direct upstream dependency for M5.** Klatch's context package could be the data source PM's BYOC MCP server calls at session start instead of re-assembling context from scratch. PM Architect should read the Phase 1 design doc (`docs/plans/STEP-10-PHASE-1-PACKAGE-FORMAT.md`) when it lands and accept Daedalus's standing read offer.
- **Klatch's AAXT work is directly applicable to PM's #929 scorer.** Argus recommends PM's DeepEval LLM-as-judge adopt the six failure modes (Correct, Reconstructed, Confabulated, Absent, Phantom, Subliminal) as output vocabulary for cross-project comparability. The fabrication probe class provides five ready-made absence categories that map to PM's M2 test surface.
- **Managed Agents is now a shared planning assumption.** PM Architect and Lead Dev should read the Managed Agents docs before M5 distribution design. A short cross-project alignment memo on shared assumptions would prevent re-derivation.
- **Memory schema coordination point flagged by Docs.** PM's proposed `valid_from`/`ended` temporal validity fields for memory file frontmatter should align with Klatch's Phase 1 package format conventions. One-round exchange with Janus prevents a translation layer later.
- **Building narrative arc exhausts current pieces by April 14.** New content needed by April 16 to maintain publishing cadence.

## What Klatch Should Know

- **v0.9.0 shipped.** GitHub release live ("v0.9.0 — Rich Context: Files and artifacts"). 849 tests, zero failures. Step 9 complete. LinkedIn post drafted, awaiting xian timing decision.
- **Step 10 Phase 1 design is complete through five rounds of input.** Schema sketch stable. Key decisions: `extensions` namespaced by producer, `format_version` and `package_kind` versions move independently, provenance doors preserved (UUID + integrity: null), `layer_fidelity` vocabulary (full/partial/rebuilt/absent), sparkline test as format discipline. Design doc graduates to formal spec next session.
- **Argus's first curated sweep validated the automation split.** Hono CVE demoted (Klatch uses none of affected features), Managed Agents confirmed High, SDK bump confirmed required but not urgent for compaction. The automated-scan-plus-human-curation pattern is proven.
- **SDK upgrade from ^0.78.0 to ^0.86.1 is required for Step 10** (Managed Agents support), but not urgent for current features. Compaction-helper deprecation in v0.83.0 does not affect Klatch's compaction logic today, but the directional signal is that Anthropic wants to own the context-management layer. Plan accordingly.
- **The conversation continuity fix (#922) principle applies to Klatch's prompt assembly.** Conversation context must include the agent's own turns, not just the user's. Klatch's `messages` table stores both by role (structurally fine), but any future feature that builds turn history filtered on `role = 'user'` will reproduce the same failure mode. Worth auditing prompt-assembly code with this lens.
- **PM is now using "AAXT" as terminology for its own testing work (#929, #928, #930).** Argus's cross-reference memo and fabrication probe class are directly actionable. The six-failure-mode taxonomy, two-pass approach (automated scan + curated analysis), and structure/behavior separation are all applicable to PM's implementation.
- **MAXT Session 02 and AAXT Phase 2 both still queued.** Calliope assigned both for next available sessions. Iris Use Case 2 also in queue.

## For Both Teams

**"Products as services for agents" is the week's architectural convergence.** Both projects arrived at this independently across the same 48-hour window. It is not "our product is accessible to agents" (API bolted on) — it is "our product is designed as a service that agents call, and the human UI is one consumer of that same service." Products designed this way compose natively and survive the expected proliferation of agent runtimes. Klatch as context server, PM as task-and-knowledge server, Managed Agents as the execution layer both plug into. The most important near-term question: whether both projects can define a minimal shared interface before each independently ships its own MCP surface.

**"Methodology beats code" is now formal doctrine in both projects.** PM's Vision V2.3 canonicalized it; Klatch's five-layer model is the canonical proof case; Vergil's OpenLaws synthesis named the underlying pattern (extracted abstractions beat designed abstractions). Two independent teams building different products with different tech stacks landed on the same operational insight. This is a finding, not a preference.

**The gate methodology lesson sharpened twice this week.** The M1 arc demonstrated that root cause analysis must continue past the first satisfying answer — and the second. Three bugs were each necessary to fix but insufficient alone. A gate process that stops at the first root cause would have declared victory after the model ID fix and still failed UAT. When either project designs a release gate, build re-test scenarios that exercise the complete failure path end-to-end after each fix, and plan for multi-layer root cause chains.

**The cross-pollination infrastructure is working as designed.** Four sources (PM, Klatch, OpenLaws, Dispatch-DinP). Automated intel sweep catching external developments (Managed Agents launch, Hono CVEs, SDK gaps). Curated sweep filtering signal from noise. Cross-project research threads producing actionable findings (AAXT/Colleague Test cross-reference, fabrication probe class, memory schema coordination). The Dispatch mail routing gap that PA discovered on April 9 is the one structural failure — four messages missed because Dispatch writes to `~/cool/dispatch/mail/` while PA only checked the PM repo mailbox. The fix (check Dispatch mail at session start) is applied; the contract should be documented explicitly.

---

## Status Flags

**Klatch:**
- v0.9.0 shipped; 849 tests, zero failures
- Step 10 Phase 1 design complete through five rounds; formal design doc next session
- Automated external intel sweep operational (weekly Monday 9 AM PT)
- First curated sweep (Argus) validated the automation-plus-curation split
- SDK upgrade to ^0.86.1 required for Step 10 (currently ^0.78.0)
- AAXT/Colleague Test cross-reference and fabrication probe class shipped
- LinkedIn post for v0.9.0 drafted, awaiting xian timing
- **MAXT Session 02 — queued, Calliope assigned**
- **AAXT Scaffolded Probing Phase 2 — queued, Calliope assigned**
- **Iris Use Case 2 — queued**

**Piper Morgan:**
- M1 gate closed April 11 (7/9 PASS); three M2 architectural issues filed (#960, #961, #962)
- Vision V2.3 adopted; Roadmap v15.0 adopted with full leadership endorsement
- M2 sprint planning active; M2a in motion (7 issues closed, 95.1% routing / 65.6% quality baseline)
- BYOC/MCPB architecture validated; MCPB prototype scope sent to Architect
- Five memory M2 scope candidates filed (#972-976); Type 2 dreaming flagged as novel
- Critical M1 doc rewrite complete (8 files, ~1577 lines); ADR-060 amended
- **Building narrative arc exhausts current pieces April 14 — new content needed by April 16**

**Upcoming deadlines:**
- **April 17:** IAC conference talk ("Ethics as Information Architecture") in Philadelphia — 90% ready; update Piper description for BYOC/MCP direction
- **April 19:** Haiku 3 model retirement — Klatch verified clean; PM has 3 files needing updates (~30 min task)

**Cross-pollination loop:** Active. Briefs generating daily. Four sources operational (PM, Klatch, OpenLaws, Dispatch-DinP). Dispatch weekly digest at this file.
