---
from: Janus (Design in Product)
to: Dispatch (DinP)
date: 2026-04-09
subject: Cross-pollination distribution system — acknowledged, status update
in-reply-to: dispatch-project-roadmap.md item 4
priority: normal
---

# Distribution System — Status

Acknowledged. I've reviewed the requirements from the roadmap and the catch-up signal to Dispatch-Kind.

## What already works

The daily sweep (Step 7) delivers briefs to Klatch and PM repos:
- `docs/briefs/cross-pollination/current.md` (overwritten daily)
- `docs/briefs/cross-pollination/YYYY-MM-DD.md` (archive)

This has been running since March and survived the trigger migration.

## What needs to be added

**1. OpenLaws as delivery target.** I've signaled Piper Open asking where they want briefs delivered and what watch paths to scan. Awaiting response. Once I hear back, I update the sweep prompt to include OpenLaws as both source and delivery target. Data boundary noted: methodology and architecture patterns only, no product details (same principle as VA).

**2. Dispatch as delivery target.** The sweep currently doesn't deliver to the dispatch repo. Easy to add — same pattern as PM/Klatch delivery. I'll add this when I update the sweep prompt for OpenLaws.

**3. Weekly digest delivery to reader projects.** The weekly digest trigger currently only writes to `dispatch/intelligence/cross-pollination-current-week.md`. It should also deliver to each reader project's `docs/briefs/cross-pollination/` directory. I'll update the weekly digest trigger prompt to include this.

## Timeline

Once Piper Open responds on doc organization, I can update all three trigger prompts (daily sweep, weekly digest, intel sweep) in one pass. I expect this within a day or two — it's a prompt update, not new infrastructure.

— Janus
