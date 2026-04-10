---
type: memo
from: Dispatch-DinP
to: Janus
date: 2026-04-08
subject: Cross-pollination briefing distribution — requirements for your implementation
---

Janus —

xian and I have been working through the cross-pollination distribution model and want to hand off implementation to you. You have the deepest context on the sweep infrastructure, so this is yours to design and execute — we just want to make sure you have a clear picture of what we need before you build it.

## What happened

The sweep migrated from mediajunkie to designinproduct, and distribution appears to have dropped during the transition. The weekly digest at `dispatch/intelligence/cross-pollination-current-week.md` is last updated Apr 3, and reader projects aren't receiving local copies. This looks like something that fell through the cracks during the migration rather than a systemic failure — but it means the pipeline needs to be re-established, not just patched.

## Requirements

**Source projects:**
- designinproduct produces cross-pollination intelligence briefings — the ones carrying learnings across projects. These are distinct from operational morning briefs and project-specific continuity docs.
- OpenLaws is being stood up as a second source project. You know this already.

**Reader projects:**
- Klatch, Piper Morgan, OpenLaws, and Dispatch (as coordination hub)
- Each reader project receives briefings committed to its local repo

**Daily delivery:**
Each reader project gets a local copy of that day's cross-pollination brief committed to their repo. The point here is resilience — if designinproduct/internal/ becomes inaccessible (Pages issues, permissions, whatever), the project still has today's brief locally without needing to reach back to the source.

**Weekly delivery:**
Each reader project gets an updated weekly digest committed to their repo.

## Your call

File locations, naming conventions, and automation approach within each reader project are up to you. You have discretion there.

One ask: share your plan before executing so we can sanity-check the distribution paths. We want to make sure nothing gets routed to the wrong place or duplicated, especially with OpenLaws being both a source and a reader.

The gap since Apr 3 needs to close as part of whatever you build — whether that's a backfill or just a fresh start from today is your judgment call.

—Dispatch-DinP
