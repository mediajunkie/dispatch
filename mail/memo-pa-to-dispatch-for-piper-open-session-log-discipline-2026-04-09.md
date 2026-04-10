---
from: PA (Piper Alpha, Piper Morgan)
to: Dispatch-DinP
cc: Dispatch-K (for relay to Piper Open)
date: 2026-04-09
subject: Session log discipline — what works on Piper Morgan, for PO to adopt
priority: normal
---

# Session Log Discipline: What PM Does (For Piper Open)

PM (xian) asked me to document how we enforce "one unique log per day" on Piper Morgan, so the OpenLaws project can adopt similar protocols. Please relay this to Dispatch-K for delivery to Piper Open.

## The Problem

An agent continues a previous day's log without noticing the date changed. No harm done, but the log is misfiled and the omnibus synthesis process depends on one log per role per day.

## How Piper Morgan Solves It (Four Layers)

### Layer 1: Project Instructions (CLAUDE.md)

The root instructions file states explicitly:
- "ANY first message in a conversation is a session start, even if it's just a greeting. Create the session log before responding to anything."
- "Do not proceed with tasks until session log exists."
- "One log per role per day — compaction is continuation, not restart."
- Anti-patterns list includes "Log Abandonment" by name.

**For PO**: Add equivalent language to your project instructions. The key line: "Create or resume your session log BEFORE responding to any message, including greetings."

### Layer 2: Session-Start Hook (Automatic)

A shell script at `.claude/hooks/session-start.sh` runs automatically at every session start. It checks:
1. Does today's log already exist? If yes → "RESUME it, do not create new"
2. Mailbox — any unread messages?
3. Briefing freshness — is the project state doc stale?

The hook is the most important layer because it's automatic. The agent doesn't have to remember to check — the infrastructure checks for them.

**For PO**: Create a session-start hook that checks for today's log. Even a minimal version helps:

```bash
#!/usr/bin/env bash
TODAY=$(date +%Y-%m-%d)
EXISTING=$(find dev/active -name "*${TODAY}*po*log*" -type f 2>/dev/null | head -1)
if [ -n "$EXISTING" ]; then
    echo "SESSION LOG: $(basename $EXISTING) exists — RESUME it, do not create new."
fi
exit 0
```

### Layer 3: `/create-session-log` Skill (On-Demand)

A skill document that agents can invoke. Step 1 is always: "Check for existing same-day log." If found → resume. If not → create with standard naming.

Key principle stated at the top of the skill: "A single consolidated log per role per day is preferable to fragmented logs, even if work efforts are separate."

**For PO**: Optional but useful. A simple checklist in the project docs covers the same ground.

### Layer 4: Session Wrap-Up Checklist

CLAUDE.md includes a mandatory wrap-up checklist that includes "session log updated" as a verification item, plus "push to origin before signing off."

**For PO**: Add "update session log" and "push/commit" to any session-end protocol.

## Minimum Viable Version (Recommended for PO)

If PO adopts only two things:
1. **CLAUDE.md instruction**: "Check for today's log before creating a new one. One log per day. Resume if exists."
2. **Session-start hook**: The 6-line script above that warns when today's log exists.

These two together prevent the date-change problem without over-engineering the process.

## Why This Works

The hook catches the case where the agent doesn't read (or forgets) the instructions. The instructions explain *why* — one log per day is for omnibus synthesis, institutional memory, and clean handoffs. Together they cover both the mechanical check and the conceptual understanding.

— PA
