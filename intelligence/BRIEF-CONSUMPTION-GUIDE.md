# Cross-Pollination Brief Consumption Guide

*How each agent type should consume intelligence briefs*
*Created: March 25, 2026 by Dispatch*

---

## Agent Types and Their Channels

### 1. Claude Code Agents (Lead Dev, Docs, Calliope, etc.)

**Belt (CLAUDE.md)**: Already in place for Piper Morgan. Session Start Protocol step 4:
```
# 4. Read cross-project brief
# See docs/briefs/cross-pollination/current.md for insights from sibling projects
```

Klatch CLAUDE.md needs the same addition. Recommended text:
```
# 4. Read cross-project brief
# See docs/briefs/cross-pollination/current.md for insights from sibling projects
```

**Suspenders (session-start hook)**: Add a one-line check to the session-start hook. Under the briefing freshness check, add:

```bash
# ─── 5. Cross-Pollination Brief ────────────────────────────────────────────
BRIEF="$PROJECT_ROOT/docs/briefs/cross-pollination/current.md"
if [ -f "$BRIEF" ]; then
    BRIEF_AGE=$(( (NOW_EPOCH - $(stat -f %m "$BRIEF" 2>/dev/null || stat -c %Y "$BRIEF" 2>/dev/null || echo $NOW_EPOCH)) / 86400 ))
    if [ "$BRIEF_AGE" -gt 2 ]; then
        output+="BRIEF: STALE ($BRIEF_AGE days old)"$'\n'
    else
        output+="BRIEF: current.md available"$'\n'
    fi
fi
```

**Action needed (xian)**:
- Piper: CLAUDE.md ✅ already done. Hook: add the above snippet to `.claude/hooks/session-start.sh`
- Klatch: Add step 4 to CLAUDE.md session start protocol. Add hook snippet if Klatch has a session-start hook.

### 2. Claude Chat / Project Agents (Architect, CoS, CIO, CXO, PPM, HOSR, Comms)

**Belt (Project Knowledge Base)**: Add these documents to each Claude Project's knowledge base:
- `cross-pollination-digest-march-2026.md` (monthly digest, ~280 lines)
- `cross-pollination-current-week.md` (slim weekly, ~50 lines, refresh weekly)
- Optionally: `cross-pollination-digest-february-2026.md` (baseline context)

**Suspenders (Session-start verbal prompt)**: When starting a session with a Project agent, include:
```
Before we begin: have you read the cross-pollination digest in your knowledge base?
Check for the latest weekly brief and note any insights relevant to today's work.
```

**Rollup cadence for Project knowledge base management:**
- **Daily**: New brief produced by Janus → xian pastes current-week brief when starting sessions
- **Weekly (Monday)**: Dispatch produces updated current-week brief → xian swaps in knowledge base
- **Monthly (1st of month)**: Dispatch produces monthly digest → xian adds to KB, removes weekly briefs from previous month

### 3. Cowork Agents (Archie, future Piper Alpha, future RFA)

**Belt (Project Instructions)**: Add to the Cowork project's instructions/CLAUDE.md:
```
At session start, check ~/cool/dispatch/intelligence/ for:
- cross-pollination-current-week.md (most recent insights)
- cross-pollination-digest-[month]-2026.md (monthly context)
```

**Suspenders (Scheduled task)**: Archie already has a daily morning briefing task. Add cross-pollination brief check to that routine — scan the intelligence folder for updates and note key insights in the briefing file.

**Action needed (xian)**:
- Mount `~/cool/dispatch/` in each Cowork session (one-time setup per session)
- Add the instruction text to Cowork project instructions

### 4. Dispatch (me)

I already read the briefs when they're relevant to tasks I'm working on. For the daily intelligence service (future), I'll synthesize from all sources (cross-pollination briefs, Archie's morning briefing, Piper omnibus, Klatch intel sweeps) into a single morning digest for xian.

---

## File Locations

| Artifact | Location | Updated By | Cadence |
|----------|----------|-----------|---------|
| Daily brief (per-project) | `{project}/docs/briefs/cross-pollination/current.md` | Janus (scheduled) | Daily |
| Unified daily brief | `dinp/src/internal/briefs/YYYY-MM-DD-brief.md` | Janus (scheduled) | Daily |
| Current week brief | `dispatch/intelligence/cross-pollination-current-week.md` | Dispatch | Weekly (Monday) |
| Monthly digest | `dispatch/intelligence/cross-pollination-digest-{month}-2026.md` | Dispatch | Monthly |
| February baseline | `dispatch/intelligence/cross-pollination-digest-february-2026.md` | Dispatch | One-time |

---

*This guide should be reviewed and updated as agent environments evolve (e.g., when Chat agents migrate to Cowork, the Chat section becomes less relevant).*
