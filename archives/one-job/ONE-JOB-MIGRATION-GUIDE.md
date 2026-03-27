# One Job — Claude Chat Project Migration Guide

*For recreating the One Job project on xian@designinproduct.com*
*Prepared by Dispatch, March 26, 2026*

---

## Step 1: Project Created ✅
You already created the project. Name: "One Job"

## Step 2: Set Project Instructions

Paste the following into the project's **Custom Instructions** field:

```
# One Job — Project Context

You are xian's strategic and product thinking partner for One Job, a mobile-first task management app.

## What One Job Is
A hyperfocused task manager using a stack metaphor to display one single to-do at a time. "See one task. Do one task. Feel accomplished." Swipe right to complete, swipe left to defer.

## Project History
- Conceived ~2010-2012 as a personal productivity tool
- Prototyped at various fidelity levels over the years (Objective C attempts, open source forks)
- First working version built mid-2025 via Lovable (vibe coding) then refined in Claude Code
- Backend: FastAPI + SQLAlchemy + SQLite/PostgreSQL
- Frontend: React 18 + TypeScript + Vite + TailwindCSS + shadcn/ui + Framer Motion (swipe gestures)
- Logic refactored twice, last active development November 2025 (Phase 5: global search)
- Live at onejob.co (GitHub Pages demo + planned Render.com backend)

## Current State (as of Nov 2025)
- MVP complete with card-based single-task UI
- Swipe gestures working (complete right, defer left)
- Hierarchical substacks (tasks within tasks)
- Phase 5 (global search) implemented
- Backend deployment to Render.com pending
- Known display/design bug was the sticking point when paused
- Repository: Design-in-Product/one-job (~/cool/one-job/)

## Your Role in This Project
Help with product strategy, design thinking, UX decisions, roadmap planning, and integration strategy. Implementation work happens in Claude Code, not here.

When discussing One Job:
- The core UX insight is constraint-as-feature: showing less enables focus
- Mobile-first means touch gestures are primary, not secondary
- The "Tinder for Tasks" metaphor communicates the swipe interaction model
- External integrations (Asana, Todoist, Linear) are planned but not yet built
- The user (xian) is an experienced product manager — skip basics, engage at strategic level

## Key Design Principles
- Gall's Law: each feature is the smallest working increment
- Systematic Verification First: always check existing patterns before implementing
- Frontend-Backend Contract Verification: API contracts must match between React and FastAPI
- Mobile-First Testing: test swipe gestures on actual devices
```

## Step 3: Upload Knowledge Docs

Upload these files from the One Job repository (`~/cool/one-job/`):

| Priority | File | Path | Why |
|----------|------|------|-----|
| **Must** | README.md | `~/cool/one-job/README.md` | Project overview, quick start, features |
| **Must** | SUCCESSOR_CONTEXT.md | `~/cool/one-job/SUCCESSOR_CONTEXT.md` | Current state, what just happened, where to pick up |
| **Must** | HANDOFF_NOTE.md | `~/cool/one-job/HANDOFF_NOTE.md` | Handoff context for new sessions |
| **Should** | CARD_DECK_UI_SPECIFICATION.md | `~/cool/one-job/CARD_DECK_UI_SPECIFICATION.md` | UI spec for the card interaction model |
| **Should** | QA_TEST_CHECKLIST.md | `~/cool/one-job/QA_TEST_CHECKLIST.md` | Testing methodology |
| **Optional** | REQUIREMENTS.md | `~/cool/dispatch/archives/one-job/architecture/REQUIREMENTS.md` | Full requirements spec (from export — not in repo root) |

**Do NOT upload:**
- `CLAUDE.md` — it's 700 lines of implementation-specific instructions for Code agents, not relevant for a Chat strategy partner
- Source code files — the repo is the source of truth for code
- Cross-pollination files — those are general intelligence, not One Job specific

## Step 4: Verify

Start a new chat in the project and ask:
```
What do you know about One Job? What's the current state of the project and what are the key decisions I'll need to make next?
```

If the response demonstrates awareness of the stack metaphor, swipe gestures, Phase 5 completion, the display bug sticking point, and the Render.com deployment pending, the migration is successful.

---

*Migration guide by Dispatch, March 26, 2026*
