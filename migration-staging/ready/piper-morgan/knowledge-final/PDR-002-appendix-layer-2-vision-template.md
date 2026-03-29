# PDR-002 Appendix: Layer 2 Vision (History Sidebar)

**Parent PDR**: [PDR-002: Conversational Glue](link)  
**Version**: 1.0  
**Created**: February 6, 2026  
**Owner**: CXO  

---

## 1. Purpose of Layer 2

_What is this layer for? What user need does it serve?_

Layer 2 is the **User History** layer of the Three-Layer Context Persistence Model. It surfaces accumulated knowledge â€” not just older conversations, but the entities, work items, and patterns that emerged from those conversations.

**Layer 2 is NOT**:
- A duplicate of the conversation list (Layer 1)
- Just conversations with different styling
- An archive of old chats

**Layer 2 IS**:
- [CXO to define: what it actually is]

---

## 2. Target State

_What will users eventually see? Describe the end state, not the current state._

When Layer 2 is complete, users will see:

### 2.1 Primary Content
- [CXO to define: what entities/objects appear]
- [CXO to define: how they're organized]

### 2.2 Interactions
- [CXO to define: what users can do]

### 2.3 Trust-Gated Features
- [CXO to define: what appears at different trust levels]

---

## 3. Design Principles

_What principles guide design decisions for this layer?_

### 3.1 Temporal Orientation
- Layer 1 (Conversation List): **Present/Active** â€” "What am I working on now?"
- Layer 2 (History Sidebar): **Past/Accumulated** â€” "What have I built up over time?"

### 3.2 [Additional Principle]
_[CXO to add as needed]_

### 3.3 [Additional Principle]
_[CXO to add as needed]_

---

## 4. Phase Roadmap

_What phases will implementation follow?_

| Phase | Scope | Milestone |
|-------|-------|-----------|
| Phase 1 | Differentiate from conversation list (MVP) | M0 |
| Phase 2 | [CXO to define] | [TBD] |
| Phase 3 | [CXO to define] | [TBD] |
| Phase 4 | [CXO to define] | [TBD] |

**Current phase status**: See [BRIEFING-CURRENT-STATE](link) â€” do not duplicate status here.

---

## 5. Anti-Patterns

_What flattening traps should implementing agents avoid?_

| Anti-Pattern | Why It's Wrong | Correct Approach |
|--------------|----------------|------------------|
| "Just show conversations" | Duplicates Layer 1; misses Layer 2 purpose | [CXO to define] |
| [Additional anti-pattern] | [Why] | [Correct approach] |
| [Additional anti-pattern] | [Why] | [Correct approach] |

---

## 6. Implementing Issues

_Which GitHub issues implement this layer? Agents working on these issues should read this document first._

| Issue | Title | Phase |
|-------|-------|-------|
| #425 | MUX-IMPLEMENT-MEMORY-SYNC | Origin |
| #706 | MUX-OBJECTS-VIEWS | Phase 2 |
| #785 | History Sidebar differentiation | Phase 1 |
| [Add as created] | | |

**For implementers**: Before starting work on any issue above, ensure you can answer: "How does my implementation embody Layer 2's purpose (accumulated knowledge, not just older conversations)?"

---

## 7. Related Documents

_Architecture and implementation details live elsewhere._

| Document | Relationship |
|----------|--------------|
| [PDR-002: Conversational Glue](link) | Parent PDR defining Three-Layer Model |
| [ADR-054: Cross-Session Memory](link) | Technical architecture for memory persistence |
| [ADR-053: Trust Computation](link) | How trust levels are calculated |
| [ADR-045: Object Model](link) | Entity definitions (WorkItem, Feature, etc.) |
| [domain-models.md](link) | Entity lifecycle states |

---

## Changelog

| Version | Date | Author | Change |
|---------|------|--------|--------|
| 1.0 | 2026-02-06 | CXO | Initial draft |

---

_This is a vision document. It describes intent and behavior, not implementation. For technical details, see linked ADRs and issues._
