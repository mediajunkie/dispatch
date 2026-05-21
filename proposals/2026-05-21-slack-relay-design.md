---
title: Slack relay — design doc for the scheduled task that routes Slack channel content to PO / Vergil / xian
date: 2026-05-21
author: Dispatch-Kind (in dialogue with xian)
status: draft — design only; no implementation yet
related: proposals/2026-05-19-cross-pollination-adoptions.md (sibling working-through-proposals batch)
---

# Slack relay — design

## Goal

Build a scheduled DK task that scans xian's Slack channels for new messages, classifies them, summarizes them, and routes them to the right assistant (Piper Open, Vergil, or xian's attention queue) as draft signals for xian to review and dispatch.

The motivating problem: xian manually copy-pastes Slack updates to his assistants because they don't automatically see what's in those channels. The manual relay is intermittent, depends on him noticing pile-up, and produces occasional double-conveyance because he can't remember if he already sent something.

## Non-goals

- Replace xian as the source of fresh directives. Directives always come from xian directly; this task is informational + loop-closing relay only.
- Auto-action anything in Slack (no posting, no reacting, no thread-replying — read-only).
- Build a generic Slack-to-anywhere relay. Single-channel MVP, then expand once the loop is reliable.
- Replace PO or Vergil reading Slack themselves if they're already doing so. Open question, see below.

## Confirmed decisions (xian 2026-05-21)

1. **Start with one channel — the BET channel.** Expand to other channels (link/article channels) only after the MVP loop is reliable.
2. **Draft mode for the MVP.** Outputs are draft signals to a holding area; xian reviews and promotes to real signals. Auto-dispatch deferred until classifier quality is validated.
3. **Initial classification taxonomy is fine for v1.** Iterate over time.
4. **xian's own posts:** convey to PO and Vergil for informational and loop-closing purposes, but NOT as fresh directives. Fresh directives come from xian directly. Future enhancement: if the classifier detects an implied action, verify with xian (do NOT propagate to PO/Vergil yet). Out of scope for v1.
5. **Repos are private.** Sensitivity-filter requirements are lower than initially feared, but still worth a basic content check.
6. **Cowork scheduled task pattern.** Use built-in affordances; spawn `start_code_task` for the real work (per DinP's now-canonical architecture from the 2026-05-15 ghost-run-fix).
7. **Err on over-communicating while avoiding stale (zombie) data propagation.** Classifier favors signal over silence; deduplication is critical to avoid re-conveying handled material.

## Open questions (need resolution before implementation)

### Q1. Do PO and Vergil already read Slack themselves?

xian's read: probably not, but he hasn't asked or tested. Two possible outcomes drive different behaviors:

- **They DO read Slack** → this task is a *router*: classify, flag urgency, route to the right party with a one-line "this is for you." Avoids relaying full message content.
- **They DON'T read Slack** → this task is a *relay*: convey summarized content so PO and Vergil don't need to read Slack themselves.

**Proposed resolution path:**

1. xian asks PO and Vergil directly (in the next session or via signal): "Do you currently read the BET channel? If yes, what's your cadence and what's the SKILL.md/script doing the read?"
2. If they're not reading Slack today and DK builds the relay, also decide: do we want to *enable* them to read Slack themselves, with this task as a discovery + classification layer over the raw read? Or is DK the canonical Slack reader for the constellation?
3. Side note: xian floated the idea that there might be a more direct mechanism (a skill or standard for PO/Vergil to check Slack on their own). Worth exploring as part of Q1 resolution.

For the v1 implementation, design both modes — the draft-signal output shape works for either. The differentiator is *what content* goes in the signal: full summarized message (relay mode) vs. one-line pointer (router mode).

### Q2. What counts as "the BET channel"?

Need the canonical channel name / ID from xian. There's at least one Slack channel where Vergil, Piper Open, John, and xian discuss bet-1 work. Confirm the exact channel before implementation.

### Q3. Slack MCP availability + access scope

There's a Slack MCP available in the Cowork environment (`mcp__7fddc9e6-af93-44e0-83da-ac36ff490e5b__slack_*`) with tools for `slack_read_channel`, `slack_read_thread`, `slack_search_*`, `slack_read_user_profile`. Confirm:

- Is this xian's Kind Systems Slack workspace?
- Does the MCP have access to the BET channel specifically?
- Are private DMs / private channels excluded by default? (Should be — we only want named channels.)

### Q4. Sensitivity filter implementation

Even with private repos, some content shouldn't propagate verbatim:
- Customer names + contract details (legal/business risk)
- Personal data (employees, candidates, partners)
- Specific legal data per the dispatch CLAUDE.md data-boundary policy

Two-layer filter:
1. **Allowlist of channels** — only listed channels are processed; everything else is silently ignored.
2. **Content classifier** — for processed channels, a per-message check that flags messages containing customer names / contract values / specific legal queries. Flagged messages either: (a) get a redacted summary, or (b) get a "DK held back from relay — sensitive content" stub for xian's review.

Iterate the content classifier over time based on what actually shows up in the channel.

## Architecture

### Component diagram

```
Cowork scheduled task (slack-relay-hourly)
  ↓ spawns
start_code_task (slack-relay-run)
  ↓ uses
Slack MCP (read_channel, read_thread, read_user_profile)
  ↓ writes
dispatch/mail/drafts/  (proposed signals — xian reviews)
dispatch/intelligence/slack-relay-state.json  (per-channel last-seen + per-thread summaries)
  ↓ xian reviews and runs
dispatch/scripts/promote-slack-drafts.sh  (moves draft → real signal in mail/)
```

### Run shape (per scheduled fire)

1. **Phase 0: Pull origin** (Phase-0 discipline; verify-before-querying).
2. **Phase 1: Read state.** Open `slack-relay-state.json` and find the last-seen timestamp for each allowlisted channel.
3. **Phase 2: Pull new messages.** For each channel, fetch all messages since the last-seen timestamp.
4. **Phase 3: Classify.** Per message (or per thread for threaded discussions), classify into one of:
   - **Action for Vergil now** (PR review request, build break, code question)
   - **Action for PO now** (decision needed, deliverable due, methodology call)
   - **Action for xian** (something only xian can resolve; goes to `xian-attention-queue.md`)
   - **Reference material** (article link, methodology pointer — convey as one-line FYI)
   - **xian directive to others** (xian's own posts that contain a directive — DO NOT propagate as a fresh directive; convey only as a "this happened on Slack" closing-loop note)
   - **Pure chatter / social** (skip, but log skipped count for visibility)
   - **Sensitive — held back** (per the sensitivity filter; surfaced to xian only)
5. **Phase 4: Summarize.** For each non-skipped message/thread, generate a one-paragraph summary plus the action shape.
6. **Phase 5: Write draft signal.** Drop into `dispatch/mail/drafts/` with a filename that encodes the channel + timestamp + target.
7. **Phase 6: Update state.** Bump per-channel last-seen timestamp. Persist any per-thread summary metadata (see Q5 below).
8. **Phase 7: Commit + push.** safe-push.sh; pre-commit hook applies as normal.

### Manual trigger

xian messages DK in a Cowork session: "run slack-relay now." DK spawns the same `start_code_task` that the scheduled task would spawn. Same code path, same state file, same outputs. Idempotent: if nothing's changed since last run, the task writes nothing.

### Per-thread summary (xian's future-version idea)

xian flagged: future v2 could maintain a summary per thread (keyed by unique thread ID). When new messages arrive in a known thread, the agent reads the existing summary + the new tail, decides whether the tail changes the picture, and updates the summary only if needed. Skips re-reading the full thread except when uncertain.

This is a meaningful optimization for long-running threads — without it, every cycle re-summarizes long threads from scratch.

**Proposed v2 schema** (forward-compatibility for v1):

```json
{
  "channels": {
    "BET_CHANNEL_ID": {
      "last_seen_ts": "1716329400.000000",
      "channel_name": "bet-sandbox-or-actual-name"
    }
  },
  "threads": {
    "THREAD_ID": {
      "channel_id": "BET_CHANNEL_ID",
      "summary": "Discussion of PR #44 review by Jerry — open question about ToolAnnotations decoration approach...",
      "last_message_ts": "1716329450.000000",
      "message_count": 12,
      "needs_full_reread": false
    }
  }
}
```

v1 only populates `channels`; `threads` stays empty until v2.

### Sensitivity gating

Implementation sketch:

```python
SENSITIVE_PATTERNS = [
    # customer / contract indicators
    r"\$\d+(?:,\d{3})*",          # dollar amounts
    r"\bclient[: ]",              # client identifiers
    r"contract\s+(?:value|terms)",
    # add as patterns emerge from real channel content
]

def is_sensitive(message_text):
    return any(re.search(p, message_text, re.IGNORECASE) for p in SENSITIVE_PATTERNS)
```

Sensitive messages → held-back stub for xian's review, no relay until xian sanctions.

## Classification taxonomy (v1)

Per Q4 above:

| Class | Routing | Output shape | Example trigger |
|-------|---------|--------------|-----------------|
| Action for Vergil now | Draft signal to Vergil | Title: action ask + context; body: summarized thread | "Vergil, can you take a first pass at PR #44?" |
| Action for PO now | Draft signal to PO | Same shape | "PO, we need a decision on schema X by EOD" |
| Action for xian | Append to xian-attention-queue.md | One-line queue item with link | A blocker only xian can resolve |
| Reference material | Draft signal to PO (default) + optional Vergil cc | Title: "FYI worth reading: <topic>"; body: one-line summary + link | An article link xian posts |
| xian directive in channel | Draft signal to relevant assistant | Title: "Loop-close: xian posted X in #channel"; body: contextualize so they know what xian already said publicly. **Do NOT treat as fresh directive.** | xian posts "I think we should X" |
| Pure chatter / social | Skip; log count | None | Banter, reactions, GIFs |
| Sensitive — held back | Surface to xian only | Stub in `dispatch/mail/drafts/xian-review/` | Customer name + contract detail |

## Deduplication

Two layers:

1. **Per-channel last-seen timestamp** (in state file): the primary mechanism — we only process messages newer than the last successful run.
2. **Per-thread summary** (v2): if we've already summarized a thread, we don't re-summarize it from scratch on every new message; we update the running summary.

For v1, layer 1 alone is sufficient. If a thread spans multiple runs, each run handles only the new tail. Acceptable risk: a single very long thread that crosses many runs would produce multiple draft signals, but the dedup-by-thread-ID work in v2 fixes that.

## Implementation phases

- **Phase 0 (now)** — This design doc. Commit it. xian ratifies the open questions (especially Q1 and Q2). No code touches Slack until Q1 + Q2 are resolved.
- **Phase 1: Manual-run prototype.** Build the SKILL.md + Code-task wrapper. Run manually against the BET channel; outputs go to `dispatch/mail/drafts/`. xian reads drafts and validates classification + routing. Iterate the classifier prompt until ≥80% of drafts are correctly classified.
- **Phase 2: State persistence.** Add `slack-relay-state.json` with per-channel last-seen. Still manual trigger; just stateful now.
- **Phase 3: Promotion script.** `scripts/promote-slack-drafts.sh` moves draft → real signal in `mail/` with one xian command per draft (or batch).
- **Phase 4: Cowork scheduled task.** Wrap in a Cowork scheduled task; hourly weekday cadence. Manual trigger remains.
- **Phase 5: Per-thread summary** (v2). Add `threads` to state file; smart re-summarization on tail.
- **Phase 6: Expand channel scope.** Add the link/article channels per xian's allowlist.

Do not move past a phase until the prior phase's output is reliable.

## Risks

| Risk | Likelihood | Mitigation |
|------|-----------|------------|
| Classifier misroutes (Vergil thing → PO, or vice versa) | High at v1 | Draft mode + xian review for all drafts in Phase 1; iterate classifier prompt. |
| Over-conveyance (chatter relayed as signal) | High at v1 | Strict skip rule for chatter; PO/Vergil feedback in Phase 1; tune. |
| Under-conveyance (subtle but important item skipped) | Medium | Phase 1 review against full channel diff; xian catches misses. |
| Duplicate conveyance (same message relayed twice) | Low if state file works; High if state file gets corrupted | State file is committed to dispatch repo; reset is `git checkout`-able. Add a per-message-ID hash as a secondary check. |
| Sensitive content propagates verbatim | Low (private repos + sensitivity filter) | Two-layer filter; held-back stub for xian's review on flagged items. |
| Slack MCP rate limits | Low for hourly cadence | Use `since_ts` to fetch only new messages; don't bulk-read. |
| Zombie data (a draft signal references state that's already resolved) | Medium | Phase 0 pull discipline before any classification; flag any message older than 24h with caution. |

## Success criteria (Phase 1 → Phase 4 gates)

- **Phase 1 → 2**: ≥80% of drafts classified correctly by xian's read. No misrouted drafts in the last 7 cycles.
- **Phase 2 → 3**: state file survives 14 days of manual runs without corruption; no duplicate-conveyance incidents.
- **Phase 3 → 4**: xian's review time per draft trends downward; the promote-script is used at least 5 times.
- **Phase 4 production**: PO and Vergil confirm the relayed signals are useful and not noisy; no false-positive sensitivity-filter incidents.

## Cross-references

- **Daily briefing recipe pattern** (`dispatch/mail/memo-dispatch-dinp-to-dispatch-kind-daily-briefing-recipe-2026-05-19.md`) — same architectural shape (Cowork → start_code_task → bash + git over HTTPS via PAT; sandbox-first; safe-push on the output).
- **Ghost-run-fix memo** (`dispatch/mail/memo-dispatch-dinp-to-dispatch-kind-ghost-run-fix-2026-05-15.md`) — the lesson DinP learned that motivates the start_code_task pattern over direct osascript work.
- **DinP scheduled-task SKILL.md files** (in `~/Documents/Claude/Scheduled/dinp-*/`) — reference for our own scheduled-task SKILL.md shapes.
- **Cross-pollination adoption proposals** (`dispatch/proposals/2026-05-19-cross-pollination-adoptions.md`) — sibling working-through batch; complementary discipline imports.

## What I need from xian to proceed

1. **Q1 resolution:** ask PO and Vergil about their Slack read status — or sanction DK to ask them via signal.
2. **Q2 resolution:** confirm the canonical BET channel name + ID.
3. **Q3 resolution:** confirm the Slack MCP can read that channel (will test in Phase 1).
4. **Q4 calibration:** start with the proposed sensitivity patterns; iterate as real content shows up.
5. **General ratification:** is this the shape we want? Or should anything be different before Phase 1?

— Dispatch-Kind, 2026-05-21
