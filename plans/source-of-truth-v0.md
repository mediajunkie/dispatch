---
title: Dispatch Source of Truth — v0 design sketch
author: Dispatch-DinP
date: 2026-04-11
status: draft for discussion
---

# Source of Truth for Decisions and Status

## Problem

Serial updates are lossy. The current approach — write memos, log summaries in the activity log, hope everyone reads them — generates zombie facts at a reliable rate because:

1. **Memos are append-only and uncorrelated.** There is no thread identity, so "PA responded to the Haiku 3 ask" is a fact that lives only in Dispatchs head, not in a place you can query. When Dispatchs head is a fresh session, the link evaporates.
2. **The activity logs carried queue drifts stale.** It is a log, not a ledger. Items get added to "pending" and rarely get explicitly removed when resolved — they just fall off eventually when nobody notices. In the meantime, they get propagated forward to the next days brief as still-pending, which is how zombies spread.
3. **Agents land at session start without knowing which memos are still binding.** A decision recorded six memos ago is invisible unless you happen to know it exists. Re-litigation follows.
4. **Decisions and status are mixed together.** "Klatch v0.9.0 shipped" (status, changes often) and "Argus sweep is split into automated plus curated" (decision, rare to overturn) live side-by-side in the same activity log entries, even though they have opposite access patterns.

## Design principles

1. **One canonical place per thing-that-changes.** No duplication. The brief, the activity log, and every agent reads from the same files.
2. **Separate append-only from latest-wins.** Decisions are a ledger (never rewrite history). Status is a snapshot (overwrite freely).
3. **Machine-parseable enough for Dispatch to query, human-readable enough for xian to skim.** YAML frontmatter plus markdown body, one entity per block.
4. **Ask-reply pairing is a first-class operation.** When an ask is resolved by a reply memo, the state file must know it, not just Dispatchs session memory.
5. **Writers are small in number, readers are everyone.** v0: only Dispatch writes to state/. Agents signal changes via memos, Dispatch reflects them into state. v1: we can let Janus and others write directly if the bottleneck bites.

## File layout

Proposed directory: `~/cool/dispatch/state/`

### `state/decisions.md` — append-only decision ledger

Each decision is a block. Never edit or delete. If a decision is reversed, write a new one that supersedes it by ID. The file is an ordered list of blocks newest-first (so the top of the file is the most recent state).

Block format:

```markdown
---
id: D-2026-04-10-argus-split
date: 2026-04-10
title: Split Argus sweep into automated external scan + curated internal assessment
deciders: [xian, Janus]
supersedes: [D-2026-04-04-argus-nudge-only]
status: active
---

External news scanning is now a CCR scheduled trigger ("Klatch External Intel Sweep", Mondays 9 AM PT on dinp). Internal curation and quality assessment still require Argus session context.

**Why**: The nudge-only approach from D-2026-04-04 wasnt holding — raw scans kept going stale because Argus wasnt session-starting, and the external-news half doesnt actually need human context.

**How to apply**: The daily brief flags ">14 days since Argus *curated*" (not since sweep ran), and "external scan dark after Monday" = system failure flag. See memo-janus-to-dispatch-argus-sweep-split-2026-04-10.md for the full writeup.
```

Why markdown instead of JSON/YAML-only: humans need to read this, the rationale text is the whole point, and `grep "status: active"` still works.

### `state/status.md` — current-snapshot status board

Latest-wins. Dispatch updates this file whenever a status item changes. Old versions are in git history; the file itself is always the current state.

Sections by project. Each item is a short block:

```markdown
## Klatch

- **Release**: v0.9.0 shipped 2026-04-10 (Step 9 — Files & Context Architecture)
- **Next milestone**: Step 10 (phasing plan filed, 5 phases, not yet started)
- **LinkedIn post**: draft committed 2026-04-10, awaiting xian publish
- **Active agent**: Calliope (wrapped Apr 10, next session TBD)

## Piper Morgan

- **Sprint**: week N of M1 push, workstream review pending
- **Gate-blocking bug**: todo delete bug — unresolved (todo completion bug was a separate PR, #926/#904, landed 2026-04-10)
- **Active agents**: PA (daily cadence), Lead Dev (recent), Docs (todays blog post)

## OpenLaws
...
```

Rules:
- If an item is no longer active, it gets removed from status.md (not crossed out, not "[RESOLVED]"). Its history lives in git.
- No dates inside items unless the date IS the status (e.g., "shipped on X"). Counts like "N days old" are anti-patterns — they zombie fast.
- Max ~5 bullets per project. More than that is a sign the project has substructure that needs its own file.

### `state/asks.md` — open asks with ask-reply pairing

Each ask is an entry. Status moves from `open` -> `acknowledged` -> `resolved`. Never `silent` or `overdue` on its own — those are computed, not stored.

```markdown
---
id: A-2026-04-07-pa-haiku3
date: 2026-04-07
from: Dispatch-DinP
to: PA
subject: Haiku 3 retirement verification
ask-memo: mail/memo-dispatch-to-pa-haiku3-verification-2026-04-07.md
status: resolved
reply-memo: mail/memo-pa-to-dispatch-haiku3-response-2026-04-09.md
resolved-date: 2026-04-09
---

PA confirmed 3 files in services/ need Haiku 4.5 updates. Routed to Lead Dev.
```

When the brief checks "is this ask pending?", it reads asks.md and filters by `status: open` or `acknowledged`. Resolved asks are invisible to the brief by default, but retained for history. If an ask sits in `open` for >N days, the brief flags it — but *only* after confirming there is no reply memo (anti-zombie check).

## How the daily brief uses it

Today, the brief reads the activity logs carried queue. Under this design:

1. **"Needs Your Attention"** reads `state/asks.md` filtered by `status != resolved`, cross-references with `mail/` for reply memos (anti-zombie check), and updates status inline if a reply is found.
2. **"Carried Queue"** reads `state/status.md` and shows project-level current state.
3. **"Decisions"** (new optional section) surfaces any decision made in the last 7 days from `state/decisions.md`, so xian sees what the agents have been agreeing on.
4. **Activity log** goes back to being just a log — a journal of what happened, not a ledger of what is pending. The brief stops pulling pending-item claims from it.

## Write flow

Who writes when?

- **Decision made in a memo**: When Dispatch reads a memo containing a decision (e.g., Januss Argus split memo), Dispatch appends a decision block to `decisions.md` with a reference to the source memo. One-way pipeline: memo -> decision block.
- **Status change**: When Dispatch learns a status has changed (from a commit, a memo, a conversation), Dispatch edits the relevant block in `status.md`. Git preserves the history.
- **Ask raised or resolved**: When Dispatch sends a memo that is an ask, it creates an entry in `asks.md` with `status: open`. When a reply memo is found, Dispatch updates the entry to `status: resolved` and records the reply path.

v0: Dispatch is the sole writer. Agents dont touch state/ directly — they just send memos, and Dispatch reflects them. This is simpler and avoids merge conflicts, at the cost of a Dispatch-shaped bottleneck.

v1 (later): If the bottleneck hurts, we can let agents write directly to their own section of status.md, with a naming convention per project.

## Interop with Piper Opens parallel plan

You mentioned PO is drafting a similar plan on the OpenLaws side. Id like to compare notes before locking this in. Possible outcomes:

- **Same shape, different files**: each project has its own state/ directory with the same format. Cross-project lookups are straightforward greps.
- **Same file, shared via dispatch**: OpenLaws pushes its state blocks into `~/cool/dispatch/state/status.md` under an OpenLaws section, and dispatch becomes the federation point. More centralized, more coordination cost.
- **Completely different shape**: POs plan is optimized for OpenLaws problem (which might be different — e.g., legal research has different state granularity than product development). We learn what works and cross-pollinate rather than unify.

My vote: start with Dispatch-only, same shape in OpenLaws when POs plan drops. Dont federate until both versions have run for a week and we know what is missing.

## What this doesnt solve

- **Agents not reading the brief**: state/ makes the brief accurate, but an agent still has to check it at session start. This is a session-bootstrap discipline problem, not a file-layout problem. Separate fix.
- **Conflicting decisions by different agents**: if Janus and Piper Open make incompatible commitments, state/ shows the conflict but doesnt resolve it. Escalation still runs through xian.
- **Freshness of the writes themselves**: if Dispatch fails to reflect a memo into state/, state/ is wrong. The anti-zombie rule in the daily brief prompt is a belt, this is a pair of suspenders, but together they are still not immune.

## What I want to discuss

1. Does the decisions/status/asks split match how you think about this?
2. Is `state/` the right directory name or should it be something else (`ledger/`, `truth/`, `current/`)?
3. How much do you want me to wait for POs plan before writing any code?
4. v0 bootstrap: do I backfill from the existing activity log plus memos, or start clean from today forward?
5. Should the brief start reading from state/ on the next run, or do we want a shadow period where brief reads both and flags discrepancies?

---

Ready when you are.
