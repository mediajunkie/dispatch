---

# Dispatch Daily Brief — Design Spec

*Created: 2026-03-30 by Dispatch-DinP*

## Purpose

A morning briefing delivered to xian via Dispatch at session start. Answers "where was I?" across all projects after the amnesia of a fresh LLM session. Also available on manual request throughout the day.

## Delivery

- **Scheduled**: Runs daily at 6:00 AM PDT (before xian's typical start)
- **Output**: Markdown file at `~/cool/dispatch/intelligence/daily-brief-YYYY-MM-DD.md`
- **Delivery**: Dispatch reads and presents the brief at session start
- **Manual refresh**: Xian can request an updated brief at any time; Dispatch regenerates from current sources

## Sources

The brief assembles intelligence from these locations:

### Per-repo git activity
- `git log --oneline --since="yesterday"` on each repo:
  - ~/cool/piper-morgan
  - ~/cool/klatch
  - ~/cool/designinproduct
  - ~/cool/dispatch

### Agent mailboxes (Piper Morgan)
- Check `piper-morgan-product/mailboxes/*/inbox/MANIFEST.md` for unread items
- Flag any memos awaiting xian's attention

### Archie signals (VA)
- Check `~/cool/VA/dispatch/` for new signal files since last brief

### Cross-pollination
- Read `~/cool/dispatch/intelligence/cross-pollination-current-week.md` for latest insights
- Note if brief is stale (>2 days)

### Dispatch activity log
- Read the carried-forward pending/task queue from the most recent entry in `dispatch-activity-log.md`

### Janus sweep status
- Check `~/cool/designinproduct/docs/briefs/` for latest sweep receipt
- Note if sweep is stale or failed

### Agent activity CSV
- Read `~/cool/dispatch/agent-activity-log.csv` for recent agent sessions

## Brief Format

```markdown
# Dispatch Daily Brief — YYYY-MM-DD

## Overnight Activity
[Per-project summary of git commits since last brief, grouped by repo. 1-2 lines per repo. Skip repos with no activity.]

## Needs Your Attention
[Items requiring xian's input, decision, or action. Sourced from mailboxes, signals, and carried-forward items marked as blocked/waiting.]

## Agent Status
[Which agents were active recently, what they're working on, anything overdue or stalled.]

## Deadlines
[Upcoming deadlines from the task queue and project context. Highlight anything within 3 days.]

## Today's Carried Queue
[The running task list, pulled from the activity log's most recent pending section.]

## Cross-Project Intelligence
[Notable items from cross-pollination brief, if fresh. Skip if stale >2 days.]
```

## Staleness Rules

- Brief older than 18 hours → regenerate on next Dispatch session start
- Cross-pollination brief older than 2 days → note in brief, don't block
- Sweep receipt older than 36 hours → flag as potentially failed

## Evolution Notes

- v1: File-based generation via scheduled task, presented by Dispatch
- Future: Could integrate Granola meeting notes (pending policy), calendar data, Slack signals
- The brief should get smarter over time as we learn what xian actually reads vs skips
