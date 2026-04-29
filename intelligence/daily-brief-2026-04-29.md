# Dispatch Daily Brief — 2026-04-29 (Wednesday)

**Headline:** Two new asks landed in `dispatch/mail/` at 06:10 PT this morning from Dispatch-Kind — a topology question on cross-project mail (Shape A inline-relay vs Shape B per-agent inbox) and routing of PO's xian-collaboration-patterns synthesis. PM had a 30+-commit Tuesday — branch-discipline v1.0 DRAFT, sign-off-discipline norm, ADR-061 v0.1 review, deliver-mail b1 + merge-keeper-sweep adopted, Phase F flag-flip resolved as AUTHORIZE-WHEN-OBSERVED. Klatch ran Round 31 + 31b /import round-trip extended coverage. OpenLaws closed Bet 1 Sprint Day 2 with PO Phase 4 + 5 audits and two state citation upgrades.

## Overnight Activity

- **Piper Morgan (product, 30+ commits — heaviest)** — Branch + worktree + mailbox discipline v1.0 DRAFT (PA); sign-off discipline broadcast (Docs, push to origin/main before session end); ADR-061 v0.1 review filed by Lead Dev (strong v0.1, 2 substantive completeness fixes); #1007/#1008 vs #1018 — verdict don't fold, sequence #1018 first; SessionEnd + PreCompact hook scoping (~30-60 min, warn-only); deliver-mail (b1) + merge-keeper-sweep both ADOPTED today; Phase F flag-flip routed AUTHORIZE-WHEN-OBSERVED, wait for calibration window; cleanup-dev-active sweep 67→13 files; Apr 27 omnibus filed (HOST 360 cohort + Architect Phase 1 review + Docs reframing). Five PR merges. HOST published 360 synthesis cover.
- **Klatch (5 commits)** — Round 31 `/import/klatch` round-trip + `POST /api/projects` memory field; Round 31b extended coverage for round-trip; live MAXT (Theseus); Calliope 4/28 routed round-trip findings to Iris (UX) + Daedalus (impl + design); provenance-summary fix for klatch-sourced channels.
- **OpenLaws (~10 commits)** — Bet 1 Sprint Day 2: Phase 4 PO factual-gap remediation (FL + DE); Audit Pass 5a + 5b complete; PO citation upgrades — NY → nysenate.gov (Open Legislation), TX → statutes.capitol.texas.gov; citation verification v2 plan + agents launched after fabrication caught; Tuesday PO accumulation log.
- **designinproduct (~5 commits)** — Backlog §1a/§1c/§1d + PA-reply-convention closed; CSV reconciliation surfaced as active §1 item; xpoll receipt Apr 28 substantive (7/7 delivered) + Apr 29 receipt started; PA Q6 closure to Janus; relay of CoS Q2+Q5 for OpenLaws Bet 1 bundle; Apr 27 trigger fixes.
- **Dispatch (~5 commits)** — Two new DK→DinP arrivals at 06:10 today (topology question + PO collab-patterns synthesis routing); mail-path correction memo to DK (briefing-YYYY-MM-DD.md, not current.md); standing-items config added (kindsys balance + working-tree hygiene); usage Apr 28 snapshot logged; Apr 28 daily memo to DK.
- **Piper Morgan (website)** — "The Deeper Why" published Apr 28.
- **Weather/Zephyr** — No new commits.
- **Rebel** — Still not a git repo (back burner since Apr 9).

## Needs Your Attention

- **NEW from Dispatch-Kind (06:10 today, low urgency):** Topology question — should sister-agent mail land in per-agent inboxes on the dispatch hub directly (Shape B), rather than going through inline-relay-on-demand (Shape A, current)? DK recommends B; wants your gut read + volume check on the DinP side. Concrete trigger: PO couldn't see Calliope's original advice-reply because PO doesn't clone Klatch. Memo at `~/cool/dispatch/mail/signal-dispatch-kind-to-dispatch-dinp-2026-04-28-mail-deposit-topology-question.md`.
- **NEW from Dispatch-Kind (06:10 today, delivery not re-ask):** PO authored a synthesis of patterns observed working with you (companion outbound to the inbound advice request); you greenlit Friday with framing fixes already absorbed. DK is delivering via shared `dispatch/mail/` rather than inline. Wants ack on routing path (inboxes / Janus / single shared post). Memo at `~/cool/dispatch/mail/memo-dispatch-kind-to-dispatch-dinp-2026-04-28-route-collaboration-patterns-synthesis.md`.
- **Working-tree hygiene (standing item):** dispatch is clean except the auto-committed activity-log change. piper-morgan-product has two untracked files (`dev/2026/04/28/2026-04-28-0652-pa-opus-log.md`, `dev/active/merge-keeper-2026-04-28.md`) and a deleted draft (`docs/public/comms/drafts/draft-the-deeper-why-v1.md`) — Lead Dev's tail commit notes tasks 1-4 complete and standing by. designinproduct has 3 untracked log files (Apr 27, Apr 28) and `resources/` subdirs (labrador, memory-research, sneakernet-test).
- **Usage CSV reconciliation now active §1 in Janus DinP backlog (added Apr 28).** CSV last appended Apr 17 — 12 days stale. Apr 25 + Apr 28 snapshots captured in dispatch activity log; not yet structured into the CSV.

## Agent Status

- **Janus** — Apr 28 substantive brief delivered (3 sources). Backlog restructured: §1a/c/d + PA-reply-convention closed; CSV reconciliation surfaced as active §1.
- **Argus** — Internal curated sweep last Apr 26 (3 days, healthy; flag at 14). External CCR scan: latest file in `klatch/docs/intel/` is still Apr 26 — Mon Apr 27 9 AM PT auto-trigger appears to have produced no new file (3 days dark, not yet at 8-day automation-flag threshold but worth a glance if Mon May 4's run also misses). Sonnet/Opus 4 DB audit before Jun 15 still tracked.
- **Theseus (Klatch)** — Round 31 + 31b extended coverage Apr 28; live MAXT and round-trip exercises against imported Klatch channel.
- **Calliope (Klatch)** — Routed round-trip findings to Iris (UX) + Daedalus (impl + design) Apr 28. PO-advice reply already filed Apr 26 — Klatch reply cycle complete.
- **Daedalus (Klatch)** — Implementation/design assignment from Calliope on round-trip Apr 28.
- **Lead Dev (PM)** — Heavy Tuesday: ADR-061 v0.1 review, #1007/#1008/#1018 overlap verdict, hook-feasibility scoping, sizing reply on merge-keeper + deliver-mail, branch-discipline concur, issue-triage memo (5 candidates) — tasks 1-4 complete, standing by for direction on triage.
- **PA (PM)** — Branch + worktree + mailbox discipline v1.0 DRAFT shipped; status updates filed.
- **Docs (PM)** — Sign-off discipline broadcast (push to origin/main before session end); SessionStop hook scoping ask filed; merge-keeper-sweep adopted as standing pattern.
- **Exec (PM)** — Day 3 morning: briefing-freshness diagnosis, cross-project comms-gap escalation to Architect, tracker reconciliation.
- **HOST (PM)** — 360 synthesis cover published.
- **Dispatch-Kind** — Two new memos to DinP at 06:10 today (topology question + PO collab-patterns relay). Daily memo cadence active.

## Deadlines

- **Today (Wed Apr 29)** — OpenLaws Bet 1 Sprint Day 3 (prototype bake-off prep — John's Scalar vs OpenLaws POC, Vergil pickup signaled).
- **Fri May 1 (T+2)** — both extra-usage caps reset (dinp $200, kindsys $150).
- **Sun Jun 7 (T+39)** — Bet 1 sprint window close.
- **Sun Jun 15 (T+47)** — Sonnet 4 / Opus 4 deprecation. Aliases in place; DB audit query for pinned literal IDs is the remaining work (Argus-tracked).

## Usage Check

- **designinproduct.com (Max 20x)** — last full snapshot Apr 28 (06:36 PT): session 5%, weekly 63% all-models / 2% Sonnet, **extra usage $200.15 / $200 cap (100%)**, balance $32.90, auto-reload ON. Resets May 1.
- **kindsys.us (Max 5x)** — last full snapshot Apr 28: session 0%, weekly 53% all-models / 2% Sonnet, **extra usage $151.85 / $150 cap (101%, over by $1.85)**, balance **$14.46** — still below $20 watch threshold. Auto-reload ON. Resets May 1. OpenLaws Bet 1 sprint continues to drive Kind-side burn.
- CSV append still pending since Apr 17 (12 days). Now an active §1 item in Janus's DinP backlog.

## Today Carried Queue

- **Topology question reply to DK** — Shape A (status quo) vs Shape B (per-agent inboxes on dispatch hub) — your gut read.
- **PO collab-patterns routing ack** — pick a path (per-agent inboxes / Janus / single shared post on the hub).
- **Usage CSV reconciliation** — now Janus §1; Apr 25 + Apr 28 snapshots in activity log waiting to be structured.
- **piper-morgan-product + designinproduct working-tree cleanup** — untracked files noted above; not blocking, but hygiene drift.

*Dropped from yesterday's queue (verified):*
- **#992 Phase F flag-flip decision** — CLOSED. PM/PA routed AUTHORIZE-WHEN-OBSERVED Apr 28 (commit `bc9edcfe`); ADR-061 v0.1 in flight from Architect. Now an ops-cadence item, not a xian-input item.
- **PO advice — Calliope (Klatch) reply pending** — CLOSED. File on disk: `~/cool/klatch/docs/mail/calliope-to-janus-po-advice-reply-2026-04-26.md` (Apr 26).
- **Janus DinP backlog §1 items (bootstrap / memory / daily memo)** — CLOSED. Backlog commit `934b0c6` closed §1a/§1c/§1d and PA-reply-convention; CSV reconciliation now the surfaced §1 item (still pending, see above).

## Cross-Project Intelligence

`cross-pollination-current-week.md` covers Apr 21–27 (mtime Apr 27, now 2 days old — right at the staleness threshold; Apr 28 daily brief was substantive). The week's two through-lines worth carrying:

1. **Mail-as-artifact loop is a recurring topology gap** — the DK signal this morning is the first formal articulation. Same-shape problem the PM `mailboxes/` discipline and Dispatch's consolidated-relay pattern have both been working around. If you go Shape B, the Dispatch hub becomes the canonical cross-account mail surface — aligns with your standing "origin/main is source of truth for cross-account work" principle.
2. **Methodology compounding (PM + Klatch parallel)** — Methodology-24 (Branch-or-Anchor) + 25 (Workstream Review Cadence) + Patterns 062/063/064 catalog now feeding back into instruments (CT v2.3 self-implements Pattern-063). Klatch's first live MCP stdio integration (27/27) + three round-trip gap findings (UUID-matching, no `/import` for canonical, L4/L5 silently dropped) are the test-driven analogue — feature-completeness surfaces real-deployment gaps no test suite would catch.
