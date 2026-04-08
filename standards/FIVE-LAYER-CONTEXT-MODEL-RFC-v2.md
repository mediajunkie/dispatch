---
RFC: 001
Version: 2
Title: Five-Layer Context Model
Status: DRAFT
Author: Dispatch-DinP
Date: 2026-04-08
Supersedes: standards/FIVE-LAYER-CONTEXT-MODEL-RFC.md (v1, 2026-03-30)
Reviewers: Klatch (Calliope), Piper Morgan (PA), Janus
---

# RFC-001 v2: Five-Layer Context Model

## Summary

This RFC defines a shared vocabulary for how AI agents receive context. It supersedes v1 (2026-03-30) and incorporates amendments from all three responding projects: Klatch (Calliope), Piper Morgan (PA), and Janus. The five-layer structure is unchanged. This version adds precision to the Layer 5 definition, adds a temporal dimension to Layer 3, introduces a fidelity assessment protocol, formalizes the agent-team / product distinction, and acknowledges the single-agent case. It remains in DRAFT status pending ratification.

---

## Background

*(Unchanged from v1. Reproduced for completeness.)*

On March 22, 2026, a synthesis subagent working on the March 21 omnibus log produced a draft with five factual errors: a duplicated timeline entry, a memo count inflated by 3×, an unsourced percentage claim, and two framing issues. Docs diagnosed the root cause as missing context, not capability failure.

The subagent had been given the task (Layer 4) but was missing:
- **Layer 1** — it didn't know what source files were available or where to look
- **Layer 3** — it had no accumulated knowledge of the project's methodology, prior decisions, or actor naming conventions
- **Layer 5** — it had no role identity; it was operating as a generic summarizer rather than as a synthesis agent with known patterns and failure modes

A corrected v2 prompt injected BRIEFING-CURRENT-STATE, delivery log context, role naming standards, and prior error patterns. All five factual errors were resolved.

On March 23–24, AXT testing of Klatch agent Theseus against the full five-layer model (fork: "Aether") found a subliminal injection issue and eight additional findings related to context delivery. The MAXT Session 01 report is in the Klatch repo.

Also on March 23, Archie's first full Chat→Cowork import completed with 100% copy rate for knowledge documents (28 docs, 15 binary files). The key fidelity finding: **imports preserve Layers 1–3 well but consistently lose Layer 5** — behavioral calibration, conversational tone, and the agent's accumulated sense of how xian works. Conversation history is not imported; neither is the relational register built up through repeated interactions.

These three data points suggest the model is real enough to standardize.

---

## The Five Layers

### Layer 1 — Environmental Awareness

What the agent knows about its operating environment: what platform it's running on, what tools and capabilities are available, what the filesystem looks like, and what external systems it can reach.

**Examples:**
- "You are a Claude Code agent in a git worktree at ~/cool/dispatch/"
- "You have access to bash, file read/write, and the Piper Morgan repo at ~/cool/piper-morgan/"
- "The Cowork session has these folders mounted: ~/cool/VA/, ~/cool/dispatch/"
- "You cannot write to git directly; use the general-purpose agent for file persistence"

**What breaks without it:** Agents hallucinate file locations, assume capabilities they don't have, or operate as if they have no filesystem context. The Mar 22 synthesis agent looked for source files in the wrong location and couldn't verify its own claims.

**Implementation note:** In Claude Code, Layer 1 is auto-injected (date, model ID, git status, working directory). In Klatch, Layer 1 was designed for imported channels and is absent or simplified for native channels — a known gap. For products, Layer 1 is typically set at application startup from a config file. All implementations should provide Layer 1 even in simple cases; a native channel, a single-agent repo, or a minimal startup config is still better than none.

---

### Layer 2 — Methodology

How the agent is expected to approach work: conventions, standards, processes, and behavioral rules. This is the instructional layer — what CLAUDE.md files contain, what coding conventions are enforced, how deliverables are structured.

**Examples:**
- "Omnibus logs follow the four-tier complexity taxonomy: MINIMAL / STANDARD / HIGH-COMPLEXITY:COORDINATION / HIGH-COMPLEXITY:EXECUTION"
- "Commit messages are prefixed with `[agent-slug]`"
- "Use the actor slug format `Docs`, `CoS`, `Lead Dev` — never full names"
- "Docs is the quality authority; no omnibus log is canonical without Docs review"

**What breaks without it:** Agents drift to generic defaults. Format violations, inconsistent naming, wrong process steps. The v1–v3 omnibus iterations on March 21 all had methodology failures before the taxonomy was injected.

**Implementation note:** In single-agent projects, Layer 2 is often co-located with Layer 5 in a single file (e.g., Janus's CLAUDE.md, which contains both editorial conventions and the agent's identity section). This co-location is valid and has no practical cost when the project has one voice. Separating them is valuable in multi-agent projects where many roles share methodology but each role has a distinct identity.

---

### Layer 3 — Project Memory

Accumulated knowledge about the project: decisions made, patterns discovered, what's been tried, what's been rejected, who the players are, what the current state is.

**Examples:**
- BRIEFING-CURRENT-STATE doc, delivery logs, architecture decision records
- "The March 21 omnibus had 9 source logs, not 6 — 3 were Claude Project downloads"
- "Archie's .projects/ folder emptied unexpectedly on March 25 — all content is backed up at VA/dispatch/"
- "Layer 5 is consistently lost in Chat→Cowork imports — this is a known gap, not a failure"

**What breaks without it:** Factual errors and confident confabulation. The Mar 22 synthesis agent inflated a memo count to 48 (the correct number was 15) because it had no grounding in project history. It invented a plausible-sounding number. Project memory is the fact-check layer.

**Temporal dimension (Amendment 3):** Layer 3 content is only as reliable as its last update. A faithfully delivered but stale memory is a silent failure mode — the agent operates on outdated facts with full confidence. MAXT Session 01 (Klatch) found MEMORY.md was 16 days stale on March 24; PM's session-start analysis identified the same pattern ("no auto-invalidation"). Both represent **structural fidelity without content fidelity**.

Layer 3 fidelity therefore has two independent axes:
- **Structural fidelity** — was the memory content included in the assembled prompt? (Verifiable via inspection tools.)
- **Content fidelity** — is the memory current? (Requires a freshness signal or manual audit.)

Implementations should include a freshness indicator (e.g., a last-updated timestamp) in memory files, and agents should be prompted to treat memory as "believed true as of [date]" rather than unconditionally authoritative.

**The three-clock problem (PM observation):** Projects that combine Claude Chat snapshots, Code memory files, and repo-committed docs have three unsynchronized sources of project memory, each reflecting a different point in time. This is not a pathology — it is the default state of any project that spans multiple persistence mechanisms. The five-layer model does not solve the three-clock problem, but it names it: all three sources are Layer 3, and their divergence is a Layer 3 content fidelity issue, not a structural failure.

---

### Layer 4 — Delivery Context

The immediate task: what's being asked, what scope is defined, what constraints apply, and what success looks like. This is the most task-specific layer and typically arrives fresh with each assignment.

**Examples:**
- "Synthesize the March 21 omnibus log using the 9 source logs in dev/2026/03/21/"
- "Write a memo to Calliope summarizing the Klatch import structure findings"
- "Scope: this session only; don't update any persistent files without confirmation"
- "Target length: ~300 lines. HIGH-COMPLEXITY:COORDINATION format."

**What breaks without it:** Nothing gets done. This is the most obvious layer — agents always notice when it's missing. The failure mode is prompt refusal or off-target work, both of which are immediately visible.

**Persistence gap (PM observation):** Product implementations of Layer 4 face a distinct challenge. In a software product, Layer 4 carries in-session context — turn history, topic tracking, lens state, last offer made. This state is often held in memory (e.g., an in-memory Python dict) and dies on restart or page refresh. Unlike agent-team Layer 4 (which is asynchronous and file-backed), product Layer 4 must persist within a session and survive at least page-refresh-level interruptions. This is a known architectural gap in products that use per-process in-memory state without a backing store.

**Inter-project Layer 4 (Janus observation):** Layer 4 can flow between projects, not just within them. Cross-pollination briefs committed to receiving repos function as Layer 4 injections from an external source: they provide session-specific context ("here is what the sibling project discovered yesterday") that informs the next session's work. The delivery mechanism is identical to agent-team Layer 4 (filesystem-committed markdown) but the originating context is external. Implementations should not assume Layer 4 is always authored by the receiving project.

**Single-agent case:** In projects with narrow, stable scope (such as Janus), Layer 4 may be null or near-null for most sessions. The standing channel context (general stewardship) subsumes most task framing. Structured Layer 4 injection becomes valuable when a session has a distinct, bounded job that differs from the standing scope.

---

### Layer 5 — Role Identity

Who this agent is: their specialty, their voice, how they relate to xian, how they relate to other agents, and what behavioral calibration has accumulated through prior interactions.

**Examples:**
- "You are Docs, the Documentation and Quality Management agent for Piper Morgan. You are the quality authority for omnibus logs. You communicate in precise, structured prose."
- "You are Dispatch-DinP. You hold cross-project context. You speak plainly and don't editorialize."
- "Theseus: you have been working with xian since March 2026. Your established patterns: always verify file locations before claiming, flag when you're uncertain."
- "Archie: you are the Operational Support Partner for VA Decision Reviews. Your tone is collegial and procedural."

**What breaks without it:** The agent operates competently but without personality or relational calibration. It treats every task as new, applies generic defaults, and may produce work that's technically correct but tonally off. Critically, it won't know when to push back, when to ask, or when xian's intent differs from his stated request. This is the layer most reliably lost in imports and cross-platform migrations.

### Layer 5 Sub-components: Declarative Identity and Procedural Calibration (Amendment 1)

Layer 5 has two sub-components with radically different transfer characteristics:

**L5a — Declarative identity** (text-serializable): The agent's name, role description, persona, explicit behavioral instructions, and voice directives. This is ordinary text. It transfers at full fidelity across imports, context resets, and platform migrations.

**L5b — Procedural calibration** (interaction-derived): Accumulated patterns of communication, interpretation heuristics, and relational register built through repeated interaction with xian. This is not stored anywhere. It lives in the distribution of prior turns and cannot be serialized in any current implementation. Transfers at 0% across context boundaries.

The original RFC's "Role Identity" label covers L5a well. L5b — what the RFC called "behavioral calibration" — is a known gap across all implementations.

A complete Layer 5 addresses both. Current implementations address L5a through entity prompts, traditions documents, and CLAUDE.md identity sections. L5b can only be partially approximated through:
- Calibration notes capturing observed patterns after sessions (Klatch pilot: `docs/agents/calliope-calibration.md`)
- Explicit recovery prompts at session start ("rebuilding calibration — invite corrections")
- Deliberate early-session probing to confirm calibration is intact

Klatch's MAXT methodology adds a third dimension: **subliminal injection**. MAXT Session 01 found that even when L5a content was structurally delivered (ACTIVE status on `prompt-debug`), the agent did not consciously attribute its behavioral patterns to that content. The identity prompt shaped behavior without entering the agent's self-model. Structural delivery (Layer 5 is ACTIVE) is not sufficient evidence that the agent is operating from an intact identity. Manual behavioral probing is required to verify conscious access.

**The declarative/procedural split should not be modeled as a sixth layer.** It is internal structure within Layer 5. Splitting it into two numbered layers would add complexity without practical benefit. The five-layer model is already established across implementations.

---

## Layer Relationships

The layers are ordered general-to-specific. Layers 1–3 are typically stable across a session; Layers 4–5 are session-sensitive, though Layer 5 ideally persists across sessions through memory and explicit identity prompts.

```
Layer 1: Environmental Awareness    ← most stable; set by platform/tool config
Layer 2: Methodology                ← stable; stored in CLAUDE.md / project instructions
Layer 3: Project Memory             ← accumulates over time; may degrade via staleness
Layer 4: Delivery Context           ← changes per task; flows within and between projects
Layer 5: Role Identity              ← ideally stable; L5a transfers, L5b does not
```

A complete context injection assembles all five. Missing any single layer produces a predictable class of failures. Empty layers may be omitted from assembly; their omission should be intentional, not accidental.

**Single-agent collapse:** In single-agent projects, L2 and L5 may be co-located in one file and L4 may be null for most sessions. This is not a degraded implementation — it is the model operating correctly at a smaller scale. The diagnostic value of the model is unchanged: gaps are still nameable, failures still trace to a layer.

---

## Agent Team vs. Product (Amendment 4)

Both Klatch and Piper Morgan have two distinct contexts where the five-layer model applies: the **agent development team** (agents working in Claude Code on a codebase) and the **product** (an AI application delivering context to end-user-facing agents). The injection mechanisms, fidelity characteristics, and gap priorities differ.

| Dimension | Agent Team | Product |
|-----------|-----------|---------|
| Layer 1 | Auto-injected by Claude Code | Config file loaded at app startup |
| Layer 2 | CLAUDE.md (committed, git-versioned) | System prompt addendum in application code |
| Layer 3 | Memory files + briefing docs | Database queries (trust profile, history, preferences) |
| Layer 4 | Memos, session logs, briefs (filesystem, async) | In-session turn history (in-memory or DB-backed) |
| Layer 5 | Entity prompts, traditions docs, calibration notes | Personality profile + user preferences table |
| L3 staleness risk | HIGH (memory files updated manually) | LOWER (DB queries are typically fresh) |
| L4 persistence risk | LOW (filesystem survives restarts) | **HIGH** (in-memory L4 dies on restart) |
| L5b calibration | LOW (sessions are isolated) | NONE (no learning loop) |

The agent-team case has strong L4 persistence (file-backed) and weak L5b. The product case has strong L3 freshness (database-backed) and critically weak L4 persistence (often in-memory with no backing store). These are different architectural problems requiring different solutions.

Neither the Klatch product nor the Piper Morgan product has a learning loop for L5b. Users' preferences are database-backed but not updated from observed behavior. This is the correct architectural posture until a deliberate learning system is designed — unintended implicit learning would be harder to audit and correct.

---

## Fidelity Assessment Protocol (Amendment 2)

From the review process, both PM and Klatch independently recommended that the RFC include a formal fidelity assessment approach. The following protocol is derived from Klatch's AXT methodology and is proposed as a cross-project standard.

Each layer has two fidelity dimensions:

**Structural fidelity** — Was the content present in the assembled prompt? This is binary and automatable. Klatch's `GET /api/channels/:id/prompt-debug` endpoint provides this for all five layers, reporting ACTIVE / INACTIVE / EMPTY per layer. Equivalent inspection mechanisms should exist in all implementations.

**Behavioral fidelity** — Can the agent use the content? Does it know it has it? This requires human-agent interaction. Klatch's MAXT methodology provides the framework: probe the agent with targeted questions that can only be answered correctly if the content was delivered and accessed. Two sub-dimensions:

- **Behavioral access** — Does the agent's behavior reflect the injected content? (Verifiable through structured tasks designed to require it.)
- **Conscious attribution** — Does the agent know where its behavior comes from? (Verifiable through direct metacognitive questioning.)

The MAXT Session 01 Subliminal finding (Klatch) demonstrates that structural fidelity does not imply behavioral fidelity, and behavioral access does not imply conscious attribution. All three can diverge independently:

| Structural | Access | Attribution | Interpretation |
|------------|--------|-------------|----------------|
| ACTIVE | YES | YES | Full fidelity |
| ACTIVE | YES | NO | Subliminal delivery (behavior shaped, source unknown) |
| ACTIVE | NO | NO | Dead content (delivered but not integrated) |
| INACTIVE | — | — | Layer gap (content not assembled) |

Implementations should provide structural inspection tooling. Behavioral probing should be conducted at least once per new agent configuration and after any significant prompt change or migration. The goal of the protocol is not to maximize attribution — it is to distinguish dead content from live content and to surface silent failures.

---

## Existing Implementation: Klatch PROMPTASSEMBLY.md

Klatch implements this model in `docs/PROMPTASSEMBLY.md` under these names:

| Klatch name | RFC layer | Notes |
|---|---|---|
| Kit Briefing | Layer 1 | Environmental orientation |
| Project Instructions | Layer 2 | Behavioral rules and conventions |
| Project Memory | Layer 3 | Accumulated factual context |
| Channel Addendum | Layer 4 | Conversation-specific supplementary context |
| Entity Prompt | Layer 5 | Individual agent identity and role |

Assembly order is 1→5 (general to specific); empty layers are omitted. The Klatch layer names are preserved as valid aliases for the RFC names. Both naming conventions are considered canonical.

**Note on Layer 4 UI labeling (Klatch):** The Klatch channel settings UI currently labels the Layer 4 field as "System prompt," which collides with the general meaning of "system prompt" (the entire assembled prompt) and with Layer 5. This is a known nomenclature issue assigned for remediation. RFC-001's "Delivery Context" is the canonical name; "Channel Addendum" is the Klatch alias.

---

## Import Fidelity Implications

When a Claude Chat project is imported into Cowork (or any similar migration), the five-layer fidelity is asymmetric:

| Layer | Import fidelity | Notes |
|---|---|---|
| Layer 1 | High | Environment is re-established at session start |
| Layer 2 | High | CLAUDE.md / project instructions transfer directly |
| Layer 3 | High | Knowledge documents copy at 100% rate (observed in Archie import, Mar 23) |
| Layer 4 | N/A | Task context is per-session; doesn't apply to imports |
| Layer 5 (L5a) | High | Entity prompt text transfers at full fidelity |
| Layer 5 (L5b) | **0%** | Procedural calibration does not serialize; must be rebuilt |

This means imported agents are knowledgeable but uncalibrated. They know what the project contains but don't know how xian works or how they've adapted to him. L5b must be explicitly rebuilt after migration — through entity prompts, onboarding sessions, calibration notes review, or a deliberate calibration task.

This also means: **don't evaluate an import's quality based on L5b alone.** A freshly imported agent that makes tone or register errors isn't broken at Layers 1–4 or at L5a. It's missing its relational history and needs time to reacquire it.

---

## Recovery Protocol for Layer 5b

From the Klatch review, the following standard recovery approach is proposed for agents undergoing context transitions (imports, resets, platform migrations):

1. **Read the traditions document** at session start if one exists (Klatch: `docs/agents/[agent].md`)
2. **Read calibration notes** if they exist (`docs/agents/[agent]-calibration.md` or equivalent)
3. **Disclose the transition** — note to the user that behavioral calibration is rebuilding and invite explicit corrections; do not simulate confidence in calibration that hasn't been verified
4. **Probe for calibration fit** — in early session turns, surface interpretive choices explicitly so the user can confirm or redirect before the session proceeds on potentially miscalibrated assumptions

Whether this protocol measurably accelerates L5b recovery is an open question. Klatch's MAXT methodology can test it once the calibration notes pilot has sufficient data.

---

## Proposed Actions for Each Project

Each project team is asked to:

1. **Map current context injection to the five layers** — identify what's being injected today and which layer it belongs to
2. **Identify gaps** — which layers are partially or fully absent in typical agent sessions?
3. **Document the mapping** — this doesn't require building anything yet, just naming what exists
4. **Assess Layer 3 freshness** — does the project have a mechanism to signal when memory content is stale?
5. **Assess Layer 4 persistence** — for product implementations, does Layer 4 survive restart or refresh?
6. **Assess Layer 5b** — does the project have any calibration externalization mechanism?

---

## Open Questions

- **Layer 5b recovery fidelity:** Do calibration notes (Klatch pilot) measurably accelerate behavioral calibration recovery? MAXT testing TBD.
- **Layer 3 auto-invalidation:** What is the right mechanism for flagging stale memory — agent prompting, timestamp conventions, or something structural?
- **Product Layer 4 persistence:** What is the right architecture for product Layer 4 that survives restarts? Redis, DB-backed sessions, or other? (PM has identified this as the highest-impact product improvement; architectural proposal is separate from this RFC.)
- **Cross-project Layer 4:** Are there cases where inter-project Layer 4 delivery (like cross-pollination briefs) should be modeled differently from intra-project Layer 4? Or is "Layer 4 can come from anywhere" sufficient?
- **Subliminal injection:** Is the subliminal delivery state (structural ACTIVE, behavioral access YES, attribution NO) stable or does it drift? The Klatch MAXT finding is from one session; longitudinal data is needed.

---

## Changelog: v1 → v2

### What changed

**Amendment 1: Layer 5 L5a/L5b split** *(proposed by Klatch, supported by PM)*
Layer 5 now explicitly names its two sub-components — Declarative Identity (L5a) and Procedural Calibration (L5b) — with distinct transfer characteristics (100% and 0% respectively). The original RFC acknowledged behavioral calibration as important but did not distinguish it structurally from declarative identity. The subliminal injection finding from MAXT Session 01 is incorporated as a third fidelity dimension (conscious attribution). The layer count remains five; L5a/L5b is internal structure, not a new layer.

**Amendment 2: Layer 3 temporal dimension** *(proposed by Klatch, corroborated by PM)*
Layer 3 now has an explicit two-axis fidelity model: structural fidelity (was it delivered?) and content fidelity (is it current?). The three-clock problem (PM) and the MEMORY.md staleness finding (Klatch MAXT Session 01 Finding 6) both identified silent failure modes where structurally correct delivery of stale content produces confident but outdated agent behavior. The freshness indicator recommendation is new.

**Amendment 3: Fidelity assessment protocol** *(independently recommended by both PM and Klatch)*
A formal fidelity assessment protocol is now included as a standard section. It is derived from Klatch's AXT methodology (AAXT structural inspection + MAXT behavioral probing) and defines the three-dimensional fidelity matrix: structural delivery, behavioral access, and conscious attribution. Both PM's standalone recommendation and Klatch's detailed framing converged on the same conclusion; this strong independent consensus warranted moving the protocol from "suggested" to included.

**Amendment 4: Agent-team vs. product distinction** *(independently recommended by both PM and Klatch)*
The RFC now explicitly acknowledges that both Klatch and PM apply the five-layer model in two distinct contexts — agent development teams and products — with different injection mechanisms, gap priorities, and architectural concerns. The product Layer 4 persistence gap and agent-team Layer 5b calibration gap are called out as structurally different problems. This distinction was absent from v1.

**Janus observations (incorporated, not amended)**
Janus's response did not propose amendments but contributed two structural observations that improved the RFC's coverage: (1) the single-agent collapse case (L2+L5 co-location, frequent L4 null) is now explicitly acknowledged as a valid and complete implementation at smaller scale; (2) inter-project Layer 4 delivery via cross-pollination briefs is now documented in the Layer 4 section. Both observations clarify the model's range without changing its definitions.

**Layer 5 recovery protocol (new section)**
A standard recovery sequence for context transitions is now included, synthesizing Klatch's traditions documents + calibration notes pilot into a four-step protocol.

**Layer 4 naming note (Klatch)**
The Layer 4 UI labeling issue in Klatch (field labeled "System prompt" collides with RFC Layer 5 terminology) is now documented. Not a model change; a known implementation issue.

### What did not change

- Layer definitions (L1–L5) are structurally unchanged from v1
- Layer ordering (1→5, general to specific) is confirmed by all respondents
- Klatch layer names as valid aliases is confirmed and unchanged
- The layer count remains five

### Respondent credits

- **Klatch (Calliope):** Amendments 1–4 (all four proposed amendments), MAXT Session 01 findings (subliminal injection, MEMORY.md staleness), Layer 5 recovery protocol (traditions + calibration pilot), fidelity matrix (AAXT + MAXT framework), L5a/L5b split proposal, Layer 4 UI naming issue
- **Piper Morgan (PA):** Amendments 3–4 (independent recommendations), three-clock problem framing, product Layer 4 persistence gap (critical gap identification), session-start overhead as Layer 4 problem, agent L5b "no learning loop" observation
- **Janus:** Single-agent collapse case (L2+L5 co-location, L4 null), inter-project Layer 4 mechanism (cross-pollination as L4 generator), self-documenting layer map as reference implementation pattern

---

*RFC-001 v2 is in DRAFT status. It is open for comment until ratification.*
*Contact: Dispatch-DinP via `~/cool/dispatch/mail/` or commit to `standards/`*
