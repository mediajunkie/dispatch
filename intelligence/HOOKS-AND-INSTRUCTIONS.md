# Cross-Pollination Hooks & Instructions

*Precise instructions for each project and agent type*
*Created: March 25, 2026 by Dispatch*

---

## Piper Morgan — Session-Start Hook Addition

Add this snippet to `~/cool/piper-morgan/.claude/hooks/session-start.sh`, **after the Briefing Freshness section (section 3)** and **before the Role Identity section (section 4)**:

```bash
# ─── 5. Cross-Pollination Brief ────────────────────────────────────────────
BRIEF="$PROJECT_ROOT/docs/briefs/cross-pollination/current.md"
if [ -f "$BRIEF" ]; then
    if stat -f %m "$BRIEF" >/dev/null 2>&1; then
        BRIEF_EPOCH=$(stat -f %m "$BRIEF")
    else
        BRIEF_EPOCH=$(stat -c %Y "$BRIEF")
    fi
    BRIEF_AGE=$(( (NOW_EPOCH - BRIEF_EPOCH) / 86400 ))
    if [ "$BRIEF_AGE" -gt 2 ]; then
        output+="BRIEF: STALE ($BRIEF_AGE days)"$'\n'
    fi
fi
```

**Note**: The CLAUDE.md already has step 4 pointing agents to `docs/briefs/cross-pollination/current.md`. This hook adds staleness detection as the suspenders to that belt.

---

## Klatch — CLAUDE.md Addition

Add this to the **Session Start Protocol** section in `~/cool/klatch/CLAUDE.md`, as a new step after checking mailbox:

```markdown
# 4. Read cross-project brief
# See docs/briefs/cross-pollination/current.md for insights from sibling projects
# This is your daily intelligence from the cross-pollination system
```

If Klatch has a session-start hook (check `.claude/hooks/session-start.sh`), add the same bash snippet from the Piper section above.

---

## Klatch — Session-Start Hook Addition

If `~/cool/klatch/.claude/hooks/session-start.sh` exists, add the same snippet as Piper (above), adjusting PROJECT_ROOT if needed.

If Klatch doesn't have a session-start hook yet, create one at `~/cool/klatch/.claude/hooks/session-start.sh`:

```bash
#!/usr/bin/env bash
# session-start.sh — SessionStart hook for Klatch
# Checks cross-pollination brief freshness

set -uo pipefail

PROJECT_ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
output=""

# Cross-Pollination Brief
BRIEF="$PROJECT_ROOT/docs/briefs/cross-pollination/current.md"
if [ -f "$BRIEF" ]; then
    NOW_EPOCH=$(date +%s)
    if stat -f %m "$BRIEF" >/dev/null 2>&1; then
        BRIEF_EPOCH=$(stat -f %m "$BRIEF")
    else
        BRIEF_EPOCH=$(stat -c %Y "$BRIEF")
    fi
    BRIEF_AGE=$(( (NOW_EPOCH - BRIEF_EPOCH) / 86400 ))
    if [ "$BRIEF_AGE" -gt 2 ]; then
        output+="BRIEF: STALE ($BRIEF_AGE days)"$'\n'
    else
        output+="BRIEF: current.md available"$'\n'
    fi
fi

if [ -n "$output" ]; then
    echo "$output"
fi

exit 0
```

Make it executable: `chmod +x ~/cool/klatch/.claude/hooks/session-start.sh`

---

## Archie (VA Cowork) — Instructions Addition

In your Archie Cowork session, add this to the **Project Instructions** (the instructions/settings field in the Cowork UI):

```
## Cross-Project Intelligence

At session start, check ~/cool/VA/dispatch/ for new signals from Dispatch.

Also check ~/cool/dispatch/intelligence/ (if mounted) for:
- cross-pollination-current-week.md — latest cross-project insights
- cross-pollination-digest-[month]-2026.md — monthly context

Mention any relevant insights from these briefs when they connect to today's VA work.
```

**Mount requirement**: The `~/cool/dispatch/` folder must be mounted in Archie's Cowork session for this to work. Xian needs to add it via the Cowork UI's folder settings.

---

## Claude Chat / Project Agents — Knowledge Base Items

For each Claude Project (Piper Morgan leadership, Klatch, VA, One Job), add these files to the project's Knowledge section:

1. **Monthly digest**: `cross-pollination-digest-march-2026.md` (from `~/cool/dispatch/intelligence/`)
2. **Current week brief**: `cross-pollination-current-week.md` (from `~/cool/dispatch/intelligence/`)
3. **February baseline** (optional): `cross-pollination-digest-february-2026.md`

**Rollup cadence for maintenance:**
- Weekly (Monday): Dispatch produces updated current-week brief → xian swaps in knowledge base
- Monthly (1st): Dispatch produces monthly digest → xian adds, removes prior month's weekly briefs

**Session-start verbal prompt** (paste when starting a Project agent session):
```
Before we begin: check the cross-pollination digest in your knowledge base for any insights relevant to today's work. Note anything from sibling projects that connects to what we're doing.
```

---

## Summary of Manual Steps for Xian

| Project | What to do | Where |
|---------|-----------|-------|
| **Piper Morgan** | Add bash snippet to session-start hook | `~/.claude/hooks/session-start.sh` (after section 3) |
| **Klatch** | Add step 4 to CLAUDE.md + create/update hook | CLAUDE.md session start protocol + `.claude/hooks/` |
| **Archie (VA)** | Add instruction text + mount dispatch folder | Cowork project instructions + Cowork folder settings |
| **All Chat Projects** | Add digest + current-week to knowledge base | Claude.ai Project knowledge section |
| **All Chat agents** | Paste session-start prompt at beginning | In chat when starting a session |
