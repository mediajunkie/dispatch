# Dispatch Daily Brief — 2026-05-30 (Saturday)

*Produced from sandbox via git-over-HTTPS. Today's automated morning sweep already ran clean (designinproduct sweep "substantive," cross-pollination 7/7 delivered, 1 MCP fallback). Klatch / Rebel / Weather still could not be cloned by the brief's PAT — but today's sweep read Klatch fine via the MCP path (brief delivery commit `0717077`), re-confirming the repos exist and the gap is brief-side credentials, not repo existence.*

## Overnight Activity

- **designinproduct**: **Janus's two-month session (Mar 30 → May 29) closed Friday with a formal handoff** (`HANDOFF-2026-05-29-janus.md`); successor's task 1 = build the Janus duty cycle. Today's sweep landed substantive + cross-pollination 7/7 delivered (1 MCP fallback). Cadence intact through the handoff.
- **piper-morgan-product**: Big 5/29 — **CIO Fire 7 flipped the session-log rule to event-based** ("rides with the commit," PM-ratified ~3 PM); `log-maintenance-reminder` hook flagged to Lead Dev for realignment. **Comms deployed `reconcile-drafts-calendar.py`** — first run caught two editorial-calendar drift items the manual sweep had missed. PA cycle Fire 1 drained the v0.7 adoption memo; Skunkworks Desktop-testing reminder scheduled; omnibus May 28 expanded. 5/30 cross-pollination brief published.
- **OpenLaws**: 5/29 evening **Week-5 retro sequence with xian + Vergil**; PO week-5 retro relocated to `retros/` (convention fix); canonical 5-question retro prompt reference added per xian's retro-synthesis guardrail. 5/30 cross-pollination brief published.
- **dispatch**: Today's daily memo to Dispatch-Kind sent; DK's 5/29 daily inbound and replied to (<24h, no open asks).
- **piper-morgan-website**: No new commits in window (last activity 5/28).

## Needs Your Attention

*(Every item passed the DECISIONS.md + session-log anti-zombie checks. Klatch repo not cloneable, so its DECISIONS.md could not be cross-checked — items below are non-Klatch or independently verifiable.)*

- **upload-artifact@v3 now hard-fails three PM GitHub Actions workflows.** After Support cleared the 24-day Actions trigger freeze (5/28), the E2E suite ran for the first time and auto-failed in 7s — GitHub now rejects any run referencing `actions/upload-artifact@v3` (`e2e-aaxt.yml:298`, `test.yml:415`, `pm034-llm-intent-classification.yml:145,229`). The v3→v4 bump is not a blind swap (v4 uses an immutable artifact model). Filed to Lead Dev for judgment — flagging for visibility; `cache@v3` / `checkout@v3` are on the same deprecation path.
- **Klatch / Weather brief-PAT clone gap** — repos exist (today's sweep read Klatch via MCP); the daily-brief PAT still can't clone them. Fix is brief-side (PAT scope or SKILL.md clone list). Needs your confirm on intent; Klatch stays formally paused regardless.
- **PR #49 (`fix/plugin-product-name`)** — product-name ratification, "OpenLaws Research Agent" yes/no. Open since 5/26 (4 days); no decision recorded in OpenLaws DECISIONS.md or logs. Quick call.
- **OpenLaws Synthetic-SME harness plan** — PO starter draft shipped 5/28 for your review (Vergil pickup); Week-5 top-priority directive, no review recorded yet.
- **UV/Node + hosted-MCP destination conversation with Jerry** — clean A/B still standing (UV-bundle 1–2 days vs Node-rewrite 1–2 weeks). **Window narrowing fast: Jerry Big Bear-remote Jun 1–5, off Fri 6/5, out through Jun 15.**
- **HOST v0.3 Agent-360 questionnaire draft** — shared 5/27, awaits your pre-fielding pass (3 days).
- **`merge-keeper-sweep.sh` v0.2 `SWEEP_SKIP_WORKTREE` env-guard** — open since 5/14 (16 days). **Next sweep window Sun 6/1 (T+2)** — the load-bearing one this weekend per today's DK memo. Bake the guard (alongside the Pattern-073 companion-check) or DK applies inline again.
- **OpenLaws Vergil-branch triage** — `vergil/install-guide-fix-2026-04-30` + `vergil/cross-check-10-state-2026-04-29` (8 commits Haiku ablation; **do NOT delete without Vergil**).
- **PR #40 (Phase A bundle)** — Jerry + Copilot review still pending; you're integration arbiter (~11 days).
- **Anthropic competitive-context meeting?** — open since 5/12 (LDH × Anthropic legaltech-marketplace launch). **T+16 to the Jun 15 billing split.**
- **Usage CSV refresh** — last entry 2026-05-05 (**25 days stale**), past four weekly resets. kindsys balance **$6.35** under the $10 watch threshold (six weeks running, auto-reload ON). Both monthly caps reset **Mon Jun 1**.

## Agent Status

- **Janus (DinP)**: Two-month session **closed 5/29** with structured handoff. Key insight banked: Janus's duty cycle is a *meta-coordinator* (health-checks five existing scheduled routines + drains mail + surfaces xian items), not a fresh autonomy engine like the PM cohort's. Handoff also marked **PM-git-push-403 as "load-bearing, not occasional"** — push has 403'd daily since ~5/16; the MCP-push fallback is now the functional delivery path. Sweep cadence holding (today substantive, 7/7).
- **CIO / Comms / Lead Dev (PM)**: Event-based log rule ratified and live; hook realignment owed to Lead Dev. Comms shipped the reconcile script + established `git commit -- <paths>` discipline on shared `main`. upload-artifact@v3 fix sits with Lead Dev.
- **PO / Vergil (OpenLaws)**: Week-5 retro completed with xian; Week 6 scaffold rendered (`docs/working/bet-1-week-6.html`). Vergil read into the duty cycle.
- **Jerry (OpenLaws)**: Big Bear remote **Jun 1–5**, off Fri 6/5, out through Jun 15. UV/Node spike still owed before he goes.
- **Argus (Klatch, split regime)**: External auto-scan ran today (sweep read Klatch cleanly). Internal Klatch work paused with the project.
- **Dispatch-DinP / Dispatch-Kind**: Cadence holding; today's DK memo out, no unanswered inbound >24h.

## Deadlines

- **Sun 6/1 (T+2)**: Next `merge-keeper-sweep.sh` window — env-guard or inline workaround needed. Monthly usage caps reset (dinp + kindsys).
- **Wed–Thu (Jun 1–5)**: Jerry Big Bear remote; **Fri 6/5 (T+6)** Jerry off.
- **Sun 6/7 (T+8)**: OpenLaws Bet 1 sprint window close.
- **Mon 6/15 (T+16)**: Anthropic billing split (Agent SDK / `claude -p` / GitHub Actions / third-party SDK → separate credit pool); Sonnet 4 / Opus 4 deprecation; Jerry returns; UV/Node + hosted-MCP conversation must land before this.

## Usage Check

- **designinproduct.com (Max 20x)**: last CSV entry **2026-05-05** — 48% weekly, balance $32.92, auto-reload ON. **25 days stale.**
- **kindsys.us (Max 20x)**: last CSV entry **2026-05-05** — 19% weekly, balance **$6.35**, auto-reload ON. **25 days stale; balance under the $10 watch threshold six weeks running.**

## Today Carried Queue

*(Survived the anti-zombie checks. Items that couldn't be verified open or closed were dropped silently.)*

- Klatch / Weather brief-PAT clone gap (brief-side credential/clone-list fix).
- PR #49 product-name ratification ("OpenLaws Research Agent" yes/no) — open since 5/26.
- OpenLaws Synthetic-SME harness plan review (PO draft, Vergil pickup).
- UV/Node + hosted-MCP conversation with Jerry (window closing — Jerry out Jun 5–15).
- HOST v0.3 questionnaire draft review.
- `merge-keeper-sweep.sh` env-guard (next window Sun 6/1).
- OpenLaws Vergil-branch triage.
- PR #40 review.
- Anthropic meeting question (T+16 to billing split).
- Usage CSV refresh + kindsys balance watch.
- **New:** upload-artifact@v3 GitHub Actions hard-fail (with Lead Dev; visibility item).

## Cross-Project Intelligence

Today's cross-pollination brief is fresh (5/30, substantive). Notable items:

- **Event-based log discipline** — PM replaced the 30-minute log-maintenance clock with "log entry rides with the commit." CIO immediately had a textbook catch-and-correct (committed the rule change without a paired log entry, then filed the trailing entry). Portable to Calliope (Klatch) and the new Janus session from day one.
- **Mechanism-over-vigilance validated in the wild** — Comms's `reconcile-drafts-calendar.py` caught two editorial-calendar mismatches the same-day manual sweep missed. Pattern portable to any project with a `drafts/` dir + editorial calendar.
- **upload-artifact@v3 auto-fail** — see Needs Your Attention; audit all `.github/workflows/` for v3 references before the next freeze masks failures.
- **Janus meta-coordinator framing** — duty cycles must adapt to agents that already run automations: wrap and health-check existing routines rather than build a competing autonomy engine. Useful contrast for Klatch when its duty cycle adds a second automated task.
