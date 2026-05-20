# Dispatch Practice Upgrade — Bootstrapping Operational Rigor

**Date:** 2026-05-20
**Author:** Dispatch-DinP (with xian)
**Status:** DRAFT — awaiting review
**Type:** One-off (practices roll into PROTOCOLS.md and DECISIONS.md on completion)
**Sequencing:** Execute BEFORE `brief-reliability-fix-2026-05-20.md`

---

## Objective

Adopt lightweight operational rigor patterns from other projects in xian's portfolio (Piper Morgan, Klatch) scaled to Dispatch's operational surface. The goal is to make Dispatch sessions more reliable, more legible across time, and more recoverable when something breaks — without introducing heavyweight process.

Three practices, each one cheap to perform, each one solving a real failure mode that has cost us time in the last 30 days.

---

## Current State

- DECISIONS.md exists at repo root but has not been consistently maintained. Several scheduling and configuration changes in May (osascript → bash migration, scheduled-task rewrites, brief reminder behavior) were not logged.
- Sessions have repeatedly pushed work to non-main branches and reported "done" without verifying the commit reached `origin/main`. This has caused at least three "ghost completions" in the last month.
- The plans/ directory contains a mix of long-running references (e.g., `dispatch-project-roadmap.md` style docs) and one-off work, but there is no clear convention distinguishing them. New sessions don't know which docs are authoritative vs. which are historical.

---

## The Three Practices

### Practice 1 — DECISIONS.md discipline

**Pattern source:** Klatch (`docs/DECISIONS.md` append-only log)

**Rule:** Every session that makes a configuration change, scheduling change, or process change appends one line to `DECISIONS.md` at the repo root.

**Format:**
```
YYYY-MM-DD | decision summary | who decided
```

- Append-only. Do not edit prior entries.
- One line per decision. If the rationale is longer than one line, link out to a memo in `mail/` or a plan in `plans/`.
- Greppable: `grep "scheduling" DECISIONS.md` should surface every scheduling-related decision.

**Enforcement:**
- The daily brief includes a check: did yesterday's session log any decisions? If a session made changes but DECISIONS.md is untouched, flag it.
- This is part of the existing anti-zombie sweep concept but has not been enforced. Plan 1 makes it routine.

**Why this is cheap:** One line. Takes seconds. The cost of *not* doing it is high — lost institutional memory.

---

### Practice 2 — Session wrap verification

**Pattern source:** Piper Morgan's pre-commit verification habit, scaled down.

**Rule:** Before any Dispatch session or code task ends, paste the output of `git log origin/main --oneline -3` into the activity log entry.

**Why:** This catches the "pushed to branch not main" failure mode that has bitten us multiple times. A session reports "done" but the commit is sitting on a feature branch nobody is going to merge. The verification is a single read against the remote — if main has the new commit, you'll see it in the top of the log.

**How to apply:**
- At end of session, run: `git fetch origin && git log origin/main --oneline -3`
- Copy the three-line output into the activity log entry under a "Verification" heading.
- If the expected commit is *not* on origin/main, fix it before closing out.

**Cost:** One command, one paste. No hooks, no scripts, no automation.

---

### Practice 3 — One-off plan convention

**Pattern source:** Plans directories elsewhere in the portfolio, formalized for Dispatch.

**Rule:** Distinguish long-running plans from one-off plans by name.

- **Long-running plans:** Stable names at known locations. Example: `plans/dispatch-project-roadmap.md`. These are the reference docs that sessions consult to understand ongoing work.
- **One-off plans:** Dated or named for the specific work. Example: `plans/brief-reliability-fix-2026-05-20.md`. These are scoped to a single piece of work and have a definite end.

**Each plan has:**
- **Objective** — one paragraph, what we're trying to do and why
- **Current state** — what we know now, with dates and forensic detail where relevant
- **Steps** — sequential, each with a decision gate or verification before proceeding
- **Success criteria** — how we know we're done
- **Status tracking** — DRAFT / IN PROGRESS / BLOCKED / COMPLETE

**On completion of a one-off:**
- Outcomes roll into the relevant long-running doc (e.g., the project roadmap or the operations log).
- The one-off plan is either archived or marked COMPLETE inline. Do not delete — historical plans are useful when the same problem recurs.

**Why this matters:** Plans are the reference that prevents drift between sessions. Without the convention, plans pile up and lose authority.

---

## Execution Steps

1. **Review and approve this plan.** (xian)
2. **Update DECISIONS.md** with three entries, one for each practice adopted today.
3. **Update PROTOCOLS.md** to codify session-wrap verification (Practice 2) as a required closing step for Dispatch sessions. Mention the DECISIONS.md discipline and the one-off plan convention in the appropriate section.
4. **Log in `memory/dispatch-activity-log.md`** that these practices were adopted, with a pointer to this plan.
5. **Apply these practices immediately to `brief-reliability-fix-2026-05-20.md`** — that plan is the first test case for whether the practices are workable in real conditions.

---

## Success Criteria

- DECISIONS.md has at least one entry from each Dispatch session that makes a change, for the next 14 days.
- Activity log entries from the next 14 days each contain a "Verification" block with `git log origin/main --oneline -3` output.
- The next one-off plan (Plan 2) follows the convention without rewriting.

---

## Status

**DRAFT — awaiting review.** No execution until xian signs off.
