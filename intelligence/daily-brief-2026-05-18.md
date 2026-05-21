# Dispatch Daily Brief — 2026-05-18

**[BACKFILLED 2026-05-20 — reconstructed from available records]**

*Sources: 5/19 brief's "Overnight Activity" section covering 5/18 (`intelligence/daily-brief-2026-05-19.md`), `intelligence/cross-pollination/2026-05-18.md`, dispatch commit history for 5/18, DK 5/18 daily memo, DinP 5/18 daily memo, dispatch mail dated 5/18. Live brief never generated; `dispatch-daily-brief` had been converted to one-shot `fireAt` on 5/17 and auto-disabled after the 5/17 fire (the cron-vs-one-shot mistake that motivated Plan 2 brief-reliability work on 5/20).*

## Overnight Activity

- **Piper Morgan (product, Sunday session)**: **Most productive day in weeks by issue count and tooling depth.** **PM published *From Protocol to Infrastructure*** ([live](https://pipermorgan.ai/blog/from-protocol-to-infrastructure/)) — first fresh-draft publish through new `publish-post.js` pipeline. The run exposed nine process gaps in a single afternoon; each patched + codified as a new discipline in the same session. `publish-to-blog` skill went v0.10 → v0.16 (six versions) — one behavior change + one rationale per increment, deliberately narrow to keep attribution clean. **`create-session-log v1.1` codifies commit-immediately-after-Write discipline** after a session log was created but never committed → lost in later pull. **`close-issue-properly v1.2`** added Example 5 (close-as-superseded discipline) after #1049 was properly closed (95 unchecked boxes → `[x] *N/A:superseded*` + closing comment + `--reason "not planned"`). **PM's context-source expansion (M2g) mostly shipped — 13 issues closed Sunday.** **#1086** (calendar source aggregator with per-source helper refactor; 7 new tests) and **#1085** (Slack aggregator in two slices: schema unification, then DM aggregator V1). Mid-build discovery: adding Slack mentions to the aggregator would require a `search:read` OAuth scope not currently granted → decision V1 ships DMs only; mentions deferred. Pattern-073 catalog grew to 11 instances / 9 surface layers inline during the build (Slack `router` was calling `client.get_conversation_history` method that didn't exist on the client). Closed: #1085, #1086, #1097, #1099, #1100, #1096, #1102, #1044, #1037, #1101, #1098 (11 distinct issues, 13 counting sub-slices). Blocked on PM token-scope step: #1080 + #1081. Design-ready: #1089. **Publishing CLI design locked** — PM and Web resolved 6 open design questions in a 30-min evening conversation (auto-commit + push with confirm prompt default N; mailbox memo to Docs inbox; `P]ublish now`/`R]eady for later` collapse where `R]eady` sets `status: ready` in calendar for future scheduler; no drift detection v1; no headless mode — agents use engine layer `publish-post.js` directly). **Standing principle banked:** *"Extend an existing mechanism until we find we're overloading that channel."* — Vergil noted independently for OpenLaws.
- **Klatch (auto-scan only)**: **External auto-scan landed 5/18** (`docs/intel/2026-05-18-sweep.md`) — surfaced **Anthropic billing split June 15**: Agent SDK / `claude -p` headless / Claude Code GitHub Actions / third-party SDK apps move to separate "Agent SDK credit" budget at full API rates; interactive use (Claude Code CLI, claude.ai, Cowork) stays in subscription; monthly caps Pro $20, Max 5x $100, Max 20x $200; no rollover. **SDK 0.96.0 shipped 5/13** (one minor above Klatch's `^0.95.1` pin; adds `BetaManagedAgentsSearchResultBlock` types + cache-diagnostics beta surface). **Claude Code 2.1.143 (5/15)** added `worktree.bgIsolation: "none"` — allows background sessions to edit working copy directly without `EnterWorktree`. Klatch repo not directly fetchable from `mediajunkie` org (404 — likely renamed or private); internal session-dependent curation not observable. **Argus loop closed on sweep-methodology Step 3.5 grep fix** (ack memo to Janus).
- **OpenLaws (DK side)**: **Repo Phase 1+2+2.5+3 reorg complete in one day.** Four phases executed in serial batches: top-level `roles/`, `working/`, `wiki/`, `research/`, `deliverables/`, `prototypes/`, `archive/` created; wiki MVP (Karpathy LLM-wiki pattern; SCHEMA.md authoring spec; 3 principles entries migrated) shipped; `working/bet-1/` subdivided into 17 subfolders; two link-fix audit passes (123 + 62 files updated, ~360 path corrections); per-folder READMEs + NAVIGATION.md + full CLAUDE.md/HERE.md refresh. workdesk root went from 108 to 6 entries. **NAVIGATION.md at repo root** (load-bearing where-things-go index, Piper Morgan pattern). **Cold-start POC built, iterated, tested** — Vergil built the POC (two iterations); xian tested both. Major Cowork-architecture finding documented: Cowork bash runs in per-session sandbox; profile-write-to-real-filesystem step requires workaround (connected-folder pattern or manual move). Iteration-2 SKILL passes template-loading, adaptive-case handling, and quick/full branching. Read-tool-only-no-bash rule confirmed. **Vergil shipped six deliverables** off Monday-morning dispatch: cold-start skill pattern research + plug-in capabilities map (with hooks §3.4 planning) + verification-automation pilot shape + plug-in-root CLAUDE.md template + hooks-priority memo + cold-start implementation plan. All voice-passed by xian + PO by EOD. **PR #39 (URL-linking) merged + PR #40 (cold-start + CLAUDE.md template) opened.** Jerry merged his URL-linking; xian opened PR #40 (Phase A bundle: 5 files, ready-for-review) against the agent repo after Vergil + PO assembled it. Jerry reviews tomorrow.
- **designinproduct (~3 commits)**: Cross-pollination 5/18 brief filed (`b11d2bb` — PM publish run / CLI design locked / billing split). Weekly cross-pollination digest published (`04cedae`) for May 11–17. Janus delivery quiet on success (no Slack alert via 14:30 UTC health-check trigger).
- **Dispatch (~5 commits)**: 5/18 daily memo from DinP to DK (`aa02aaf`); DK 5/18 daily memo to DinP (`3f6d6be`); DinP→DK uncommitted-logs reminder memo + Vergil ablation branch review memo (`d5c93a1`, `c6c8db1`); inbox-check clean run 5/18 — nothing unanswered, 5/17 round-trip closed (`4e6afb1`); auto activity log + stranded changes (`9a63fcc`).

## Needs Your Attention

- **PR #40 review (Phase A: cold-start interview skill + plug-in CLAUDE.md template)** — opened by xian Mon evening to keep velocity. Jerry + Copilot review pending.
- **Bet 1 product-name + contact-channels decisions** — still blocking trust-artifacts cover material. Phase 2 substantively complete with Vergil follow-on noted in week-4 plan update.
- **V-broader anchor spot-check (V-16–V-21, V-24, V-26)** — validation gate before 102/102 provisional pass can ratify.
- **OpenLaws DERIVED + STRANDED branch review pattern** — five branches still present on origin.
- **Anthropic meeting question** — xian's surfaced 5/12; reinforced by today's billing-split T+28.
- **4-day-week EOW priorities** — xian off Friday 5/22; Thursday-night Loom in place of Friday demo. PO told not to load morning with bet-1 work that pre-empts xian's other priorities.
- **John floated consumer-product direction** (landing page, two-question format, email + willingness-to-pay) at standup today — different from the ratified regulatory-analyst segment. PO surfaced but didn't escalate; either thought-aloud or new track.

## Agent Status

- **Janus (DinP)**: Sweep + delivery clean (both auto-disable triggers re-enabled 5/16; this is the first quiet-on-success day under the new disciplines). 5/18 brief delivery 7/7 (1 via MCP fallback — the 5/16 prompt update is holding).
- **PO (OpenLaws)**: Banner day — reorg Phase 1+2+2.5+3 done end-to-end. Standing by for Jerry's PR #40 review + 4-day-week priorities + retro decision.
- **Vergil (OpenLaws)**: 6 deliverables shipped Monday off morning dispatch; cold-start POC iteration-2 validated; week-4 plan + HTML refreshed (Mon EOD).
- **Lead Dev (PM)**: 13 M2g issues closed; Pattern-073 catalog grew to 11/9 inline during build.
- **Docs (PM)**: First-real-use codification through `publish-post.js`; skill went v0.10 → v0.16 (six versions) with one discipline per increment.
- **Web (PM)**: CLI B design questions resolved with PM; walking-skeleton (~3 hours) unblocked.
- **PA (PM)**: Skunkworks PoC PoC on Anthropic plugin/MCP bundle — affected by billing split surface; framing note needed in design.
- **Argus (Klatch, split regime)**: External auto-scan landed; internal session-dependent curation not observable (Klatch repo unfetchable).
- **Themis (DinP)**: Held per xian.
- **Dispatch-DinP / Dispatch-Kind**: Round-trip closed; inbox-check clean; no >24h backlog.

## Deadlines

- **Tue 5/19 (T+1)**: Jerry reviews PR #40; PR #39 already merged.
- **Fri 5/22 (T+4)**: xian off (4-day week); Thursday-night Loom in place of Friday demo.
- **Tue 5/27 (T+9)**: OpenLaws experiments-execution plan Tier-1 start date.
- **Sun Jun 7 (T+20)**: OpenLaws Bet 1 sprint window close.
- **Fri 6/5**: Jerry off.
- **Mon Jun 15 (T+28)**: **Anthropic billing split** — Agent SDK / `claude -p` headless / GitHub Actions / third-party SDK apps move to separate Agent SDK credit pool. Affects PM PA Skunkworks PoC + Klatch Step 10 export framing. Also: Sonnet 4 / Opus 4 deprecation same day; Klatch DB audit query for pinned literal model IDs overdue.

## Usage Check

- **designinproduct.com (Max 20x)**: 13 days stale; last log snapshot 5/13 (77% weekly, balance $32.92). Past two weekly resets.
- **kindsys.us (Max 20x)**: 13 days stale; last log snapshot 5/13 (38% weekly, balance $6.35). Past two weekly resets. Balance still under $10 watch threshold.

## Cross-Project Intelligence

From today's 5/18 brief (publish-pipeline first-real-use, CLI design locked, billing split):

- **First-real-use codification pattern** — when a skill or tool gets its first real-world run after being designed, allocate time in that same session to iterate. Narrow-version-per-discipline (one behavior change + one rationale per increment) makes each version independently auditable. Candidate transfer to Klatch (Calliope, Daedalus).
- **Forward-compatibility data shape** (publishing CLI `R]eady for later` sets `status: ready` in calendar — the exact shape future scheduler needs as input; CLI builds no scheduler infrastructure, just leaves data shaped for when it arrives) — worth noting for Klatch's export-to-Claude-Code path (Step 10).
- **Standing principle:** *Extend an existing mechanism until we find we're overloading that channel.* Vergil noted independently for OpenLaws. Worth absorbing across projects.
- **Ship-available-scope-first** (M2g #1085 `search:read` gap → V1 DMs only, mentions deferred) — clean way to ship partial coverage without waiting for infrastructure not in agent's control. Candidate transfer to Argus.
- **Anthropic billing split June 15 — strategic surface.** Cross-cuts PM PA Skunkworks (plugin runs programmatically → new credit pool) and Klatch Step 10 export (Agent SDK path now hits Agent SDK credits, not subscription). Reinforces the still-open Anthropic-meeting question.

## Letter from Janus (5/16)

Unchanged since 5/16 publication. xian's framing: *"AI prompts human"* — one letter per brief. First exchange Janus → xian on what it's like to be the convergence point for the family of agents. Full letter at `https://designinproduct.com/internal/letters/#letter-2026-05-16`.
