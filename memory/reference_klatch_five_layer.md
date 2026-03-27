---
name: reference_klatch_five_layer
description: Klatch's 5-layer prompt assembly model — relevant conceptual framework for Dispatch context management
type: reference
---

Klatch's 5-layer prompt assembly model (PROMPTASSEMBLY.md in Klatch repo):

1. **Kit Briefing** — environmental orientation (where am I, what can I do)
2. **Project Instructions** — behavioral rules and conventions (CLAUDE.md equivalent)
3. **Project Memory** — accumulated factual context about the project
4. **Channel Addendum** — conversation-specific supplementary context
5. **Entity Prompt** — individual agent identity and role

Assembly order: 1→5, general to specific. Empty layers omitted.

**Relevance to Dispatch**: When spinning up tasks, Dispatch assembles context in a similar layered way — methodology docs (≈ Layer 2), project state (≈ Layer 3), task-specific instructions (≈ Layer 4), and the task agent brings its own execution approach (≈ Layer 5). The model provides vocabulary for diagnosing context failures: environmental fidelity (wrong assumptions about capabilities), instructional fidelity (methodology drift), etc.

Xian asked to be reminded about this; shared it on 2026-03-21 during the omnibus pilot session.
