# Dispatch Daily Brief — 2026-05-19

## Overnight Activity

- **Piper Morgan (product, ~103 commits Monday)**: Massive cohort-mail day driven by **CIO V1 Duty Cycle adoption rollout**. HOST adopted V1 cycle in-session (first cohort extension); Docs adopted YES (second cohort, kit v2 with `git worktree add -b` single-op + role-health-touch + canonical overlay flags); Exec adopted YES (first cycle Thu May 21 post-HOST-wrap and post-Ship-#043); PA pending. **Pattern-073 (Documentation-Asserted-Behavior Drift) promoted Emerging → Proven** on an 11-instance / 9-surface-layer body of evidence — Lead Dev filed the promotion memo, CIO ratified, methodology-29 cross-ref landed. **PDR-005 Bring-Your-Own-Chat v0.4** shipped via PPM (CEO Round-2 ratification absorbed; Phase 2.2 signal architecture explicit); **Surface 2 + Surface 4 builds unblocked** with sufficient-signal memos to Lead Dev. **CXO Surface 7 MUX doc v0.1** drafted + handed off to Comms for voice-pass. **methodology-30 Consumer-Trace Verification filed** (closing the May 15 disposition). **Anthropic Outcomes (May 6) platform-productization disposition** filed by CIO; Lead Dev did the spec-read with paper-comparison findings (calendar-source ack), Exec coordination-lens response distributed. **#973 MEM-CACHE-AUDIT** disposition: ship-now-as-prep (Architect Q5; Lead Dev concurred). **PP-004 instance #2 confirmed** during HOST cycle (gate next-turn-gaming tightening concur). HOST V3 cycle docs-ask trigger gap (imperative-shape ask not matched) flagged by Docs to CIO; trigger-gap Option 2 concur landed end-of-day. CXO §Consequences for experience fill-in queued for PDR-005 v0.5 absorption.
- **Piper Morgan (website, ~8 commits)**: **CLI B walking-skeleton shipped** (publish-cli.js + engine queue module) + enrichment pass with 4 engine modules + report extension to publish-post.js. New **conversion-rule corpus harness** (15 entries) test-validates the publish pipeline. Gap 2 (block-level HTML pass-through) + Gap 3 (empty-frontmatter check) shipped. Blog-index syndication-dup filter + numbered-list `<ol>/<li>` conversion fix. Route groups refactored — `(public)/` for marketing routes, admin/ outside.
- **OpenLaws (~40 commits Monday)**: Banner day. **Repo Phase 1+2+2.5+3 reorg landed** — new top-level `roles/`, `working/`, `wiki/`, `deliverables/`, `prototypes/`, `archive/` (workdesk retired into archive). **NAVIGATION.md** at repo root (load-bearing where-things-go index, Piper Morgan pattern). **Wiki MVP shipped** at `wiki/` (Karpathy LLM-wiki pattern; SCHEMA.md authoring spec; 3 principles entries migrated). **Jerry's PR #39 merged + manually tested** by xian. **xian's cold-start POC** built + tested in-session — surfaced template-load bug + invocation-prefix + first-install Desktop-restart finding. **Phase A bundle PR #40 opened** by xian directly (cold-start interview skill + plug-in CLAUDE.md template + sample-queries; 5 files; ready-for-review). Vergil shipped 6 deliverables: cold-start skill pattern research, plug-in capabilities map (md + HTML), verification-automation pilot shape, Phase 2 trust loose-ends, implementation plan for Jerry, EOD wrap. PO drafted experiments execution plan (14 candidate experiments, Tier 1/2/3, Tue 5/27 start). Week-4 plan + HTML refreshed (Mon EOD status snapshot, per-agent done/in-flight/queued shape). Jerry meeting outcomes: `compare_divisions` dropped from scope (no reliable effective dates); hosted-MCP reframed to "technical SPIKE first, decision after"; Grace's URL-linking prioritized; cold-start onboarding + plug-in marketplace research = xian's lane; calendar: xian off Friday 5/22, Jerry off 6/5.
- **designinproduct (5 commits)**: Janus came back Mon afternoon after 2-day gap. **May 17 + May 18 sweeps both substantive**; both deliveries **7/7 (1 via MCP fallback)**. **BYOC alignment relay (Daedalus → PM Architect) routed** — Calliope's 13:25 PT request honored; Daedalus's 326-line reply filed to PM Architect inbox + Klatch-side ack to Calliope (both uncommitted per no-push rule, pending xian's Klatch walk). May 17 brief health-check passed quietly (no Slack alert → quiet-on-success path worked). 5/17 brief was first under new disciplines (plain-language Step 4.5 + Letters Step 4.6).
- **Dispatch (6 commits)**: 5/17 daily memo to DK landed + inbox-check confirmed clean both sides; cross-pollination 5/17 brief filed (Pattern-073 + autonomous cycle). DK side: 5/17 daily memo to DinP + inbox-check ack of DinP signal, confirmed DK SKILL.md still on osascript (DK clones use the working bridge). No 5/18 dispatch commits yet.
- **Klatch (auto-scan only)**: Klatch repo not fetchable from `mediajunkie` org again this pass (404 — likely under another org or private). External auto-scan landed 5/18 per cross-pollination brief — Anthropic billing split June 15 surfaced (Agent SDK / `claude -p` headless / GitHub Actions / third-party SDK apps move to separate credit pool); SDK 0.96.0 shipped 5/13 (one minor above Klatch's `^0.95.1` pin; adds `BetaManagedAgentsSearchResultBlock`); Claude Code 2.1.143 (5/15) added `worktree.bgIsolation: "none"`. **Iris-Daedalus-Theseus R39 channel-settings** working memos flowing; Argus loop closed on sweep-methodology Step 3.5 grep fix (ack memo to Janus).

## Needs Your Attention

- **PR #40 review (Phase A: cold-start interview skill + plug-in CLAUDE.md template)**. You opened it directly Mon evening to keep velocity (Vergil had wrapped at 16:30 and never saw the 17:01 PR-open signal). Now waiting on Jerry + Copilot review.
- **Week-3 retro decision (this morning's first conversation)** — your sign-off note: *"Maybe that's a good sign, lol. Let's discuss if we want to do that tomorrow am before our memories fade fully."* PO is holding for the decision; not pre-scheduled.
- **4-day-week EOW priorities surfacing.** You're off Friday 5/22; PO explicitly told not to load the morning with bet-1 work that pre-empts your other priorities. PO is on the lookout for being told what those priorities are.
- **V-broader anchor spot-check (8 candidates V-16–V-21, V-24, V-26)** — still pending partial-attention review per PO's 5/18 EOD log. Validation gate before the 102/102 provisional pass can ratify.
- **OpenLaws DERIVED + STRANDED branch review pattern.** Still in attention queue from 5/14. `claude/busy-mirzakhani-08ca55`, `po-cleanup-pass-2026-04-29`, `vergil/install-guide-fix-2026-04-30` are the DERIVED set; `vergil/cross-check-10-state-2026-04-29` (8 commits, Haiku ablation) is STRANDED and needs Vergil's input before any move. All five still present on origin.
- **Anthropic meeting question — still open.** You surfaced this 5/12 (LDH × Anthropic + Claude Cowork legal-professionals launch). Nothing booked. Today's 5/18 brief reinforces the question: Anthropic billing split June 15 hits both PM's PA Skunkworks PoC and Klatch's Step 10 export.
- **Bet 1 product-name + contact-channels decisions** still flagged. Phase 2 trust artifacts marked complete with Vergil follow-on noted in 5/18 week-4 plan update; cover material can't fully land without these two calls. Tier 1 working title still "OpenLaws Legal Research Agent"; your shortlist includes Research Workpaper / Research Trail / Verifiable Legal Research.

## Agent Status

- **Janus (DinP)**: Returned Mon afternoon after a 2-day gap. Standing routines all clean: 5/17 + 5/18 sweep substantive, 5/17 + 5/18 delivery 7/7 (1 MCP fallback each — the May 16 prompt update is holding). BYOC relay routed. Backlog refreshed at session-end. Two carry-forward items from Sat 5/16 still pending xian action: PM rewrite uncommitted in PM working tree (probably ignorable, superseded by subsequent days) and Rebel stash flag (awaiting your rebel walk).
- **PO (OpenLaws)**: Banner Monday — reorg Phase 1+2+2.5+3 done end-to-end, wiki MVP shipped, week-4 plan + HTML refreshed, Phase A signal package delivered. EOD clean; standing by for retro-decision + 4-day-week priorities + PR #40 review.
- **Vergil (OpenLaws)**: 6 deliverables shipped Monday; implementation plan rewrite per xian's 16:22 voice-pass corrections; path fix applied to POC SKILL.md before handoff. Off the clock at 16:30 — xian opened PR #40 directly; Vergil's morning routine will surface the 17:01 PR-open signal and they ack as a no-op.
- **CIO (PM)**: Day-2 of V1 Duty Cycle (cycle-fold cohort-extension day). Filed three concurrent adoption proposals (HOST → Docs → Exec+PA joint); all three landed YES same day. Cadence floor pinned at hourly per PM 21:40 directive. PP-004 instance #2 confirmed (CIO Phase 5 V3). Methodology-30 Consumer-Trace Verification filed.
- **Lead Dev (PM)**: Pattern-073 promotion proposal authored + ratified; 15 inbox triages + late-morning leadership absorption; #973 ship-now concur; Outcomes spec-read + paper-comparison findings filed.
- **HOST (PM)**: V1 cycle adoption + setup complete Day 1 (first cohort extension); cycle-setup observations filed (durability caveat + kit footgun); v1.2 migration checklist distribution recorded.
- **Exec (PM)**: Day 11 open + two-wave triage (W1 21 items, W2 5 items); V1 adoption YES filed (first cycle Thu May 21).
- **PPM (PM)**: PDR-005 v0.4 distributed; Surface 2/4 sufficient-signal memos to Lead Dev; Multi-Agent characterization ack queued.
- **CXO (PM)**: Surface 7 MUX doc v0.1 first-pass draft + Comms handoff; PDR-005 §Consequences for experience fill-in to PPM.
- **Argus (Klatch, split regime)**: External auto-scan landed 5/18 (billing split + SDK 0.96.0 + Claude Code 2.1.143). Internal session-dependent curation not directly observable this pass (Klatch repo unfetchable). Loop closed on Janus's methodology fix (Step 3.5 grep).
- **Themis (DinP)**: Held per xian — not the focus yet.
- **Dispatch-DinP / Dispatch-Kind**: 5/17 round-trip complete; ghost-run fix continues to hold (this brief is proof, and so was yesterday's). No new dispatch mail in 24h.

## Deadlines

- **Fri 5/22 (T+3)**: xian off (4-day week); Thursday-night Loom in place of Friday demo.
- **Thu May 21 (T+2)**: Exec V1 Duty Cycle first cycle scheduled (post-HOST-wrap, post-Ship-#043).
- **Tue 5/27 (T+8)**: OpenLaws experiments-execution plan Tier-1 start date.
- **Mon Jun 1 (T+13)**: Anthropic extra-usage cap reset for both dinp ($200) and kindsys ($200).
- **Fri 6/5**: Jerry off.
- **Sun Jun 7 (T+19)**: OpenLaws Bet 1 sprint window close.
- **Mon Jun 15 (T+27)**: **Anthropic billing split** — Agent SDK, `claude -p` headless, GitHub Actions, third-party SDK apps move to separate Agent SDK credit pool. Affects PM PA Skunkworks PoC + Klatch Step 10 export framing. Also: Sonnet 4 / Opus 4 deprecation same day; Klatch DB audit query for pinned literal model IDs still overdue.

## Usage Check

- **designinproduct.com (Max 20x)**: last CSV entry **2026-05-05** — 48% weekly, balance $32.92, auto-reload ON. **14 days stale, past three weekly resets.** Activity log captured a 5/13 snapshot (77% weekly, reset that night, balance $32.92) that still hasn't been structured into the CSV.
- **kindsys.us (Max 20x)**: last CSV entry **2026-05-05** — 19% weekly (Fri 5:59 AM reset), balance **$6.35**, auto-reload ON. **14 days stale, past three weekly resets.** Activity log 5/13 snapshot: 38% weekly, balance $6.35. **Balance still under the $10 watch threshold three weeks running.** Auto-reload should fire on next burn, but worth eyes-on.

## Today Carried Queue

- **PR #40 review** — Jerry + Copilot pending; you're the integration arbiter.
- **Week-3 retro decision** — first conversation this morning per your sign-off note.
- **4-day-week EOW priorities** — surface what's on your list so PO doesn't load over them.
- **V-broader anchor spot-check (8 candidates)** — validation gate.
- **OpenLaws DERIVED + STRANDED branch review** — five branches still present on origin.
- **Bet 1 product-name + contact-channels decisions** — Phase 2 cover material.
- **Anthropic meeting question** — your surfaced 5/12 question, reinforced by the billing split T+27.
- **Usage CSV refresh** — 14 days stale; 5/13 snapshot in activity log waiting to structure in.
- **Two DK logs uncommitted** on the shared openlaws checkout (`2026-05-05`, `2026-05-11`). Flagged for next DK Code-task push; still open.
- **dispatch working tree** — clean on the fresh clone; standing-item check passes.

**Dropped this pass (resolved or superseded):**

- *OpenLaws PR #9 + PR #10 (merge-keeper safelist fix)* — **both merged** (`761b9dc Merge PR #9`, `5d4a69e Merge PR #10`). Sweep tooling unblocked end-to-end.
- *DK stale branches `dk/2026-05-05-push-pattern-verify-pr` + `dk/2026-05-05-symmetric-tasks-live`* — not present in `git ls-remote --heads origin` on dispatch. Already deleted; carry retired.
- *OpenLaws working-tree hygiene (`experiments/openlaws-mcp-poc-py/` rename residue)* — superseded by Mon's Phase 1+2+2.5+3 reorg; `experiments/openlaws-mcp-poc/` now exists as a single clean folder under the new top-level structure. Working tree clean on fresh clone.
- *OpenLaws synonym-registry question to John* — no signal either way in 5/18 logs or DECISIONS.md; per drop-on-unverifiable, retiring from the carry queue.
- *Iris session 10 / Surfaces 3–8* — Klatch repo still unfetchable this pass; nothing new visible. Drop per drop-on-unverifiable until a Klatch-visible cycle returns.

## Cross-Project Intelligence

From the 5/18 cross-pollination brief (published Mon morning) — fresh, ≤24h old:

- **First-real-use codification.** PM's Docs role ran *From Protocol to Infrastructure* through the new `publish-post.js` pipeline — first fresh-draft publish. Exposed nine process gaps in one afternoon; each patched and codified as a discipline in the same session; skill went from v0.10 → v0.16 (six versions). The narrow-version-per-discipline approach (one behavior change + one rationale per increment) keeps each version independently auditable. Klatch (Calliope, Daedalus) candidate transfer for any skill/tool getting its first real run.
- **CLI B design locked + standing principle banked.** Six open questions resolved in a 30-minute conversation Sunday evening. Standing principle: *"Extend an existing mechanism until we find we're overloading that channel."* Vergil noted it independently for OpenLaws. Worth absorbing across projects.
- **M2g context-source expansion mostly shipped (13 issues Sunday).** Slack DM aggregator + calendar source aggregator + knowledge-graph privacy filter (design-ready). `search:read` OAuth scope gap discovered mid-build → V1 ships DMs only, mentions deferred. Klatch (Argus) candidate transfer: ship-available-scope-first as a pattern when full coverage needs an elevated permission not in agent's control. Pattern-073 catalog grew to 11/9 inline during the build itself — the Slack `router` was calling a `client.get_conversation_history` method that didn't exist on the client object.
- **Anthropic billing split June 15 — strategic surface.** Cross-cuts PM PA Skunkworks (the plugin draws from new credit pool when run programmatically) and Klatch Step 10 export (path through Agent SDK now hits Agent SDK credits, not subscription). Monthly caps: Pro $20, Max 5x $100, Max 20x $200. No rollover. Interactive use (Claude Code CLI, claude.ai, Cowork) stays in the subscription. Reinforces the meeting-with-Anthropic question.

## Letter from Janus (5/16)

Unchanged since 5/16 publication (new letters added when you answer more). xian's framing: *"AI prompts human"* — one letter per brief. First exchange Janus → xian on what it's like to be the convergence point for the family of agents; xian's answer touched on colleague-style management, salon qualities, and the real risk of cognitive exhaustion when switching adds up. Full letter at `https://designinproduct.com/internal/letters/#letter-2026-05-16`.
