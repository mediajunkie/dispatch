# Dispatch Coordination Protocols

*Last updated: March 23, 2026*

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
