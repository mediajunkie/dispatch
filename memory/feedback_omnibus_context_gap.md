---
name: feedback_omnibus_context_gap
description: Docs agent's diagnosis of why automated omnibus synthesis makes factual errors — missing Layer 3/5 context
type: feedback
---

Automated omnibus synthesis produces structural/format quality that meets methodology standards, but makes factual errors that Docs catches because the synthesis subagent lacks deeper project context.

**Why:** The subagent gets methodology docs (Layer 2 equivalent) and raw session logs, but is missing:
- Layer 3 (project memory): Can't sanity-check facts like memo counts, M1 percentages, or proposal numbering
- Layer 5 (role identity): No accumulated judgment about what matters for causality chains vs noise
- Layer 1 (environmental orientation): Doesn't know what other artifacts (delivery logs, briefings, trackers) exist for cross-referencing

Docs has direct-participant advantage (was there for the events) plus months of omnibus-writing judgment. The gap isn't fully closable, but injecting richer context at Layers 1/3/5 would reduce factual errors significantly.

**How to apply:** Before running omnibus synthesis, assemble context layers:
- Include BRIEFING-CURRENT-STATE.md and recent delivery logs (Layer 3)
- Include relevant role briefings (Layer 5)
- Tell the subagent what artifacts exist for cross-referencing (Layer 1)
- Always have Docs review before committing — Docs is the quality authority
