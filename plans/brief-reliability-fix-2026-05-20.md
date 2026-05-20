# Daily Brief Reliability Fix — Diagnosis and Restoration

**Date:** 2026-05-20
**Author:** Dispatch-DinP (with xian)
**Status:** DRAFT — awaiting review
**Type:** One-off
**Depends on:** `dispatch-practice-upgrade-2026-05-20.md` (practices applied during execution)

---

## Objective

Restore reliable daily brief generation. The brief is Dispatch's heartbeat — when it doesn't fire, downstream agents lose their morning context and xian loses visibility into ecosystem state. We've had two missed days in the last four (May 18, May 20) and the underlying scheduling has been quietly broken since the May 17 osascript-to-bash migration.

This plan follows the three practices from Plan 1: every change gets a DECISIONS.md entry, every step ends with a verification, and this document itself is the one-off convention in action.

---

## Current State (forensically verified 2026-05-20)

- **`dispatch-daily-brief`** scheduled task exists but is unreliable.
  - Rewritten from osascript to bash+git-over-HTTPS on 2026-05-17.
  - Under the new path, only 2 of 4 expected briefs fired (May 17 and May 19).
  - Currently configured as one-shot `fireAt` (auto-disabled after May 18/19 fire).
- **`dispatch-brief-reminder`** was NEVER migrated off osascript — may be silently broken. No evidence it has fired since the migration.
- Briefs archive to `intelligence/daily-brief-YYYY-MM-DD.md` when they fire. Gap: May 18 missing, May 20 missing as of this writing.
- None of the May 17 changes were logged in DECISIONS.md.

## What We Don't Yet Know

- Why May 18 and May 20 didn't fire (the Cowork scheduler is opaque from the repo side).
- Whether the Cowork scheduled-task UI shows the task as enabled, disabled, or errored.
- Whether `dispatch-brief-reminder` is actually firing or ghost-running.
- What the pre-May-13 runner mechanism was (those commits landed under the `mediajunkie` identity, not the SKILL.md-identified agent).

We will not move past Step 1 until these are answered.

---

## Steps

Each step has a decision gate. Do not proceed to the next step until the current step's verification passes.

### Step 1 — Diagnostic: inspect Cowork scheduled-task state — DONE

- xian opens the Cowork UI Scheduled section and reports the status of `dispatch-daily-brief` and `dispatch-brief-reminder` (enabled / disabled / errored / last-run timestamp).
- Check `coworkd.log` for fire attempts on May 18 and May 20. Grep for the task names and for the dates.
- Determine the failure mode for each task: not scheduled? scheduled but errored? scheduled and silently succeeded with no side effect?

**Decision gate:** Proceed only when we have a documented hypothesis for *why* each missed day was missed. Write the hypothesis into this plan under "Step 1 findings" before moving on.

---

### Step 2 — Fix `dispatch-daily-brief` scheduling — DONE

- Convert from one-shot `fireAt` back to a recurring cron. Proposed: `0 6 * * *` (6:00 AM PT daily).
- Read the current `SKILL.md` content. Confirm it does not contain an exposed PAT — the DK memo redacted it, but the original file needs to be checked directly.
- Run the task manually once and verify all three of:
  1. Brief file appears at `intelligence/daily-brief-YYYY-MM-DD.md`.
  2. Commit lands on `origin/main` (not on a feature branch).
  3. Content is substantive — not empty, not an error message, not a placeholder.
- Append DECISIONS.md entry for the cron change and any SKILL.md edits.

**Decision gate:** Manual test passes all three checks before enabling the recurring schedule.

---

### Step 3 — Backfill missing briefs

The archive at `intelligence/daily-brief-*.md` currently has gaps on **May 13, 14, 15, 16, 18, and 20**. Backfilling gives us a complete record before we go forward, which matters both for future agents reading the archive cold and for our own ability to grep across the record without surprise holes.

- For each gap day, reconstruct a brief from available evidence:
  - `memory/dispatch-activity-log.md` entries for that date
  - Git history (`git log --since=YYYY-MM-DD --until=YYYY-MM-DD+1 --all`)
  - `mail/` items dated that day (signals sent, signals received, memos)
  - `intelligence/cross-pollination/YYYY-MM-DD.md` where present
- Each backfilled brief MUST be marked at the very top with:
  ```
  [BACKFILLED 2026-05-20 — reconstructed from available records]
  ```
  This is non-negotiable. A backfilled brief is not the same artifact as a live brief and must not be mistaken for one by a future reader.
- Backfills are best-effort. If evidence is thin for a given day, the brief notes that. Do not invent activity to fill space.
- Write each file as `intelligence/daily-brief-YYYY-MM-DD.md`.
- Append one DECISIONS.md entry for the backfill operation (one line covers all six days).

**Decision gate:** All six gap-day files exist, each carries the backfill marker, and the archive is grep-clean for the May 13–20 range (`ls intelligence/daily-brief-2026-05-1*.md intelligence/daily-brief-2026-05-20.md` shows one file per day).

---

### Step 4 — Fix `dispatch-brief-reminder`

- Read the current SKILL.md. Confirm it still uses osascript.
- Rewrite to match the pattern that works for `dk-daily-memo` — either bash+git or `start_code_task`, whichever is in use for the working analog.
- Run manually. Confirm xian actually receives the notification.
- Append DECISIONS.md entry.

**Decision gate:** Manual test produces a notification xian observes before enabling the schedule.

---

### Step 5 — Audit remaining scheduled tasks

- List all tasks in `~/Documents/Claude/Scheduled/`.
- For each, check three things: does the SKILL.md still use osascript? When did it last successfully run? Is it currently enabled?
- Known tasks to audit:
  - `dispatch-daily-brief`
  - `dispatch-activity-log`
  - `dk-daily-memo`
  - `dk-inbox-check`
  - `dispatch-brief-reminder`
  - `connector-health-check`
  - `sandbox-snapshot`
  - `cio-duty-cycle-pilot`
  - `pat-rotation-reminder`
- Flag any still on osascript for migration. Do not migrate them in this plan — file follow-ups.
- Log findings in this plan under "Step 5 findings."

**Decision gate:** Audit covers every task in the directory before moving to Step 6.

---

### Step 6 — Implement gap detection

The failure mode this whole plan is responding to is *silent* — the brief stopped firing on May 18 and again on May 20, and nobody noticed for days because nothing alerted. A gap detector closes that loop.

**Goal:** When a daily brief is missing, xian gets a notification on the next attempt — not a week later when somebody happens to look at the archive.

**Options to consider** (pick one during Step 6; don't pre-commit here):

- **(a) In-skill check.** The `dispatch-daily-brief` SKILL.md itself checks for yesterday's brief file before generating today's. If missing, the brief includes a "MISSED YESTERDAY" header and surfaces the alert.
- **(b) Reminder-side check.** `dispatch-brief-reminder` checks `intelligence/daily-brief-*.md` for continuity over the last N days. If a gap appears, the reminder message tells xian.
- **(c) Dedicated health-check task.** A separate scheduled task runs daily, verifies the last N days have no gaps, and alerts on lapse.

**Non-negotiable requirements regardless of which option is chosen:**

- The detector surfaces alerts to xian via `SendUserMessage` (or whatever the working equivalent is at execution time) — **not** a silent log entry, **not** a commit nobody will read. The whole point is to escape silent failure.
- The detector itself must be on a non-osascript runner. We are not solving silent-brief-failure by introducing silent-detector-failure.
- The detector logs each run (success or alert) to a known location so we can verify *it* is firing.

**Steps:**
- Pick one option above. Write a one-paragraph rationale into this plan under "Step 6 decision."
- Implement.
- Manually trigger a fake gap (rename a recent brief file temporarily) and confirm the alert reaches xian.
- Append DECISIONS.md entry recording which option was chosen and why.

**Decision gate:** Synthetic gap test produces a user-visible alert before declaring this step complete.

---

### Step 7 — Monitor for 3 days

- After Steps 2, 4, and 6 land, verify the brief fires daily for 3 consecutive days.
- Verify the brief-reminder fires and that xian receives the notification.
- Verify the gap detector runs each day with no false positives and no missed real gaps.
- If any day misses, halt and investigate before continuing the monitoring window.

**Decision gate:** 3 of 3 days successful before calling this plan complete. If a day misses, the counter resets to zero after the cause is fixed.

---

### Step 8 — Close out

- Update `memory/dispatch-activity-log.md` with final status and the 3-day monitoring evidence.
- Append DECISIONS.md entry recording plan completion.
- Mark this plan COMPLETE in the Status section below. Outcomes (working schedule, backfilled archive, audit findings, gap detector implementation, any follow-ups for osascript holdouts) roll into the appropriate long-running doc — `infrastructure-registry.md` for the runtime state, `dispatch-project-roadmap.md` for any follow-up work.

---

## Success Criteria

- Daily brief fires reliably every morning at the configured time.
- Brief notification reaches xian.
- Brief archive has no historical gaps: every day from May 13 through today has a file, with backfills clearly marked.
- A gap detector is live and has been verified to surface user-visible alerts on a synthetic missing-brief test.
- All scheduled tasks in `~/Documents/Claude/Scheduled/` are accounted for; any remaining osascript holdouts are documented in a follow-up.
- All changes made by this plan are logged in DECISIONS.md.
- Brief archive (`intelligence/daily-brief-*.md`) has no gaps going forward from the day Step 2 lands.

---

## Status

**DRAFT — awaiting review.** Depends on `dispatch-practice-upgrade-2026-05-20.md` being executed first so the DECISIONS.md and session-wrap verification practices are in place when this plan runs.
