# Dispatch Daily Brief — 2026-05-29 (Friday)

*Produced from sandbox via git-over-HTTPS at ~06:00. No commits yet today across any repo; latest activity is 2026-05-28. Klatch / Rebel / Weather could not be cloned by the brief's PAT (see correction under Needs Your Attention).*

## Overnight Activity

- **piper-morgan-product (~12 commits 5/28)**: CIO duty-cycle ran clean through the day — Fires 7, 8, 9 all clean-IDLE (inbox empty); Fire 9 also shifted logging convention to batch quiet fires and cut main-churn. Architect closed **#1016** (boundary-map v0.2, close-ready) and dispositioned **#1117** as Option C (M3, Phase-4-alignment instance of #1016). Heavy v0.7 design traffic: **Rule-2 relaxed to Model A (leave-cron-running), PM-ratified, cohort-wide**; canonical cron-prompt template READY; worktree-as-cycle-default debated (Architect + HOST + CIO concur, 4 refinements). Docs triage routing accepted (#972/#974/#1058 to Docs; #973→Lead, #941→Comms).
- **OpenLaws (5 commits 5/28)**: **6 AM START fire fired and ran clean — the loop's first real autonomous morning rouse PASSED**; 19:07 anomaly the night before resolved as a one-off deferred tick. Three DK signals processed and acked. **Synthetic-SME harness plan shipped** (PO starter draft for xian review + Vergil pickup) per Week-5 top-priority directive. Post-call batch of five directives executed (see PO log).
- **designinproduct (4 commits 5/28)**: Janus 5/28 sweep substantive + **cross-pollination delivery 7/7 (2 via MCP fallback — git 503 on klatch + weather)**. Brief themes: v0.6.3 idle-to-output, GitHub Actions decay, day-boundary confirmed.
- **dispatch (3 commits 5/28)**: 5/28 cross-pollination brief published (nine-role cohort rollout); inbox-check 5/28 clean (DK 5/27 EOD acked <24h, no asks); pattern-073 closed; Dispatch-Kind duty-cycle exploration doc landed.
- **piper-morgan-website (1 commit 5/28)**: "The Misfiled Voice Guide" blog post added.

## Needs Your Attention

- **Repo-access correction — Klatch + Weather are NOT gone.** Yesterday's brief speculated they may have been renamed/removed (org listing showed them absent). The Janus sweep **delivery-log proves otherwise**: both klatch (`bc041dd`) and weather (`f9ec0e2`) received commits on 5/28 via MCP fallback, as they have every day. The repos exist and are actively written. The real issue is narrower: **the daily-brief's PAT cannot clone them** (likely private + PAT scope, or a clone-URL mismatch), while the sweep's MCP path can. Actionable fix is on the brief side — update the PAT scope or the clone list in SKILL.md — not a repo-existence question. Klatch remains formally paused regardless.
- **PR #49 (`fix/plugin-product-name`) — OPEN since 5/26, possibly overlooked.** Per PO 5/28: it's just the product-name ratification question — **"OpenLaws Research Agent," yes/no — a quick call**. 3 days open.
- **OpenLaws Synthetic-SME harness plan** — PO shipped a starter draft 5/28 for your review (Vergil to pick up); Week-5 top-priority directive. Awaits your pass.
- **UV/Node + hosted-MCP destination conversation with Jerry** — spike still standing (clean A/B: UV-bundle 1–2 days vs Node-rewrite 1–2 weeks). **Jerry off Fri Jun 5, then Big Bear remote / out through Jun 15** — window is closing.
- **HOST v0.3 Agent-360 questionnaire draft** — shared 5/27, awaits your pre-fielding pass. 2 days.
- **`merge-keeper-sweep.sh` v0.2 `SWEEP_SKIP_WORKTREE` env-guard** — open since 5/14 (**15 days**). Next sweep window **Sun 6/1 (T+3)** — bake the guard or DK applies inline again.
- **OpenLaws Vergil-branch triage** — `vergil/install-guide-fix-2026-04-30` + `vergil/cross-check-10-state-2026-04-29` (8 commits Haiku ablation; **do NOT delete without Vergil**). Still in the active attention queue.
- **PR #40 (Phase A bundle)** — Jerry + Copilot review still pending; you're integration arbiter. ~10 days open.
- **Anthropic competitive-context meeting?** — open since 5/12 (LDH × Anthropic legaltech-marketplace launch). **T+17 to the Jun 15 billing split.**
- **Usage CSV refresh** — last entry **2026-05-05 (24 days stale)**, past four weekly resets. **kindsys balance $6.35, under the $10 watch threshold** five weeks running; auto-reload ON. Both caps (dinp $200 / kindsys $200) reset **Mon Jun 1**.

## Agent Status

- **CIO (PM)**: Multi-day autonomous operation continues; 5/28 Fires 7–9 all clean-IDLE. Logging-convention shift to batch quiet fires (cut main-churn). ~9 v0.7 candidates accumulating; Model A ratified as canonical (leave-cron-running).
- **Architect (PM)**: Productive day — #1016 closed (boundary-map v0.2), #1117 → Option C, multiple worktree-cycle refinements filed.
- **Lead Dev (PM)**: Heavy mailbox day (11 inbox items) — worktree-reversal, Rule-1-under-Model-A clash data, #1016/#1117 dispositions. Cron at `:27`.
- **Docs / HOST / PA / Exec / CXO / Comms / PPM (PM)**: Cohort duty-cycle rollout proceeding; v0.7 cron-template + Model-A adoption acks flowing across roles. HOST v0.3 questionnaire awaiting xian.
- **PO (OpenLaws)**: **Overnight reliability test passed** (6 AM START fired clean); v0.6.3 adoption codified into loop prompt; five post-call directives executed; **Vergil read into the duty cycle** (loop prompt + attention doc + read-in signal drafted).
- **Vergil (OpenLaws)**: Being read into the duty cycle; PR #51 reshape (option-B rebase) was still draft as of 5/28 morning.
- **Jerry (OpenLaws)**: **Off Fri Jun 5; Big Bear remote / out through Jun 15.** UV/Node spike still owed.
- **Janus (DinP)**: 5/28 sweep substantive + 7/7 delivery (2 MCP fallback). Cadence holding.
- **Argus (Klatch, split regime)**: External auto-scan continues on DinP side; internal Klatch work paused with the project.
- **Dispatch-DinP / Dispatch-Kind**: Cadence holding; 5/28 inbox-check clean, DK EOD acked <24h, pattern-073 closed.

## Deadlines

- **Sun 6/1 (T+3)**: Next `merge-keeper-sweep.sh` window — env-guard or inline workaround needed. Monthly usage caps reset (dinp + kindsys).
- **Fri 6/5 (T+7)**: Jerry off (start of Big Bear remote week).
- **Sun 6/7 (T+9)**: OpenLaws Bet 1 sprint window close.
- **Sun 6/15 (T+17)**: Anthropic billing split (Agent SDK / `claude -p` / GitHub Actions / third-party SDK → separate credit pool); Sonnet 4 / Opus 4 deprecation; Jerry returns; UV/Node + hosted-MCP conversation must land before this.

## Usage Check

- **designinproduct.com (Max 20x)**: last CSV entry **2026-05-05** — 48% weekly, balance $32.92, auto-reload ON. **24 days stale.**
- **kindsys.us (Max 20x)**: last CSV entry **2026-05-05** — 19% weekly, balance **$6.35**, auto-reload ON. **24 days stale. Balance under the $10 watch threshold five weeks running.**

## Today Carried Queue

(All items survived the DECISIONS.md + session-log anti-zombie checks.)

- Klatch/Weather PAT-clone access fix (reframed — repos exist, brief-side credential/clone-list gap).
- PR #49 product-name ratification ("OpenLaws Research Agent" yes/no) — open since 5/26.
- OpenLaws Synthetic-SME harness plan review (PO starter draft, Vergil pickup).
- UV/Node + hosted-MCP destination conversation with Jerry (window closing — Jerry out Jun 5–15).
- HOST v0.3 questionnaire draft review.
- `merge-keeper-sweep.sh` v0.2 env-guard (next window Sun 6/1).
- OpenLaws Vergil-branch triage.
- PR #40 review.
- Anthropic meeting question (T+17 to billing split).
- Usage CSV refresh + kindsys balance watch.

**Dropped this pass:**

- *DK morning signals to PO (hook reversion / Slack calibration / Notion DB)* — all three acked + dispositioned in PO 5/28 log: hook reversion ruled out for OpenLaws (kindsys-side investigation); Notion DB go-ahead given (DK starting #2, 5/08 schema); Slack calibration deferred by its own framing. Closed.
- *C1 prototype-ownership routing (b vs c)* — carried multiple days as "mostly absorbed" by the 5/27 Slack post; unverifiable as still-open. Dropped per drop-on-unverifiable.
- *Phase B surveyor handoff relay* — likely closed by the 5/27 MCP-enrichment Slack post; unverifiable as open. Dropped.
- *Brief-reliability closeout diagnostic* — closeout fired 5/28 16:00 UTC; the recurring-cron path has produced cleanly 5/25, 5/27, 5/28 and again today, demonstrating durability. No diagnostic owed; dropped from attention.
- *Bet 1 product-name shortlist (Research Workpaper / Research Trail / Verifiable Legal Research)* — superseded by the concrete PR #49 ratification ("OpenLaws Research Agent"), now tracked above as a single quick call.

## Cross-Project Intelligence

The on-disk cross-pollination current-week brief is stale (May 18–24). Fresh signals pulled from 5/28 logs instead:

- **OpenLaws hit the same shared-main concurrency hazard the PM cohort named** ("foreign-agent-commit recovery") — a push collision during the 5/28 cross-poll fire, handled cleanly with rebase + commit-by-named-path. Two independent agent loops converging on the same hazard and the same mitigation.
- **Cron-drift cohort benchmark**: PM cohort drift 4–8 min (CIO 6, HOST 4, Docs 8); OpenLaws ~6–7 min fits the range. Useful baseline for any future agent loop.
- **PM v0.6.3 (idle fires advance unblocked low-priority work)** propagated to OpenLaws — PO codified it as loop-prompt step 7 with a blast-radius / verifiability caveat ("advance if genuinely advanceable now," not "always find something"). Cross-project methodology transfer working as designed.
