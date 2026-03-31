---
RFC: 001
Title: Five-Layer Context Model
Status: DRAFT
Author: Dispatch-DinP
Date: 2026-03-30
Reviewers: Klatch (Calliope), Piper Morgan (Docs, Lead Dev), Archie
---

# RFC-001: Five-Layer Context Model

## Summary

This RFC proposes a shared vocabulary for how AI agents receive context. The model has five layers, each carrying a distinct class of information. It emerged from empirical failures — not from theory — and is already partially implemented in Klatch. The goal is to adopt it as a common standard across Dispatch, Klatch, Piper Morgan, Archie, and any future agents, so that context gaps can be named, diagnosed, and fixed consistently.

---

## Background

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

---

### Layer 2 — Methodology

How the agent is expected to approach work: conventions, standards, processes, and behavioral rules. This is the instructional layer — what CLAUDE.md files contain, what coding conventions are enforced, how deliverables are structured.

**Examples:**
- "Omnibus logs follow the four-tier complexity taxonomy: MINIMAL / STANDARD / HIGH-COMPLEXITY:COORDINATION / HIGH-COMPLEXITY:EXECUTION"
- "Commit messages are prefixed with `[agent-slug]`"
- "Use the actor slug format `Docs`, `CoS`, `Lead Dev` — never full names"
- "Docs is the quality authority; no omnibus log is canonical without Docs review"

**What breaks without it:** Agents drift to generic defaults. Format violations, inconsistent naming, wrong process steps. The v1–v3 omnibus iterations on March 21 all had methodology failures before the taxonomy was injected.

---

### Layer 3 — Project Memory

Accumulated knowledge about the project: decisions made, patterns discovered, what's been tried, what's been rejected, who the players are, what the current state is.

**Examples:**
- BRIEFING-CURRENT-STATE doc, delivery logs, architecture decision records
- "The March 21 omnibus had 9 source logs, not 6 — 3 were Claude Project downloads"
- "Archie's .projects/ folder emptied unexpectedly on March 25 — all content is backed up at VA/dispatch/"
- "Layer 5 is consistently lost in Chat→Cowork imports — this is a known gap, not a failure"

**What breaks without it:** Factual errors and confident confabulation. The Mar 22 synthesis agent inflated a memo count to 48 (the correct number was 15) because it had no grounding in project history. It invented a plausible-sounding number. Project memory is the fact-check layer.

---

### Layer 4 — Delivery Context

The immediate task: what's being asked, what scope is defined, what constraints apply, and what success looks like. This is the most task-specific layer and typically arrives fresh with each assignment.

**Examples:**
- "Synthesize the March 21 omnibus log using the 9 source logs in dev/2026/03/21/"
- "Write a memo to Calliope summarizing the Klatch import structure findings"
- "Scope: this session only; don't update any persistent files without confirmation"
- "Target length: ~300 lines. HIGH-COMPLEXITY:COORDINATION format."

**What breaks without it:** Nothing gets done. This is the most obvious layer — agents always notice when it's missing. The failure mode is prompt refusal or off-target work, both of which are immediately visible.

---

### Layer 5 — Role Identity

Who this agent is: their specialty, their voice, how they relate to xian, how they relate to other agents, and what behavioral calibration has accumulated through prior interactions.

**Examples:**
- "You are Docs, the Documentation and Quality Management agent for Piper Morgan. You are the quality authority for omnibus logs. You communicate in precise, structured prose."
- "You are Dispatch-DinP. You hold cross-project context. You speak plainly and don't editorialize."
- "Theseus: you have been working with xian since March 2026. Your established patterns: always verify file locations before claiming, flag when you're uncertain."
- "Archie: you are the Operational Support Partner for VA Decision Reviews. Your tone is collegial and procedural."

**What breaks without it:** The agent operates competently but without personality or relational calibration. It treats every task as new, applies generic defaults, and may produce work that's technically correct but tonally off. Critically, it won't know when to push back, when to ask, or when xian's intent differs from his stated request. This is the layer most reliably lost in imports and cross-platform migrations.

---

## Layer Relationships

The layers are ordered general-to-specific. Layers 1–3 are typically stable across a session; Layers 4–5 are session-sensitive, though Layer 5 ideally persists across sessions through memory and explicit identity prompts.

```
Layer 1: Environmental Awareness    ← most stable; set by platform/tool config
Layer 2: Methodology                ← stable; stored in CLAUDE.md / project instructions
Layer 3: Project Memory             ← accumulates over time; stored in memory files and briefings
Layer 4: Delivery Context           ← changes per task; provided in prompt or task file
Layer 5: Role Identity              ← ideally stable; degraded by imports and context resets
```

A complete context injection assembles all five. Missing any single layer produces a predictable class of failures.

---

## Existing Implementation: Klatch PROMPTASSEMBLY.md

Klatch already implements this model in `docs/PROMPTASSEMBLY.md` under these names:

| Klatch name | RFC layer | Notes |
|---|---|---|
| Kit Briefing | Layer 1 | Environmental orientation |
| Project Instructions | Layer 2 | Behavioral rules and conventions |
| Project Memory | Layer 3 | Accumulated factual context |
| Channel Addendum | Layer 4 | Conversation-specific supplementary context |
| Entity Prompt | Layer 5 | Individual agent identity and role |

Assembly order is 1→5 (general to specific); empty layers are omitted. This RFC proposes adopting Klatch's implementation as the reference and aligning the terminology across projects. The Klatch layer names are preserved as valid aliases.

---

## Import Fidelity Implications

When a Claude Chat project is imported into Cowork (or any similar migration), the five-layer fidelity is asymmetric:

| Layer | Import fidelity | Notes |
|---|---|---|
| Layer 1 | High | Environment is re-established at session start |
| Layer 2 | High | CLAUDE.md / project instructions transfer directly |
| Layer 3 | High | Knowledge documents copy at 100% rate (observed in Archie import, Mar 23) |
| Layer 4 | N/A | Task context is per-session; doesn't apply to imports |
| Layer 5 | **Low** | Conversation history not imported; behavioral calibration not preserved |

This means imported agents are knowledgeable but uncalibrated. They know what the project contains but don't know how xian works or how they've adapted to him. Layer 5 must be explicitly rebuilt after migration — through entity prompts, onboarding sessions, or a calibration task.

This also means: **don't evaluate an import's quality based on Layer 5 alone.** A freshly imported agent that makes tone or register errors isn't broken at Layers 1–4. It's missing its relational history and needs time to reacquire it.

---

## Proposed Actions for Each Project

Each project team is asked to:

1. **Map current context injection to the five layers** — identify what's being injected today and which layer it belongs to
2. **Identify gaps** — which layers are partially or fully absent in typical agent sessions?
3. **Document the mapping** in a short note (see review format below) — this doesn't require building anything yet, just naming what exists

This RFC is not asking any project to change their implementation now. It's asking for visibility into the current state so we can prioritize gaps together.

---

## Review Process

**Deadline**: No hard deadline. This is a working group, not a release train.

**To ratify**: Klatch and Piper teams respond with their layer mapping and any amendments to the layer definitions. If the definitions don't fit a use case well, that's important signal. Archie is invited to map VA context injection as well.

**Format for response**:

```markdown
## [Project name] — Layer Mapping Response

**Layer 1 (Environmental)**: [What you inject / gap]
**Layer 2 (Methodology)**: [What you inject / gap]
**Layer 3 (Project Memory)**: [What you inject / gap]
**Layer 4 (Delivery Context)**: [What you inject / gap]
**Layer 5 (Role Identity)**: [What you inject / gap]

**Proposed amendments**: [Any changes to definitions, names, or structure]
**Concerns or questions**: [Open issues]
```

Responses should be delivered as signals to Dispatch's mail inbox (`~/cool/dispatch/mail/`) or committed to this directory as `standards/FIVE-LAYER-CONTEXT-MODEL-RFC-[project]-response.md`.

**Ratification**: When all responding teams have mapped their layers and no unresolved amendments remain, Dispatch will update the status to RATIFIED and RFC-001 becomes the canonical reference.

---

## Open Questions

- **Klatch layer names vs RFC layer names**: Should we unify terminology or keep both in parallel? Preference is to treat Klatch names as valid aliases, but this warrants team input.
- **Layer 5 recovery protocol**: Is there a standard approach for rebuilding behavioral calibration after an import or context reset? Klatch's AXT methodology may already have one.
- **Layer ordering for injection**: Klatch assembles 1→5. Are there cases where a different order matters?
- **Sublayers**: The Mar 23 Klatch MAXT findings identified a "subliminal injection" issue in Layer 5. Does this imply Layer 5 needs to be split?

---

*RFC-001 is in DRAFT status. It is open for comment.*
*Contact: Dispatch-DinP via `~/cool/dispatch/mail/` or commit to `standards/`*
