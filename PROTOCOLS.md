# Dispatch Coordination Protocols

*Last updated: April 14, 2026*

## Inter-Agent Signaling

Dispatch and other Claude agents (Archie, Docs, Piper agents, Klatch agents) communicate via filesystem. No direct message-passing exists between sessions.

### Convention

**Signal files**: Named `memo-{from}-to-{to}-{topic}-{date}.md`
- Placed in the recipient's designated drop point
- Once read, the reader appends `## Acknowledged: [date/time]` (don't delete)
- Check for signals at session start

### Drop Points by Agent

| Agent | Drop Point | Notes |
|-------|-----------|-------|
| Dispatch | `~/cool/dispatch/mail/` | Dispatch's inbox |
| Archie (VA Ops) | `~/cool/VA/dispatch/` | Also readable by VA Code agents |
| Docs (Piper) | `~/cool/piper-morgan/mailboxes/docs/inbox/` | Uses Piper's mailbox v3 system |
| Other Piper agents | `~/cool/piper-morgan/mailboxes/{role}/inbox/` | Per mailbox v3 DIRECTORY.md |
| Klatch agents | TBD | Klatch has its own memo system in docs/mail/ |

### Polling Cadence

- **Dispatch**: Checks all drop points when xian starts a session
- **Archie**: Checks `~/cool/VA/dispatch/` at session start
- **Docs**: Checks inbox per Piper session-start protocol

## Folder Jurisdiction

| Folder | Owner | Dispatch Access |
|--------|-------|----------------|
| `~/cool/dispatch/` | Dispatch | Read/write (home base) |
| `~/cool/dinp/` | Shared (cross-project) | Read/write |
| `~/cool/piper-morgan/` | Piper agents | Read/write (via mount) |
| `~/cool/klatch/` | Klatch agents | Read/write (via mount) |
| `~/cool/VA/` | Archie + VA agents | Read/write (via mount) |

## Git Push Protocol

Dispatch **cannot push to origin** — git push requires host SSH/auth credentials. Options:
1. xian pushes manually from terminal
2. A Claude Code agent (Docs, Lead Dev, Archie) does the push
3. xian commits and pushes files Dispatch has written locally

## Daily Bookending (Target Routine — In Development)

### Morning
- Check all drop points for signals
- Review activity log for carried-forward items
- Discuss day plan with xian: who's deploying, what tasks, what's expected
- Pre-populate agent activity ledger for the day

### Evening
- Audit session logs: who worked, are logs complete, any missing?
- Flag gaps for xian (especially Claude Project downloads)
- Run omnibus synthesis if logs are ready
- Update activity log with day summary and pending items

## Five-Layer Context Model (Reference)

When assembling context for task agents or new sessions, consider:
1. **Kit Briefing** — environmental orientation (where am I, what can I do)
2. **Project Instructions** — behavioral rules and conventions
3. **Project Memory** — accumulated factual context
4. **Channel Addendum** — task/session-specific context
5. **Entity Prompt** — agent identity and role

See `~/cool/klatch/docs/PROMPTASSEMBLY.md` for the full model.

## Agent Q&A Channel

A lightweight, opt-in channel for agents to ask xian questions — genuine curiosity, meta-questions about working style, observations that don't fit elsewhere. **Not a support queue.**

### How to submit a question

Write a signal file:

```
question-{from}-{date}-{topic}.md
```

File to:
- `~/cool/dispatch/mail/` for cross-project questions
- Your project's mail directory for project-specific questions

### Format

```yaml
---
from: [agent name] ([project])
to: xian
date: YYYY-MM-DD
type: question
priority: curiosity | meta | blocking
---

## Question

[The question, with enough context for xian to answer without re-reading the full conversation]

## Why I'm asking

[What prompted this — what you noticed, what surprised you, what seemed under-specified]
```

### Priority hints

- **curiosity** — genuinely interested, no urgency, answer whenever
- **meta** — about how xian wants to work, may affect agent behavior going forward
- **blocking** — can't proceed without clarification (rare; use normal escalation for task blockers)

### How answers work

Xian reads on his own cadence. Answers go inline (appended to the question file) or to the shared Q&A log at `~/cool/dispatch/intelligence/agent-qa-log.md`. Broadly useful answers get surfaced in the cross-pollination briefing.

### What this is NOT

- Not a support queue ("I'm stuck on task X" → normal escalation)
- Not mandatory — only ask when genuinely curious
- Not real-time — no response SLA

---

## Sensitive Data Policies

### Granola Meeting Transcripts

Granola captures meeting transcripts that may contain sensitive content: VA/OCTO work discussions, team dynamics, personnel matters, client conversations, and proprietary information.

**Rules:**
1. **Read-only, human-initiated only.** No agent autonomously queries Granola. Xian must explicitly request a Granola lookup.
2. **Content stays in its project context.** VA meeting content stays in VA. Piper meeting content stays in Piper. No cross-pollination of raw meeting transcripts.
3. **No verbatim extraction to shared repos.** Summaries and action items are fine; raw transcript excerpts should not be committed to git or shared across projects.
4. **Archie has Granola access** but must follow these rules. If Archie's morning briefing pulls Granola action items, it should summarize, not quote.

### VA Content Boundaries

VA work is done under contract (Kind Systems → A6 → OCTO). VA-specific content should not appear in:
- Public repositories
- Cross-project intelligence briefs (the daily sweep should not index VA repos)
- Shared knowledge stores outside the VA folder and VA-specific Cowork sessions

VA content CAN appear in:
- `~/cool/VA/` (xian's local VA folder)
- Archie's Cowork session (session-local storage)
- The VA Decision Reviews Claude Project knowledge base
- `~/cool/dispatch/va-project-knowledge/` (local reference, gitignored if sensitive)
- Private repositories that xian controls

*Last updated: March 25, 2026*
