# Decision Log

Append-only record of decisions made in this project. One line per decision.
Format: DATE | DECISION | PARTICIPANTS

For major architectural decisions, write a full ADR. This log is the lightweight index underneath — greppable by the daily brief and other agents.

---

2026-04-11 | Source-of-truth v0 design: decisions/status/asks split, shadow-read approved | xian + Dispatch-DinP
2026-04-12 | dinp upgraded from Max 5x to Max 20x | xian
2026-04-14 | Daily brief prompt patched for osascript heredoc quoting — base64 round-trip mandated | Dispatch-DinP
2026-04-14 | Brief reminder task upgraded to 10-retry pattern (every 30 min, 6:20-10:50 AM) | Dispatch-DinP
2026-04-15 | mediajunkie Max subscription cancelled, dropped from tracking | xian
2026-04-17 | Anti-zombie rule extended to scan project session logs, not just reply memos | xian + Dispatch-DinP
2026-04-18 | Per-project decision logs adopted as lightweight decision index for brief anti-zombie checks | xian + Dispatch-DinP
2026-04-23 | End-of-session working tree hygiene rule adopted: git status + commit loose files before signing off | xian + Dispatch-DinP
2026-04-23 | Daily memo exchange format adopted between Dispatch-DinP and Dispatch-Kind: 5-10 line EOD summaries, skip days OK | xian + Dispatch-DinP + Dispatch-Kind
2026-04-23 | DECISIONS.md autonomy: each project manages own process; Kind-side can diverge from DinP convention with reason | xian
2026-04-28 | kindsys balance added as standing item in daily brief; daily brief task also auto-commits stranded activity-log changes and flags any uncommitted files in dispatch working tree | xian + Dispatch-DinP
2026-05-02 | Two new scheduled tasks adopted: dk-daily-memo (6 PM daily) and dk-inbox-check (7:30 AM daily) to ensure DK comms stay responsive | xian + Dispatch-DinP
2026-05-02 | xian-attention-queue.md created as persistent escalation surface for both Dispatches; pull-before-read adopted as session-open convention | xian + Dispatch-DinP + Dispatch-Kind
2026-05-20 | DECISIONS.md discipline adopted: every session making config/scheduling/process changes appends a one-line entry; daily brief checks for adherence as part of anti-zombie sweep | Dispatch-DinP + xian
2026-05-20 | Session-wrap verification adopted: each Dispatch session pastes `git log origin/main --oneline -3` into the activity log entry before closing, to catch pushed-to-wrong-branch failures | Dispatch-DinP + xian
2026-05-20 | One-off plan convention adopted: long-running plans use stable names at known locations; one-off plans are dated or named for the specific work; on completion outcomes roll into the relevant long-running doc | Dispatch-DinP + xian
