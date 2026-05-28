---
title: Duty-cycle pattern — exploration doc for DK (and DinP, sideways)
date: 2026-05-28
author: Dispatch-Kind
status: draft — exploration; no decisions requested yet
related:
  - intelligence/cross-pollination/2026-05-17.md (Insight #3 — CIO V1 duty-cycle design)
  - intelligence/cross-pollination/2026-05-18.md (Methodology-31 reference, cohort context)
  - intelligence/cross-pollination/2026-05-19.md (Insight #3 — CIO cohort expansion to four roles)
  - proposals/2026-05-19-cross-pollination-adoptions.md (sibling adoption batch)
  - proposals/2026-05-21-slack-relay-design.md (sibling design-doc template)
  - standards/SAFE-PUSH.md, standards/PRE-COMMIT-HOOK.md (existing DK standards stack)
---

# Duty-cycle pattern — exploration for DK

## TL;DR

Piper Morgan's CIO autonomous duty cycle — fixed-interval background loop, one-file-per-fire append-only log, lightweight escalation surface — went from solo design to a four-role cohort in a week. Piper Open piloted the same shape on 5/28. DK already runs scheduled tasks, but on a coarser daily cadence with heavier per-fire outputs; the duty-cycle pattern is a different shape, not the same shape with different numbers. This doc explores what we'd be trading if we adopted a version of it, surfaces design questions for xian, and proposes a phased look-before-leaping rather than an implementation plan.

## What the PM CIO duty cycle is

From the 5/17 brief (Insight #3): a fixed 30-minute autonomous loop. Each fire does three things — process inbox, advance whatever methodology work is next, fold a cycle log to main — and then sleeps. The North Star, named explicitly: "PM checks in because PM wants to, not because PM has to."

Five components in the V1 design:

1. **Fixed-interval cadence primitive** (30 min, deliberately crude for V1 to validate the outer loop).
2. **Reused authority model.** The cycle uses the existing conversational rule ("do everything you're unblocked on, batch questions, use discretion") rather than inventing a new authority regime. The only change is the trigger.
3. **Escalation file** (a single markdown file PM glances at when curious) — question + asked-when + recommended-by-when + context fields.
4. **Daily digest** at ~10pm Pacific, written into the session log.
5. **Async-collaboration layer**, deferred past V1.

The crucial framing: the duty cycle is a **velocity multiplier on an existing working practice**, not a new permission system. The CIO can already file methodology entries, dispose inbox items, commit and push. The duty cycle just removes "wait for PM to start a session" as the gating event.

By the 5/19 brief (Insight #3), the cohort had expanded to four roles in 24 hours — CIO, HOST, Docs, Exec — at hourly cadences staggered on different minutes (`:11`, `:13`, etc.). Architect and Lead Dev were explicitly deferred: focus-intensive roles need a different cadence pattern. PO piloted the same shape on the OpenLaws side this morning (5/28) — three autonomous signal-responses fired around 06:14 PT.

## What Methodology-31 does mechanically

Methodology-31 (Append-Only Autonomous-Cycle Architecture) names the architectural invariant that makes the cohort safe: **each cycle fire modifies exactly one file — the cycle log — and that file is append-only**. Fast-forward push, no merge surface, zero conflict potential at fold time.

This is the part of the PM design that travels independently of PM's specifics. The reason CIO + HOST + Docs + Exec can run hourly on staggered minutes without stepping on each other isn't the staggering — it's that each role's fire writes to its own append-only log file. The staggering just reduces simultaneous push contention; the invariant is what makes it safe even if they did contend.

For our situation — DK and DinP both pushing to `dispatch`, plus possible future Cowork agents on the same repo — this is the part of the pattern that matters most. Whatever cadence we choose, the per-fire write shape should not produce merge conflicts with concurrent writes from other agents.

## What DK already does that's analogous

DK currently runs two scheduled tasks on the kindbook Cowork instance:

- **`dinp-daily-memo`** — fires once daily (~5pm), composes a full memo to DinP, commits and pushes via `safe-push.sh`. Heavyweight output: a thought-through report rather than a log entry.
- **`dinp-inbox-check`** — fires once daily (~8am), audits the inbox state, writes an inbox-check signal. Lighter than the memo, but still a composed signal rather than an append.

Both follow the Phase 0 pull discipline + Phase 0.5 verify-before-querying discipline. Both use `mcp__Control_your_Mac__osascript` for git ops as a bridge into the host filesystem, with the launchd push-arm (every 15 min outside Cowork) as belt-and-suspenders for any push that doesn't land cleanly.

DinP runs analogous tasks from her side via `start_code_task` + sandbox bash + git over HTTPS — the canonical pattern after the 5/15 ghost-run-fix. Her daily-brief recipe is documented in `mail/memo-dispatch-dinp-to-dispatch-kind-daily-briefing-recipe-2026-05-19.md`.

The shape we already have: low frequency, high composition, one substantive artifact per fire. The CIO shape: higher frequency, lower per-fire composition, append-only logs accumulating into a daily digest.

## What would change if DK adopted a duty-cycle pattern

The interesting question is not "could we run more often." It's: **would a different cadence + output shape produce better fidelity with what xian actually needs from DK?**

Concrete shifts to consider — none of these are recommendations yet, just the design surface:

- **Cadence.** Today's daily fixed times become hourly (or staggered-multi-hour) check-ins during the working day. The full daily memo doesn't disappear; it becomes a roll-up of the cycle log rather than a from-scratch composition.
- **Per-fire output shape.** Instead of "compose a memo," the per-fire shape becomes "scan dispatch for new signals addressed to DK; append a line per finding to today's cycle log; act on anything unblocked; close the loop." Composition only when there's enough material to warrant it.
- **Where the cycle log lives.** Open question. Candidate locations: `dispatch/intelligence/dk-cycle-YYYY-MM-DD.md` (one file per day per agent, mirrors the per-role-per-day session-log convention OpenLaws already uses); or `dispatch/memory/dk-cycle-log.md` (single rolling file). The per-day-per-agent shape is closer to the Methodology-31 invariant — each file has a single writer, so the merge surface is structurally zero.
- **Daily memo's fate.** Two options: (a) it stays as a composed end-of-day digest of the day's cycle log; (b) it gets absorbed entirely into the cycle log and DinP reads the log directly. Option (a) preserves the current handoff shape DinP relies on; option (b) is closer to PM's pattern but requires DinP-side adaptation.
- **Escalation surface analog.** PM's escalation file is "questions for PM, batched, visible when PM is curious." Our analog would be questions for xian — but xian already has an attention-queue convention (`xian-attention-queue.md`) and the daily memos already surface things he should look at. The duty-cycle pattern would either replace the attention queue or feed into it on a different cadence.
- **Authority model.** No change. DK already operates under "do what you're unblocked on, surface what you're not." The duty cycle would not introduce new authority — same constraints, different trigger.

## Design questions for xian

These are the questions I'd want resolved before any implementation work:

1. **Coordinated adoption with DinP, or solo first?** DinP and DK both push to `dispatch`. Methodology-31's zero-conflict invariant matters most when multiple agents are writing on overlapping cadences. If we adopt this, do we want a joint design pass with DinP first — so the cycle-log convention is shared — or does DK pilot solo and DinP picks it up only if she wants to?

2. **Does the daily memo stay or get absorbed?** The current daily memo is a known surface DinP depends on. If DK shifts to cycle-log primary, does the memo become a daily roll-up of the cycle log (extra step at end of day), or does DinP read the cycle log directly and the memo retires?

3. **What's the right cadence for DK?** PM is on hourly (`:11`, `:13`, etc.). DK's natural rhythm has been daily, partly because the inbox volume is low — most days there are 0-2 new signals for DK. Hourly might be over-frequent given the actual signal rate; multi-hour (every 3-4 hours during the working day) might fit better. Or: variable cadence, where the loop sleeps longer if the prior fire found nothing.

4. **Escalation surface — do we need one separate from the attention queue?** PM's escalation file is a "questions PM can glance at when curious" surface. The dispatch attention-queue convention already exists and surfaces in daily memos. Do we want a second surface for cycle-generated questions, or fold them into the existing queue?

5. **What's the minimum useful pilot?** Could we pilot the append-only log shape (Methodology-31's invariant) at our current daily cadence as a v0 — i.e., change the output shape without changing the cadence — and only revisit cadence once the log shape is proven? That's the cheapest possible first move; it tests the most architecturally important piece without changing user-visible rhythms.

## Recommended phasing if we proceed

Treating this as design-only for now. If xian sanctions further work, here is the staged shape I'd propose:

- **Phase 0 (this doc).** Frame the design space. xian reads, lands a position on the questions above. No code changes. Possibly: a brief signal to DinP inviting her to weigh in on Q1.
- **Phase 1: Output-shape pilot (cadence unchanged).** Add a per-day append-only cycle log for DK (`dispatch/intelligence/dk-cycle-YYYY-MM-DD.md` or similar). Existing scheduled tasks keep their daily cadence but write a cycle-log entry per fire as well as their current composed output. Two weeks of observation: does the log accumulate usefully? Does it merge cleanly with DinP's concurrent writes?
- **Gate Phase 1 → Phase 2.** Log shape is stable; no merge incidents; the log entries are scan-worthy on their own. xian sanctions cadence change.
- **Phase 2: Cadence change.** Introduce a finer-grained DK check-in cycle (cadence TBD per Q3). The composed daily memo either stays or gets replaced per Q2's resolution.
- **Gate Phase 2 → Phase 3.** New cadence is steady; signal-response latency improves measurably; DinP confirms the new shape works on her side.
- **Phase 3: Cohort consideration.** Revisit whether DinP (and any future Cowork agents on `dispatch`) want to adopt the same pattern. By this point Methodology-31's invariant has been validated in practice on our infrastructure, not just inherited from PM.

Each gate is a discretion point, not a commitment. We can stop at Phase 1 if the output-shape change alone is sufficient.

## Honest trade-offs

A few things worth naming plainly, since the family-resemblance discipline says imported phrases should travel with their mechanism, not just their vocabulary:

- **PM's pattern emerged from PM's pressures.** PM has high inbox volume across many roles and a continuously-growing methodology corpus to advance. DK has neither: low signal volume, no methodology corpus to advance per-fire. The duty cycle's "advance methodology" beat doesn't have a clean DK analog. That's not a reason to skip the pattern, but it's a reason to be skeptical of importing all five PM components wholesale.
- **The North Star matters.** "PM checks in because PM wants to" was the design driver, not the cadence. The DK analog isn't "fire more often"; it's "the agent acts when there is something to act on, and rests otherwise." That can be implemented at almost any cadence with the right output-shape discipline.
- **Methodology-31 is the part that travels cleanly.** The append-only single-file-per-fire invariant is a structural property that helps any multi-agent shared-repo setup, independent of cadence. If we adopt nothing else from this pattern, we should probably adopt that — and the easiest path is the Phase 1 pilot above.
- **The escalation file may not transfer.** xian's attention surface is already differentiated (daily memo, attention queue, direct signals). Adding a fourth surface for cycle-generated questions may add noise rather than reduce it.

## Cross-references

- **5/17 brief Insight #3** — CIO V1 duty-cycle design (the source pattern).
- **5/18 brief context** — Methodology-31 named as the architectural invariant.
- **5/19 brief Insight #3** — cohort expansion from 1 to 4 roles in 24 hours.
- **PO's 5/28 autonomous fire pilot** — three signal-responses ~06:14 PT on the OpenLaws side; the same shape applied to a peer.
- **Standards stack** — `SAFE-PUSH.md`, `PRE-COMMIT-HOOK.md`, `MERGE-KEEPER-SWEEP.md`. Any duty-cycle implementation rides on these; they are not displaced.
- **`memo-dispatch-dinp-to-dispatch-kind-ghost-run-fix-2026-05-15.md`** — why scheduled tasks here use `start_code_task` as the executor.
- **`memo-dispatch-dinp-to-dispatch-kind-daily-briefing-recipe-2026-05-19.md`** — DinP's existing scheduled-task shape; the duty-cycle conversation has to account for it.

## What I need from xian

Not a green light to build anything. What's useful at this stage:

- A position on Q1 (coordinate with DinP first, or solo pilot?).
- A read on Q2 (does the daily memo stay, get absorbed, or change shape?).
- A take on Q5 (is the cheapest possible first move — output-shape pilot at current cadence — the right Phase 1, or does it skip the interesting question?).
- General "is this the shape worth exploring further" gut check.

The other questions can wait for the next pass. This doc is meant to be iterated on; nothing here is a commitment.

— Dispatch-Kind, 2026-05-28
