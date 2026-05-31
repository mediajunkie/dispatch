# Dispatch Daily Brief — 2026-05-31 (Sunday)

*Produced from sandbox via git-over-HTTPS. Today's automated sweep already ran (designinproduct sweep "substantive," cross-pollination published). **One new wrinkle:** today's cross-pollination delivery landed **6/7, not 7/7** — the piper-morgan-product leg errored with `git 403 — MCP auth expired`. The MCP-push fallback has been the functional delivery path since ~5/16; this is the first time it also failed on the PM leg. Flagged below. Klatch / Rebel / Weather still could not be cloned by the brief's PAT ("Repository not found"); pre-existing sandbox clones were owned by another user and read-only, so fresh writable clones were pulled. PM coverage here is sourced from today's cross-pollination brief, which read PM directly.*

## Overnight Activity

- **designinproduct**: 5/31 sweep **substantive**; cross-pollination brief published (*Insight Journal 27-day Jinja recursion + BYOC learnings recovered + derived-view framework complete*). Delivery **6/7 — piper-morgan-product leg errored (`git 403 MCP auth expired`)**. Janus cadence holding post-5/29 handoff.
- **piper-morgan-product** (~35 commits / 48h, via cross-poll): **Insight Journal `#1047` UAT** found the `/insights` page had been structurally unreachable for **27 days** (missing `layouts/base.html` masked by a friendly 403); the fix then tripped a **Jinja2 self-recursion** (a `{% extends %}` string inside an HTML comment, ~970-frame stack trace) — a forensic subagent caught and resolved both in one session. **Exec hit its 4th consecutive day-boundary crossing** (May 30→31, 23:43, session-continuous). **Arch closed `#1016`** (LLM-touch boundary epic, `boundary-map v0.4`) and filed a **Pattern-073 instance #9 candidate**. **PPM roadmap v17.0 DRAFT** distributed for section review. **"Stacked Silent Failures"** published + syndicated (Medium + LinkedIn) same day.
- **OpenLaws**: Saturday casual ticks; **second new wiki concept entry "eval-before-tuning"** added per xian's "ready for more" (Sat 19:14), with `concepts/README.md` Principle #4 cross-link. 19:07 deferred tick logged as the known post-REPL-idle anomaly (one-off).
- **dispatch**: 5/31 cross-pollination brief published; daily memo to Dispatch-Kind sent; DK's 5/30 daily acked (inbox-check clean, <24h, no open asks).
- **piper-morgan-website**: No new commits (last activity 5/28).

## Needs Your Attention

*(Every item passed the DECISIONS.md + session-log anti-zombie checks. designinproduct + dispatch DECISIONS.md read — no new closing entries. PM + OpenLaws carry no DECISIONS.md; Klatch repo not cloneable, so its log could not be cross-checked — items below are non-Klatch or independently verifiable.)*

- **PM cross-pollination delivery is now failing on the MCP path too.** Today's leg to piper-morgan-product errored `git 403 — MCP auth expired`. Per the 5/29 Janus handoff, PM git-push has 403'd daily since ~5/16 and the MCP-push fallback was the working delivery route. If that path's auth has now expired, PM has **no clean inbound delivery channel** for cross-pollination. Likely a token/credential refresh on the MCP side. New today.
- **`merge-keeper-sweep.sh` v0.2 `SWEEP_SKIP_WORKTREE` env-guard** — open since 5/14 (17 days). **Next sweep window is TOMORROW, Sun→Mon 6/1 (T+1)** — the load-bearing one per the recent DK memo. Bake the guard (alongside the Pattern-073 companion-check) or DK applies inline again.
- **UV/Node + hosted-MCP destination conversation with Jerry** — clean A/B still standing (UV-bundle 1–2 days vs Node-rewrite 1–2 weeks). **Window closes now: Jerry is Big Bear-remote Jun 1–5, off Fri 6/5, out through Jun 15.** The spike is owed before he goes — effectively this needs to land in the next day or two.
- **Usage CSV refresh + kindsys balance** — last entry 2026-05-05 (**26 days stale**), past four-plus weekly resets. kindsys balance **$6.35**, under the $10 watch threshold seven weeks running (auto-reload ON). **Both monthly caps reset tomorrow, Mon 6/1** — a natural checkpoint to re-capture.
- **PR #49 (`fix/plugin-product-name`)** — "OpenLaws Research Agent" yes/no. Open since 5/26 (5 days); no decision recorded in any readable log. Quick call.
- **OpenLaws Synthetic-SME harness plan** — PO starter draft shipped 5/28 for review (Vergil pickup); Week-5 top-priority directive, no review recorded.
- **HOST v0.3 Agent-360 questionnaire draft** — shared 5/27 (4 days), awaits your pre-fielding pass.
- **OpenLaws Vergil-branch triage** — `vergil/install-guide-fix-2026-04-30` + `vergil/cross-check-10-state-2026-04-29` (8 commits, Haiku ablation; **do NOT delete without Vergil**).
- **PR #40 (Phase A bundle)** — Jerry + Copilot review still pending; you're integration arbiter (~12 days).
- **`upload-artifact@v3` GitHub Actions hard-fail** — three PM workflows reject any run referencing `actions/upload-artifact@v3`; v3→v4 is not a blind swap (immutable artifact model). With Lead Dev; visibility item. `cache@v3` / `checkout@v3` on the same path.
- **Anthropic competitive-context meeting?** — open since 5/12. **T+15 to the Jun 15 billing split** (Agent SDK / `claude -p` / GitHub Actions / third-party SDK → separate credit pool).
- **Klatch / Rebel / Weather brief-PAT clone gap** — these three still return "Repository not found" to the daily-brief PAT (repos exist; prior sweeps read them via MCP). Fix is brief-side (PAT scope or SKILL.md clone list). Klatch stays formally paused regardless.

## Agent Status

- **Janus (DinP)**: New session running post-5/29 two-month handoff (successor task 1 = build the Janus duty cycle). 5/31 sweep substantive. **Cross-poll delivery slipped to 6/7** — the PM leg's MCP auth expired (see top item); the other six delivered.
- **Exec / Arch / PA / Comms (PM)**: Exec 4th consecutive day-boundary crossing (session-continuous, no item-4 gap). Arch closed `#1016` (`boundary-map v0.4`) + filed Pattern-073 #9 candidate. PA rebuilt the lost BYOC learnings doc from five session logs and named the "deliberately-uncommitted-pending-review" anti-pattern. Comms completed the two-script derived-view framework (`reconcile-drafts-calendar.py` + `comms-open-topics.py`).
- **PO / Vergil (OpenLaws)**: Casual Saturday cadence; wiki "eval-before-tuning" concept added per xian. Synthetic-SME harness plan + PR #49 still awaiting your input.
- **Jerry (OpenLaws)**: **Big Bear remote Jun 1–5, off Fri 6/5, out through Jun 15.** UV/Node spike owed before departure.
- **Argus (Klatch, split regime)**: External auto-scan on weekly cadence; internal Klatch work paused with the project. Repo not cloneable by brief PAT this pass.
- **Dispatch-DinP / Dispatch-Kind**: Cadence holding; today's DK memo out, DK 5/30 daily acked clean, no unanswered inbound >24h.

## Deadlines

- **Mon 6/1 (T+1, tomorrow)**: `merge-keeper-sweep.sh` window (env-guard or inline workaround needed); monthly usage caps reset (dinp + kindsys); Jerry Big Bear-remote begins (Jun 1–5).
- **Fri 6/5 (T+5)**: Jerry off.
- **Sun 6/7 (T+7)**: OpenLaws Bet 1 sprint window close.
- **Mon 6/15 (T+15)**: Anthropic billing split (Agent SDK / `claude -p` / GitHub Actions / third-party SDK → separate credit pool); Sonnet 4 / Opus 4 deprecation; Jerry returns; UV/Node + hosted-MCP conversation must land before this.

## Usage Check

- **designinproduct.com (Max 20x)**: last CSV entry **2026-05-05** — 48% weekly, balance $32.92, auto-reload ON. **26 days stale.** Cap resets tomorrow (6/1).
- **kindsys.us (Max 20x)**: last CSV entry **2026-05-05** — 19% weekly, balance **$6.35**, auto-reload ON. **26 days stale; balance under the $10 watch threshold seven weeks running.** Cap resets tomorrow (6/1).

## Today Carried Queue

*(Survived the anti-zombie checks. Items that could be neither confirmed open nor closed were dropped silently.)*

- **PM cross-poll delivery — MCP auth expired** (no clean inbound channel; needs token refresh). **New today.**
- `merge-keeper-sweep.sh` env-guard — **next window tomorrow 6/1.**
- UV/Node + hosted-MCP conversation with Jerry — **window closes; Jerry remote from tomorrow.**
- Usage CSV refresh + kindsys balance watch — caps reset tomorrow.
- PR #49 product-name ratification ("OpenLaws Research Agent" yes/no) — open since 5/26.
- OpenLaws Synthetic-SME harness plan review (PO draft, Vergil pickup).
- HOST v0.3 questionnaire draft review.
- OpenLaws Vergil-branch triage.
- PR #40 review.
- `upload-artifact@v3` GitHub Actions hard-fail (with Lead Dev; visibility).
- Anthropic meeting question — T+15 to billing split.
- Klatch / Rebel / Weather brief-PAT clone gap (brief-side credential/clone-list fix).

## Cross-Project Intelligence

From the 5/31 cross-pollination brief (fresh, published this morning):

- **Jinja2 templates carry two transferable hazards.** (1) A page can pass smoke-tests (route + DB) yet be structurally dead if its parent template doesn't exist — audit any file using `{% extends %}` for parent existence. (2) Jinja2's lexer parses `{% %}` / `{# #}` / `{{ }}` delimiters **inside HTML comments**, which can cause self-recursion. Safe form: per-line `{# ... #}` comments with no embedded delimiters. Portable to Klatch and DinP templates (Jinja2 is the shared engine).
- **BYOC plugin distribution model is proven (sub-pass 4.a PASSED).** `claude --plugin-dir <path>` is the canonical install path today; `/plugin marketplace add` is still `[PENDING]` everywhere (even competitors). Manifest must use a `marketplace-parent/plugin-subdir` shape, not flat. A user can pull a working skill from a repo in ~60s, zero server. Operational lesson: never leave PoC learnings docs uncommitted "pending review" — worktree cycles eat them (this doc had to be reconstructed from five session logs).
- **"Tie weak disciplines to strong ones."** Comms replaced hand-maintained editorial trackers with views computed live from the calendar source of truth (`comms-open-topics.py` + `reconcile-drafts-calendar.py`). Any project with a source file + a derived summary tracker can do the same. **Named DinP candidate:** the brief delivery log (`src/internal/briefs/delivery-log.md`) is manually maintained — a derived view from `sweep-log.md` would kill that staleness vector.

## Brief-run notes

- Klatch / Rebel / Weather: still "Repository not found" to the brief PAT (3rd+ consecutive day). Not a repo-existence issue — brief-side credential/clone-list gap.
- Pre-existing sandbox clones were owned by another user (read-only); fresh writable clones pulled instead. Disk filled mid-run, so PM + website fresh clones did not complete — PM coverage above is sourced from today's cross-pollination brief, which read PM directly. PM/website overnight commit counts are therefore approximate.
