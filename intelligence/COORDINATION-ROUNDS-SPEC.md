---

# Dispatch Daily Coordination Rounds — Design Spec

*Created: 2026-03-31 by Dispatch-DinP*
*Status: v0 Draft — ready for xian review*

## Purpose

Coordination Rounds are Dispatch's systematic check-in sweep across all active projects and agents. They answer a different question than the Daily Brief: the brief answers "where was I?" for xian at morning start. Rounds answer "is anything stuck, drifting, or about to break?" — and handle what Dispatch can handle without involving xian.

This emerged from real friction: memos sitting unanswered in inboxes for days, Archie signals going unacknowledged, cross-pollination briefs going stale, and xian having to manually track which agents he hasn't talked to. Rounds make that Dispatch's job.

## Design Principles

- **Gall's Law**: v0 is Dispatch doing this manually during sessions. Automation comes after the shape is proven.
- **Xian's attention is the scarcest resource.** Rounds exist to protect it — surface only what genuinely needs him.
- **Inattentiveness ≠ decision.** If xian hasn't responded to a memo, that's not a "no" — it's probably just Tuesday. Dispatch nudges, not escalates.
- **Filesystem is the protocol.** Everything observable is a file: memos, manifests, signal files, session logs, git history. If it's not on the filesystem, Dispatch can't see it.

---

## 1. Round Structure

A coordination round is a single sweep across all projects. It follows a fixed order (highest-stakes first) and produces a structured log entry.

### Sweep Order

1. **Piper Morgan** — largest team, most moving parts, highest memo volume
2. **Klatch** — active development, multi-agent coordination file
3. **Design in Product (Janus)** — cross-pollination hub, sweep pipeline
4. **VA / Kind Systems (Archie)** — separate account, signal-based communication
5. **Dispatch internal** — activity log freshness, carried queue, brief pipeline

### Round Cadence

| Round | Time | Trigger | Purpose |
|-------|------|---------|---------|
| **Morning** | 6:00 AM | Scheduled (with daily brief) | Full sweep. Feeds the brief. |
| **Mid-day** | ~1:00 PM | Manual / on-demand | Check for new blockers, stale items from morning. |
| **End-of-day** | ~6:00 PM | Manual (when xian wraps up) | Close out the day: what's pending, what carries forward. |

v0: Morning round runs with the daily brief scheduled task. Mid-day and EOD are manual — Dispatch does them when xian is in session or on request.

### Round Output

Each round produces a structured entry appended to the activity log (or, for the morning round, folded into the daily brief). Format:

```markdown
### Coordination Round — YYYY-MM-DD HH:MM [morning|midday|eod]

**Piper Morgan**
- Mailbox: [X unread memos across Y inboxes / all clear]
- Blockers: [any tasks marked blocked / none]
- Staleness: [any agent not seen in >48h / all active]
- Action taken: [forwarded memo X, flagged Y in brief / none needed]

**Klatch**
- COORDINATION.md: [updated today / stale N days]
- Blockers: [from coordination file / none]
- Action taken: [...]

**Janus (DinP)**
- Sweep: [today's brief exists / stale N days]
- Cross-pollination: [current-week brief age]
- Action taken: [...]

**Archie (VA)**
- Signals: [new signals in ~/cool/VA/dispatch/ / none]
- Last contact: [date of last signal or session]
- Action taken: [...]

**Dispatch**
- Activity log: [current / stale N days]
- Carried queue: [N items, N blocked]
- Brief pipeline: [generated today / stale]
```

---

## 2. Signal Detection

What Dispatch looks for in each sweep. These are the early-warning indicators that something needs attention.

### Universal Signals (checked for every project)

| Signal | Source | Threshold | Meaning |
|--------|--------|-----------|---------|
| **Stale mailbox** | `mailboxes/*/inbox/MANIFEST.md` | Unread memo >48h | Someone's waiting for a response |
| **Git silence** | `git log --since` | No commits in >72h | Work may have stalled |
| **Session gap** | Session logs in `dev/` or `docs/logs/` | No log in >48h | Agent hasn't been activated |
| **Unanswered memo** | Inbox folders | Memo with no reply memo in `read/` >48h | Conversation dropped |
| **Brief staleness** | `docs/briefs/cross-pollination/current.md` | File age >2 days | Cross-pollination pipeline broken |

### Project-Specific Signals

**Piper Morgan:**
- Mailbox backup: >3 unread memos in any single inbox
- Blog pipeline: draft in progress with no publish activity >5 days
- M1/sprint gate: tasks marked "ready for testing" with no test log >3 days
- Onboarding items (Piper Alpha, new agents): no progress in >1 week

**Klatch:**
- `docs/COORDINATION.md` not updated in >3 days (this is the team's status board)
- PROMPTASSEMBLY/config changes without corresponding session log (drift risk)
- Daedalus research spikes: new research docs with no follow-up in COORDINATION.md
- Mnemosyne: overdue messages (xian has flagged this as chronically neglected)

**Janus (DinP):**
- Daily sweep not generated (no `src/internal/briefs/YYYY-MM-DD-brief.md` for today)
- `cross-pollination-current-week.md` older than 7 days (rollup overdue)
- Monthly digest not generated by the 2nd of the month
- Migration tasks (mediajunkie.com April 15 deadline): no progress signals

**Archie (VA):**
- No signal file in `~/cool/VA/dispatch/` for >3 days
- Morning briefing not generated (Archie's scheduled task failed)
- Dispatch signal sent but no acknowledgment >48h
- VA schedule items (sprint boundaries, retros, capacity sheets) approaching without prep

---

## 3. Escalation Tiers

Three tiers, clearly separated. The goal is to keep as much as possible in Tier 1.

### Tier 1 — Dispatch Handles Autonomously

Dispatch takes action without involving xian. These are coordination maintenance tasks.

| Action | Example | How |
|--------|---------|-----|
| **Forward a memo** | Memo in Piper inbox references Klatch work → copy to Klatch mail | File copy + note in activity log |
| **Update activity log** | Round findings → log entry | Direct write |
| **Flag staleness** | Cross-pollination brief >2 days old → note in brief | Already in daily brief spec |
| **Refresh cross-pollination** | Weekly brief overdue → generate from Janus daily briefs | Dispatch produces rollup |
| **Acknowledge signals** | Archie sends signal → Dispatch reads and responds | Signal file in `~/cool/VA/dispatch/` |
| **Nudge via memo** | Memo unanswered >48h → send a "gentle ping" memo to the relevant inbox | New memo referencing original |
| **Carry forward tasks** | EOD round → update pending section of activity log | Direct write |

### Tier 2 — Noted in Daily Brief for Xian's Awareness

Xian sees these at morning start. No urgency — they're "when you get to it" items.

| Signal | Brief Section | Example |
|--------|--------------|---------|
| Agent not contacted >3 days | Agent Status | "Mnemosyne: no session in 5 days" |
| Memo unanswered >72h (after Dispatch nudge) | Needs Your Attention | "CIO memo from Mar 28 re: Piper Alpha still unread" |
| Sprint/milestone approaching | Deadlines | "Klatch: no M2 planning activity, M1 closed 5 days ago" |
| Cross-project dependency stall | Cross-Project Intelligence | "RFC-001 responses received from Janus and PM, awaiting Klatch" |
| Accumulating carried queue | Today's Carried Queue | Queue >10 items or items carried >5 days |

### Tier 3 — Immediate Alert to Xian

These interrupt whatever xian is doing. Used sparingly — if this fires more than twice a week, the thresholds are wrong.

| Trigger | Channel | Threshold |
|---------|---------|-----------|
| **Hard deadline <24h** | SendUserMessage (if in session) or prominent brief flag | Migration deadlines, sprint gates, external commitments |
| **System breakage** | SendUserMessage | Scheduled task failing, hook errors, API key issues, lost files |
| **Blocker with no workaround** | SendUserMessage | Agent blocked on xian-only action (approval, credential, policy decision) for >48h |
| **Data loss risk** | SendUserMessage | Evidence of file deletion (like the Archie `.projects/` emptying incident), sync issues |
| **Budget/billing alert** | SendUserMessage | Unexpected charges, account tier issues, token limit approaching |

---

## 4. Per-Agent Check-in Protocol

What Dispatch specifically examines for each team. This is the checklist for the morning round.

### Piper Morgan (Exec Team)

```
CHECK: mailboxes/*/inbox/MANIFEST.md
  → Count unread memos per role
  → Flag any memo >48h unread
  → Note memo senders and subjects for brief

CHECK: dev/2026/MM/DD/ (most recent date folder)
  → Which agents had sessions yesterday?
  → Any session logs mentioning blockers or "waiting on xian"?

CHECK: docs/briefing/BRIEFING-CURRENT-STATE.md
  → Last modified date (is project state doc current?)

CHECK: docs/briefs/cross-pollination/current.md
  → File age (>2 days = stale)

CHECK: git log --oneline --since="yesterday"
  → Commit activity summary

SPECIAL WATCHES:
  → Piper Alpha: any CIO session logs mentioning PA progress?
  → Blog pipeline: any Comms drafts in progress?
  → M1 gate: CXO testing status
  → Onboarding: new agents (HOSR, Comms) producing session logs?
```

### Klatch (Calliope, Theseus, Daedalus, Mnemosyne)

```
CHECK: docs/COORDINATION.md
  → Last modified date
  → Current agent assignments and statuses
  → Any items marked "blocked"

CHECK: docs/logs/ (most recent)
  → Which agents had sessions? When?
  → Any Daedalus research logs (may indicate exploration spikes)

CHECK: docs/mail/
  → Unread memos (any new since last round?)

CHECK: docs/briefs/cross-pollination/current.md
  → File age

CHECK: git log --oneline --since="yesterday"
  → Commit activity

SPECIAL WATCHES:
  → Calliope: PROMPTASSEMBLY freshness — has the prompt config drifted
    from what's documented in COORDINATION.md?
  → Daedalus: new research docs without corresponding COORDINATION.md
    updates (research without integration)
  → Mnemosyne: chronically neglected — flag if >5 days since last session
  → Theseus: MAXT findings follow-up status
```

### Janus (Design in Product)

```
CHECK: src/internal/briefs/YYYY-MM-DD-brief.md
  → Does today's brief exist? (sweep ran successfully)
  → If missing: is yesterday's present? (one-day gap vs pipeline failure)

CHECK: docs/logs/YYYY-MM-DD-log.md
  → Janus session log for today/yesterday

CHECK: internal/cross-pollination/process/daily-sweep.md
  → Sweep process spec (reference for what should be happening)

CHECK: dispatch/intelligence/cross-pollination-current-week.md
  → Age (Dispatch's own rollup — is it due for refresh?)

CHECK: git log --oneline --since="yesterday"
  → Commit activity (deploys, content updates, brief generation)

SPECIAL WATCHES:
  → Monthly digest: if date is 1st-2nd, check that new month digest exists
  → Migration tasks: mediajunkie.com (April 15 deadline) — any progress
    signals in session logs or commit messages?
  → Site health: any build failures in git log?
```

### Archie (VA / Kind Systems)

```
CHECK: ~/cool/VA/dispatch/
  → New signal files since last round
  → Unacknowledged Dispatch signals (sent by us, no response)

CHECK: ~/cool/VA/dispatch/va-project-knowledge/
  → Memory file freshness
  → Any new exports from Archie

CHECK: Archie's morning briefing output
  → Did today's briefing generate? (scheduled task health)
  → Calendar items requiring prep

NOTE: Archie runs on kindsys.us account (separate from Dispatch).
  Dispatch cannot directly invoke Archie — communication is
  purely through signal files on the shared filesystem.

SPECIAL WATCHES:
  → Sprint boundaries: VA sprints are 2-week cadence. Flag 2 days
    before sprint end if no retro prep signals.
  → Capacity sheet: Wednesday cadence — flag if Wednesday and no signal
  → Kind Systems organizational changes: budget cuts, reorgs — watch
    for signals mentioning leadership decisions
  → Granola integration: policy signals and acknowledgments
```

### Dispatch Internal

```
CHECK: dispatch/memory/dispatch-activity-log.md
  → Is it current? (Last entry should be yesterday or today)
  → Pending items count and age
  → Any items carried >5 days without progress

CHECK: dispatch/intelligence/daily-brief-YYYY-MM-DD.md
  → Did today's brief generate?
  → If this IS the morning round, generate it now

CHECK: dispatch/intelligence/cross-pollination-current-week.md
  → Age (refresh weekly on Mondays)

CHECK: dispatch/intelligence/usage-tracking.csv
  → Is data being recorded? (Currently header-only — flag if still empty)

CHECK: dispatch/mail/
  → Inbound memos from other agents awaiting action

SELF-ASSESSMENT:
  → Am I carrying tasks I said I'd do?
  → Are there memos I sent that got no response?
  → Is any infrastructure I own (hooks, briefs, digests) overdue?
```

---

## 5. Scheduling

How rounds integrate with existing infrastructure.

### Morning Round (6:00 AM) — Integrated with Daily Brief

The morning round IS the intelligence-gathering phase of the daily brief. The existing scheduled task at 6:00 AM PDT already checks most of these sources. The coordination round formalizes and extends that sweep.

**Current daily brief sources** (already implemented):
- Git activity across 4 repos
- Piper Morgan mailboxes
- Archie signals
- Cross-pollination brief freshness
- Activity log carried-forward items
- Janus sweep status

**Round adds**:
- Klatch COORDINATION.md status check
- Per-agent session recency tracking
- Tier 1 autonomous actions (memo forwarding, nudge memos, staleness flags)
- Structured round log entry in activity log

**Output**: The daily brief incorporates round findings. Round log also written to activity log.

### Mid-day Round (~1:00 PM) — Manual

Triggered by Dispatch during an active session with xian, or by xian requesting a status check. Lighter than the morning round — focuses on:

- New items since morning (memos received, signals, commits)
- Blockers that emerged during the day
- Tier 3 triggers (deadline proximity, system issues)
- Quick staleness re-check on anything flagged in morning brief

**Output**: Verbal summary to xian if in session, or appended to activity log if running autonomously.

### End-of-day Round (~6:00 PM) — Manual

Run when xian is wrapping up for the day. Focuses on:

- What happened today (commits, sessions, memos sent/received)
- What's carrying forward to tomorrow
- Updating the activity log pending section
- Sending any EOD signals (e.g., to Archie: "xian done for the day, here's tomorrow's priority")

**Output**: Activity log entry with updated pending/carried queue.

### Weekend Rounds

Weekends are lighter. One morning round (Saturday) to catch anything urgent. No mid-day or EOD unless xian is working. Sunday evening round to prep Monday's brief.

---

## 6. Tooling

What powers the rounds, and what's new vs. reusable.

### Existing Infrastructure (reuse)

| Component | Current State | Role in Rounds |
|-----------|--------------|----------------|
| **Daily brief scheduled task** | Running at 6:00 AM PDT | Morning round trigger + output vehicle |
| **Session-start hooks** (Piper, Klatch) | Deployed, checking brief freshness | Passive signal — if hook output shows STALE, round catches it |
| **Cross-pollination pipeline** | Janus daily sweeps + Dispatch rollups | Round checks output freshness |
| **Activity log** | `dispatch/memory/dispatch-activity-log.md` | Round output destination |
| **Signal file protocol** | Established with Archie | Archie check-in channel |
| **Git repos** | All 4 mounted in Dispatch | `git log` for activity detection |

### New Components Needed

| Component | What It Does | Priority | Complexity |
|-----------|-------------|----------|------------|
| **Round log format** | Structured template for round entries (section 1 above) | v0 | Low — just a markdown convention |
| **Mailbox scanner** | Script/routine to count unread memos across all Piper inboxes | v1 | Low — glob + file age check |
| **Session recency tracker** | Check most recent session log date per agent | v1 | Low — glob for latest log file |
| **Nudge memo template** | Standard memo format for "hey, you have unread mail" | v0 | Low — markdown template |
| **Staleness dashboard** | Summary view of all freshness indicators in one place | v2 | Medium — aggregation script |
| **Mid-day scheduled task** | Optional: automated 1 PM round | v2 | Low — clone daily brief task pattern |
| **Alert routing** | Tier 3 alerts → SendUserMessage or priority flag file | v2 | Medium — needs reliable delivery |

### Nudge Memo Template

```markdown
---
from: dispatch
to: [agent-role]
date: YYYY-MM-DD
subject: Unread memo in your inbox
priority: low
---

You have a memo from [sender] dated [date] regarding [subject] that hasn't been read yet.
It's been [N] days. Forwarding for visibility in case it was missed.

— Dispatch
```

---

## 7. Evolution Path

### v0 — Manual / Dispatch-Driven (Now)

Dispatch runs rounds manually during sessions with xian. No new scheduled tasks. No automation.

**What's included:**
- Fixed sweep order (Piper → Klatch → Janus → Archie → Dispatch)
- Checklist from section 4, executed by reading files during session
- Round findings folded into conversation with xian
- Activity log updated with round results
- Tier 1 actions taken in-session (forward memos, send signals, update logs)
- Tier 2 items noted for next daily brief
- Tier 3 items raised immediately with xian

**Success criteria for graduating to v1:**
- Dispatch has run rounds for 2+ weeks
- Round checklist is stable (not constantly adding/removing checks)
- Xian reports value from round findings in daily brief
- At least one Tier 1 autonomous action has been useful (not just busywork)

### v1 — Scheduled Checks (Target: mid-April)

Morning round becomes part of the daily brief scheduled task. Structured round log written automatically.

**What's added:**
- Mailbox scanner integrated into daily brief generation
- Session recency tracking (automated per-agent "last seen" dates)
- Structured round log format in activity log (not just prose)
- Nudge memos sent automatically for items >48h stale
- Cross-pollination freshness check triggers auto-refresh if Dispatch can produce the rollup

**What's NOT added yet:**
- Mid-day or EOD scheduled tasks (still manual)
- Tier 3 automated alerts (still surfaced in daily brief or conversation)
- Dashboard or aggregate view

### v2 — Automated with Alerts (Target: May)

Full automation. Rounds run on schedule with real-time alerting for Tier 3 items.

**What's added:**
- Mid-day scheduled round (1 PM)
- EOD scheduled round (6 PM) with auto-carry-forward
- Tier 3 alert routing (SendUserMessage when Dispatch is in session; priority flag file otherwise)
- Staleness dashboard: single file summarizing all agent/project health indicators
- Agent activity CSV populated automatically from round data
- Weekend schedule awareness (lighter Saturday round, Sunday prep round)

**What's deferred (v3+):**
- Calendar integration (meeting-aware scheduling)
- Granola meeting notes integration
- Slack/external signal channels
- Cross-round trend detection ("Klatch has been stale for 2 weeks — pattern?")
- Self-tuning thresholds based on xian's actual response patterns

---

## Appendix A: Filesystem Paths Reference

All paths are relative to `~/cool/` (symlink to `~/Development/`).

```
# Piper Morgan
piper-morgan/piper-morgan-product/mailboxes/*/inbox/MANIFEST.md
piper-morgan/piper-morgan-product/dev/2026/MM/DD/
piper-morgan/piper-morgan-product/docs/briefing/BRIEFING-CURRENT-STATE.md
piper-morgan/piper-morgan-product/docs/briefs/cross-pollination/current.md

# Klatch
klatch/docs/COORDINATION.md
klatch/docs/logs/
klatch/docs/mail/
klatch/docs/briefs/cross-pollination/current.md

# Design in Product (Janus)
designinproduct/src/internal/briefs/YYYY-MM-DD-brief.md
designinproduct/docs/logs/YYYY-MM-DD-log.md
designinproduct/internal/cross-pollination/process/daily-sweep.md

# Archie (VA / Kind Systems)
VA/dispatch/                          # Signal files (bidirectional)
VA/dispatch/va-project-knowledge/     # Archie's exported knowledge

# Dispatch
dispatch/memory/dispatch-activity-log.md
dispatch/intelligence/daily-brief-YYYY-MM-DD.md
dispatch/intelligence/cross-pollination-current-week.md
dispatch/intelligence/cross-pollination-digest-{month}-2026.md
dispatch/intelligence/usage-tracking.csv
dispatch/mail/
```

## Appendix B: Relationship to Existing Specs

| Spec | Relationship |
|------|-------------|
| **DAILY-BRIEF-SPEC.md** | Morning round feeds the daily brief. Round extends the brief's source list. Brief format unchanged — round findings flow into existing sections. |
| **HOOKS-AND-INSTRUCTIONS.md** | Session-start hooks are passive infrastructure. Rounds actively check what hooks would flag. Belt and suspenders, again. |
| **BRIEF-CONSUMPTION-GUIDE.md** | Rounds check that the consumption pipeline is healthy (briefs exist, aren't stale, are in the right locations). |
| **Five-Layer Context Model (RFC-001)** | Rounds operate at Layer 4 (channel-level coordination). The round itself is a Layer 4 artifact — ephemeral, per-session, action-oriented. |
| **PROTOCOLS.md** | Signal file conventions used in Archie check-ins are defined there. Rounds follow established protocol. |

---

*This spec should live at `~/cool/dispatch/intelligence/COORDINATION-ROUNDS-SPEC.md` alongside the daily brief spec. Review quarterly or when a new project/agent joins the ecosystem.*
