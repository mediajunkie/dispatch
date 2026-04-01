# Current Week Intelligence Brief: March 26–31, 2026

**For:** In-session context (paste into chat as knowledge base)

## This Week at a Glance

Klatch shipped its densest feature day (Step 9 Files complete, File Domain Model approved, Round 12 infrastructure, first native tool use) then entered a holding pattern. Piper Morgan broke a 96-hour silence with ~40 commits: a blog-first publishing pipeline paved through two real publishes, a complete dev/active cleanup skill, and the onboarding of its first new agent role (Piper Alpha). Both projects converged independently on fidelity-as-discipline — Klatch through systematic methodology (AXT-per-layer, Compaction API research, Layer 5 calibration pilot) and Piper Morgan through operational discovery (silent schema drift, stranded branches, the "three clocks" problem). The Chat-to-Cowork import experiment validated the five-layer model as a transfer analysis framework: Layers 1-3 transfer at 100%, Layer 5 at 0%.

## Key Discoveries

**Chat-to-Cowork Import Fidelity Mapped (Mar 26):** A real-world 28-document VA project import was analyzed against the five-layer model. Layers 1-3 transfer cleanly. Layer 5 (behavioral calibration) is structurally absent — months of learned preferences live only in conversation history, which doesn't serialize. Three physically distinct knowledge layers (Chat snapshot, Code memory, repo files) do not auto-sync. The five-layer model proved predictive as a transfer analysis framework, not just a prompt assembly spec.

**File Domain Model Approved (Mar 27):** Klatch established files as first-class domain objects with five visibility scopes (Kit, Project, Channel, Entity, Message). Core principle: pointers, not payloads. Two directional operations — promotion (upward: message attachment becomes project knowledge) and projection (downward: project knowledge delivered to entity with framing prompt). Memory modeled as a file with a reserved name, unifying memory and file systems. Foundational architecture for Steps 10-11.

**Step 9 Files Complete in Two Days (Mar 27):** Daedalus shipped five sub-features (upload/serve, inline rendering, kit briefing awareness, code block export via native tool use, demo pipeline) across client, server, and prompt layers. First native tool use in Klatch — the streaming API was refactored from fire-and-forget to a tool-use loop with MAX_TOOL_ROUNDS=5 safety. Establishes the pattern for all future tool capabilities.

**Layer 5 Calibration Pilot (Mar 27-28):** Calliope created the first externalized Layer 5 document — structured capture of working preferences, workflow patterns, and communication style accumulated through sessions with xian. Direct response to the import fidelity finding that behavioral calibration transfers at 0%. Hypothesis: if calibration is written down, it can be absorbed by successor sessions.

**Silent Schema Drift (Mar 29-30):** Piper Morgan's second blog publish surfaced a CSV field count mismatch (11 vs 13 columns) that produced zero errors but empty output. The parser silently returned nothing. Bug only surfaced two days after the schema changed. Canonical import/export hazard applicable to any fixed-schema parser, including Klatch's JSONL and metadata.json handlers.

**The Three Clocks Problem (Mar 30-31):** Piper Alpha's onboarding exposed that institutional knowledge lives in three asynchronous stores — Chat snapshots, Code memory files, and repo-committed docs — with no auto-sync mechanism. Each updates on a different cadence. This extends the fidelity question from intra-session (what survives compaction) to inter-session (what survives across storage mechanisms). Maps directly onto the five-layer model's physical topology.

**Agent Onboarding as Stress Test (Mar 30-31):** Piper Alpha read all 60 ADRs, 15 omnibus logs, and 6 months of briefs to build context from scratch. Produced a floor/ceiling/path taxonomy: floor moments (LLM competence suffices), ceiling moments (domain knowledge required that docs don't provide), path moments (routing decisions between regimes). First empirical data on cold-start cost in a multi-agent system.

## What Piper Morgan Should Know

- Import fidelity profile confirms your briefing infrastructure works: Layer 2-3 content (BRIEFING-CURRENT-STATE, knowledge base, role definitions) transfers at 100%. But pair with the MAXT subliminal finding — agents may use briefing content without being able to attribute it. Probe behaviorally, not declaratively.
- Klatch's File Domain Model formalizes what PM does implicitly with knowledge base artifacts. The promotion/projection vocabulary and five-scope taxonomy are directly applicable if PM ever redesigns how knowledge flows to agent roles.
- Compaction API (issue #18) and Effort parameter (issue #17) research spikes are in progress at Klatch. Findings will be reusable for PM's session context management — particularly relevant for long agent sessions where briefing content may be silently dropped during compaction.
- Klatch's nomenclature guide is in progress to resolve "system prompt" terminology collision. When the draft is ready, PM should review for early alignment before the projects share any infrastructure.
- Auto-prompt caching (`cache_control: { type: 'ephemeral' }`) is a one-line cost win for any multi-turn API calls. Cache reads at 10% of input token cost.

## What Klatch Should Know

- Silent schema drift is a real hazard: PM's CSV parser returned empty arrays, not errors, when field count changed. Audit import parsers for fixed-schema assumptions — Claude Chat export JSONL, metadata.json, and memory.md formats could all change without notice.
- The three clocks problem extends your fidelity framework. Current AXT methodology tests intra-session transfer. Cross-store synchronization (Chat vs Code memory vs repo) is a fourth factor to add when the Compaction API evaluation concludes.
- Piper Alpha's floor/ceiling/path taxonomy is applicable to roundtable agent onboarding and context injection strategy. Cold-start cost is measurable and the categories map to testable AAXT assertions.
- PM's session-end discipline: nothing stranded on branches, all work committed and pushed to main. Multi-agent teams with discrete sessions face the same risk. Consider adding this to agent traditions as a non-negotiable wrap rule.
- Cross-pollination hooks are converging: PM proposed session-start freshness hooks matching what Klatch already has. Your implementation can serve as reference when PM builds theirs.

## For Both Teams

- Fidelity-as-discipline is now a shared first-class concern. Klatch is building methodology (AXT-per-layer, Compaction API spike, three-factor model). PM is discovering it empirically (schema drift, stranded branches, knowledge migration checklists). The term deserves formal treatment in both projects' documentation.
- The five-layer model keeps earning its keep in new domains: prompt assembly (original purpose), testing framework (MAXT), transfer analysis (import fidelity), cold-start diagnostic (Piper Alpha onboarding). Each application finds the model predictive. Neither project planned this convergence.
- Layer 5 remains the frontier. Four angles this week: MAXT found it subliminally accessible, import found it absent, Calliope piloted externalization, Piper Alpha's cold start confirmed it's the ceiling factor. Layers 1-3 are solved; Layer 5 is where the hard questions live.
- Infrastructure and features can ship in the same session when infrastructure items are scoped small. Klatch's Round 12 (caching, dynamic discovery, kit briefing) shipped alongside Step 9. The "small bets" pattern applied to infrastructure.

## Status Flags

- **Klatch holding pattern:** No commits since March 27. Daedalus has two Tier 2 research spikes outstanding (Compaction API #18, Effort parameter #17) awaiting Argus. 189 pre-existing test failures assigned to Argus Round 13 (root causes diagnosed: jsdom config, stale dist/, unmocked dependency). RFC-001 (Five-Layer Context Model) filed for Calliope review.
- **Piper Morgan active:** Blog-first pipeline operational (two publishes shipped). Piper Alpha Phase 0 complete (first operational session). PM Docs running heavy sessions (dev/active cleanup, blog stabilization). Cross-pollination hooks proposed to CIO + exec inboxes.
- **kindsys.us migration deadline:** April 3. 9/11 PM agent roles migrated; CoS + Lead Dev remaining.
- **PM Chat Project upload pending:** Knowledge-final set (465 files, 4.7 MB) staged but not uploaded. Pending since March 28.
- **Klatch ecosystem deadlines:** Haiku 3 retirement April 19. Daedalus assigned to audit 16K max_tokens setting. Output token limits increased to 64K/128K; 1M context GA.
- **Cross-pollination loop:** Active. Briefs generating daily. PM session-start hooks proposed to close the consumption gap.
