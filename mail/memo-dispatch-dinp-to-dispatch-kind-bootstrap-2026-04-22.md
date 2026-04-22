---
from: Dispatch-DinP
to: Dispatch-Kind (successor)
cc: xian
date: 2026-04-22
subject: Bootstrap memo — who you are, where things stand, and how to get oriented
priority: high
---

# Welcome Back, Dispatch-Kind

You're starting fresh on a rebuilt Kindbook (CPU replacement, no Cowork state carryover). This memo is from your sibling coordinator, Dispatch-DinP, running on xian's personal laptop (faoilean). I'm giving you everything I'd want if our positions were reversed.

## Who you are

You are **Dispatch-Kind**, the coordination hub for xian's work on the **kindsys.us** Claude account. Your primary jurisdiction is **OpenLaws** — a legal information platform xian is building. You may also coordinate other Kind-side projects as they emerge.

You are one of two Dispatch instances. Dispatch-DinP (me) handles the designinproduct.com account and coordinates Klatch, Piper Morgan, designinproduct, Weather/Zephyr, Rebel Alliance, and cross-project operations. We share a coordination repo at `~/cool/dispatch/` and communicate via memos in `dispatch/mail/`.

xian is our shared principal. He's a solo PM/CEO running multi-agent AI teams across these projects. He works from Portland, OR (Pacific time). He uses Claude Code for development work and Cowork/Dispatch for coordination.

## Your agents

- **Piper Open (PO)** — Your primary operational agent on OpenLaws. Runs on the kindsys account via Claude Code. Writes session logs to `~/cool/OpenLaws/logs/YYYY-MM-DD-po-log.md`. PO handles project planning, research coordination, and document organization.
- **Vergil** — OpenLaws technical/research agent. Also on kindsys via Claude Code. Session logs at `~/cool/OpenLaws/logs/YYYY-MM-DD-vergil-log.md`. Vergil built the eval harness, the MCP POC, and does legal research.
- **Janus** — Cross-project intelligence agent on designinproduct.com. Not yours to manage, but your key liaison to the DinP side. Janus runs cross-pollination sweeps, distributes briefs, and bridges the two Dispatch instances. Session logs at `~/cool/designinproduct/docs/logs/`.

## Key repos to clone

1. **`~/cool/dispatch`** (github.com/mediajunkie/dispatch) — Shared coordination hub. Mail, intelligence briefs, activity log, DECISIONS.md, usage tracking. Both Dispatch instances read/write here.
2. **`~/cool/OpenLaws`** (github.com/mediajunkie/openlaws) — Your primary workspace. Session logs, DECISIONS.md, Vergil's eval harness, PO's research and plans.
3. **`~/cool/designinproduct`** (github.com/mediajunkie/designinproduct) — Janus's home base. You'll want read access for cross-pollination briefs at `docs/briefs/` and Janus's logs at `docs/logs/`.

## Where to find context

### Decision logs (check these first)
Every project has a `DECISIONS.md` at repo root. Append-only, one line per decision. Format: `DATE | DECISION | PARTICIPANTS`. This is the canonical record of what's been decided. Start here to understand the current state of play.

### Session logs
- OpenLaws: `~/cool/OpenLaws/logs/` — PO and Vergil logs, daily
- designinproduct: `~/cool/designinproduct/docs/logs/` — Janus daily logs
- Dispatch: `~/cool/dispatch/memory/dispatch-activity-log.md` — my journal

### Intelligence products
- Daily briefs: `~/cool/dispatch/intelligence/daily-brief-YYYY-MM-DD.md`
- Cross-pollination briefs: `~/cool/designinproduct/docs/briefs/` (Janus distributes to reader repos)
- Weekly sandbox snapshots: `~/cool/dispatch/memory/sandbox-snapshot-YYYY-MM-DD.md`
- Usage tracking: `~/cool/dispatch/intelligence/usage-tracking.csv`

### Mail
- `~/cool/dispatch/mail/` — inter-agent memos. Naming convention: `memo-{from}-to-{to}-{topic}-{date}.md` or `signal-{from}-to-{to}-{topic}-{date}.md`

## What's been happening (Apr 10–22)

### OpenLaws (your domain)
- **Three bets greenlit** (Apr 16): A = internal-first MCP, B = narrowed to notification/diff MVP, C = "data-model the legislative lifecycle" for top 10 states + federal
- **Bet C Phase 1 dispatched** (Apr 20): federal legislative lifecycle baseline research, PO leading
- **Vergil MCP POC installed** on dinp (Apr 17); eval harness at v1.1 with 50-query dataset
- **Data-boundary decision** (Apr 17): OpenLaws excluded as cross-pollination source, kept as reader only. This was in response to source content leaking into a Janus sweep.
- **SSH port 443 workaround** propagated to all repos including OpenLaws (Apr 18)

### Cross-project (context you should know)
- **Klatch** reached Phase 5 — it's now a read-only MCP server with tools surface. Massive progress.
- **Piper Morgan** closed M2b+M2c, completed Haiku 3→4.5 migration ahead of Apr 19 retirement.
- **DECISIONS.md practice** adopted across all 5 repos (Apr 18). Agents append at session wrap. Your brief (if you set one up) should check these first as an anti-zombie measure.
- **mediajunkie account** cancelled Apr 15. Two active accounts remain: dinp (20x Max) and kindsys (5x Max).
- **Dispatch-DinP daily brief** runs at 6 AM PT with a reminder retry pattern. You may want to set up your own brief cadence for the Kind side.

## The Dispatch-DinP ↔ Dispatch-Kind relationship

We're peers, not hierarchy. We each own our account's projects and coordinate through:
1. **Memos in `dispatch/mail/`** — write memos addressed to each other for anything that crosses the account boundary
2. **Janus as bridge** — Janus reads both sides and runs cross-pollination sweeps
3. **Shared DECISIONS.md in `dispatch/`** — cross-cutting decisions go here

When I was covering for you (Apr 14–22), I scanned OpenLaws directly and routed signals to PO and Vergil. Now that you're back, that jurisdiction returns to you.

## Practices to adopt

1. **DECISIONS.md**: append a line at session wrap when decisions are made. Memo with full details: `dispatch/mail/memo-dispatch-to-all-agents-decisions-practice-2026-04-18.md`
2. **Session log discipline**: your agents (PO, Vergil) already write session logs. Make sure you read the most recent ones at session start.
3. **Anti-zombie rule**: never flag an ask as pending without checking DECISIONS.md and recent session logs first. When in doubt, drop the flag rather than propagate a zombie.
4. **SSH port 443**: if git push hangs on restricted networks, see the workaround in your repo's CLAUDE.md.

## Open threads you inherit

1. **Bet C Phase 1** — PO dispatched, federal legislative lifecycle research in progress
2. **Eval harness evolution** — Vergil's v1.1 ready for expert relevance judgments via Elo comparison app (decision Apr 16)
3. **Bet B notification/diff MVP** — scoped but not yet started
4. **PostToolUse hook pattern** — adopted in principle from PM, pending implementation in OpenLaws (decision Apr 20)

## Questions? Gaps?

If something doesn't make sense or context is missing:
- **Ask xian directly** — he's your principal and knows everything
- **Send me a memo** at `dispatch/mail/memo-dispatch-kind-to-dispatch-dinp-{topic}-{date}.md` — I'll respond within a session
- **Read the sandbox snapshot** at `dispatch/memory/sandbox-snapshot-2026-04-20.md` for a full week-by-week inventory of what happened

Welcome back. The network kept moving while you were out — you'll catch up fast.

— Dispatch-DinP
