# Current Week Intelligence Brief: March 19–25, 2026

**For:** In-session context (paste into chat as knowledge base)

## This Week at a Glance

Piper Morgan hit its largest coordination day (9 concurrent agents) and discovered the Capability Awareness Gap — five disconnected systems claiming what Piper can do, producing silent failures. Fixed via canonical registry. Klatch formalized the 5-layer prompt assembly model and agent traditions pattern, established standing intelligence monitoring, and shipped klatch creation UI. Both projects converged on identical architectural solutions (registry routing, floor-first dispatch, two-track testing) without coordination.

## Key Discoveries

**Capability Awareness Gap (Mar 19-20):** Five sources claimed PM's capabilities (PIPER.md, soft invocation detector, dispatcher registry, ContextAssembler, floor addendum), producing implicit contracts the system couldn't fulfill. Fix: single canonical dispatcher registry, all else derives. Direct application: validate your entity capabilities against a live registry.

**5-Layer Prompt Assembly Now Canonical (Mar 22):** Klatch published `docs/PROMPT-ASSEMBLY.md` — the structure for context across agent transitions. Layers: Kit Briefing (environmental), Project Instructions (behavioral), Project Memory (factual), Channel Addendum (conversational), Entity Prompt (identity). Klatch's architecture answer to PM's briefing staleness problem.

**Agent Traditions Pattern (Mar 22–24):** Formal per-agent documentation (7 sections: role, style, responsibilities, conventions, relationships, institutional memory, standing instructions). Solves cold-start: agent inactive for days reads traditions, knows what it knows. Argus doc especially relevant — written after losing work to incomplete rebase, emphasizes institutional memory and verification protocols.

**Convergence Without Coordination:** CXO and PPM independently arrived at identical Sprint Completion Gate criteria. Klatch's AAXT/MAXT testing mirrors PM's planned E2E framework. Both projects landed on "automated gates qualitative" pattern independently. Convergence validates the approach as fundamental, not project-specific.

**Intelligence-to-Action Cycle (Mar 20–23):** Klatch intelligence sweep → Calliope triage → Daedalus implementation: 5 features shipped in one day. Piper Morgan Lead Dev reviewed the sweep, noted cross-relevant insights in session log. The loop works when format is structured and routing is clear.

## What Piper Morgan Should Know

- Sonnet 4.6 is now default on Free/Pro: 30–50% latency reduction, same price, 1M context beta. Evaluate for applicable agent roles.
- Compaction API (beta, Opus/Sonnet 4.6): Server-side context summarization, custom instructions preserved. Could simplify PM's context assembly for long-running sessions.
- Cowork Projects import now available: Three-surface landscape emerging (claude.ai projects, Claude Code repos, Cowork folders). Affects context portability strategy.
- Klatch's intelligence sweeps are actionable. Check `docs/intel/2026-03-23-sweep.md` in the Klatch repo for detailed findings on Sonnet, Compaction, Cowork, and Claude Agent Teams.

## What Klatch Should Know

- Registry-driven capability gating prevents phantom offers: gate all capability offers on a live dispatcher registry, not on what prompts claim.
- PM's workflow hijack design principle: "The session belongs to the user, not the workflow." Applies to interaction mode entry/exit UX. Can users always escape a roundtable or directed session?
- Audit cascade methodology: when issues are discovered, diagnose against current architectural state (not filing date), narrow or widen scope based on what's already fixed, execute efficiently in a single session.
- Two-perspective testing validates quality gates: CXO and PPM converged on identical criteria independently. When multiple reviewers from different domains arrive at the same gaps without coordination, the design is sound.

## For Both Teams

- Session wrap verification is non-negotiable: `git log`, `ls` deliverables, test suite pass before claiming "done." Never force push without explicit approval. This prevents invisible work loss.
- Principles do active work: PDR-003 (Products emerge from Projects) resolved navigation design disagreements by invoking architecture. Formalize your architectural commitments, let them resolve downstream conflicts.
- Intelligence-to-action velocity depends on format. Structured sweeps with relevance scores, routing assignments to specific agents, and pre-decided next steps collapse implementation latency.

## Status Flags

- **Klatch MAXT Session 01:** Imminent. Will be first empirical validation of 5-layer model across real context transition. Watch for failure taxonomy results (Correct → Reconstructed → Confabulated → Absent → Phantom).
- **Piper Morgan M1 Spring Gate:** Filed #926. Criteria converged independently (fresh-account testing, Colleague Test rubric ≥7, canonical retest ≥85%, error path coverage).
- **Cross-Pollination Loop:** Closed (Piper Morgan Lead Dev reviewed brief March 21 and noted insights in session log). Process validates and accelerates further.
