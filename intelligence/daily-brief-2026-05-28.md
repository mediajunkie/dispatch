# Dispatch Daily Brief — 2026-05-28

## Overnight Activity

- **dispatch (7 commits since 5/27 AM)**: 5/27 daily-brief published `c0916ad`; cross-pollination brief published `64d6a59` — *day-boundary loop, Beat-1 publish, publish-post.js hashId bug*; inbox-check 5/27 self-corrected (`e22ce47` → `32b4661`) after stale-clone read on DinP side; DK 5/27 daily landed; DinP 5/27 daily rewritten from fresh clone after the same stale-clone failure. Two stale-clone events in 24h (DK 5/26, DinP 5/27) — companion-check proposal accepted both sides; SKILL.md update queued.
- **piper-morgan-product (~10 commits 5/27 EOD → 5/28 04:00 UTC)**: **CIO autonomous loop crossed the day boundary on its own** — Fire 62 STOP at 11:30 PM PDT May 27, then Fire 1 START executed autonomously at 12:23 AM PDT May 28 (`fa25127`); 2nd consecutive overnight day-boundary auto-crossing. v0.6 Fire 1-4 May 28 all running quick-IDLE no-op pattern with v0.6.3 logic gating standing-items cleanup to daytime verification rather than overnight quick-wins. Day-2 of multi-day autonomous operation validated.
- **OpenLaws (5 commits 5/27 EOD)**: **Pre-flight checklist ratified**; **PRs #50/#52/#53 all merged**; **PR #51 moved to option-B rebase + iterate**; **MCP-enrichment report three-layer rewrite shipped to Slack** (xian lightly edited + posted, 18:45 PT); **week-5 plan refreshed to Day-2 EOD** (three-layer model corrected throughout, Day-3 plan + new I4 duty-cycle goal card added). DK filed three signals for PO morning: hook-reversion investigation, Slack-calibration reminder, Notion DB sort-out. Anomaly noted: 19:07 fire past documented 6-18 cron window (likely deferred 18:37 tick after xian's evening conversation idled the session).
- **designinproduct (4 commits 5/27)**: 5/27 sweep substantive + delivery 7/7 (1 via MCP fallback) — *overnight continuity, Two Migrations published, publish-post.js hashId bug*. Cadence holding.
- **piper-morgan-website**: not cloned this run (disk-tight sandbox; freed space mid-run by dropping the larger clones after read). 1f66571 slug-fix + ccdc9e9 Weekly Ship #044 publish are the standing tip per commit-log read in the OpenLaws activity capture.
- **Klatch / Rebel / Weather**: PAT-authed clone returns `Repository not found` again (Klatch since 5/18 — **10 days**; Rebel + Weather since 5/23). Cross-check against `mediajunkie` GitHub org listing this morning: org has `rebel-alliance-11ty-site` (clones fine — likely the rebel rename), no `weather` repo visible, no `klatch` repo visible. **Klatch + weather may have been renamed, made private, or removed**; the SKILL.md still names them in the clone list. Worth confirming with xian whether the rename/move is intentional before the SKILL.md is updated. Klatch remains formally paused regardless.

## Needs Your Attention

- **OpenLaws Bet 1 — Week 5 Day 3 (today).** Per PO 5/27 EOD wrap: two morning items both can wait for fresh review — (1) MCP-enrichment report rewrite is **DONE** (xian posted 18:45 PT) — optional post-hoc accuracy pass by Vergil on `server.py` line refs; (2) **review the refreshed week-5 plan** (`docs/working/bet-1-week-5.html`) and the Day-3 task shape. **Tomorrow's first event:** 6 AM START fire is the loop's first real overnight test — needs session/laptop kept awake to fire.
- **DK signals filed last night for PO morning:** hook-reversion investigation, Slack-calibration reminder, Notion DB sort-out. Three discrete asks routed to attention-po.md.
- **UV/Node + hosted-MCP destination conversation with Jerry** — Jerry's spike still standing; clean A/B (UV-bundle 1-2 days vs Node-rewrite 1-2 weeks). Jerry leans Node; John's hosted-MCP-makes-language-moot tension operates a layer above the spike. **Jerry moved May 31 → June 15; off Fri Jun 5**, so the conversation window is narrowing.
- **C1 next-direction pick (a/b/c) + Jerry-handoff-addendum decision** — still open per yesterday's brief; mostly absorbed by yesterday's MCP-enrichment three-layer rewrite shipped to Slack, but the b vs c routing on prototype ownership (Vergil-prototypes-directly vs hand-to-Jerry) was not explicitly resolved in 5/27 logs. **Verify with PO/Vergil this morning.**
- **`merge-keeper-sweep.sh` v0.2 `SWEEP_SKIP_WORKTREE` env-guard** — Mon 5/25 sweep skipped; **14 days open since 5/14**. Next window **Sun 6/1 (T+4)** — bake the env-guard or DK applies inline again.
- **OpenLaws Vergil-branch triage** — `vergil/install-guide-fix-2026-04-30` + `vergil/cross-check-10-state-2026-04-29` (8 commits Haiku ablation; **do NOT delete without Vergil**). 14 days open.
- **PR #40 (Phase A bundle)** — Jerry + Copilot review still pending; xian is integration arbiter. 9 days open.
- **Phase B surveyor handoff to Jerry** — *Likely closed by the 5/27 MCP-enrichment rewrite to Slack.* Verify; if absorbed, drop from this list.
- **Brief reliability — closeout fires today Thu 5/28 16:00 UTC.** With 5/26 miss in the window it will report failure. Recurring-cron path producing again (5/27 + today both fired). DK's 5/27 read: weekday miss count is 1 (5/26 only) not 3 — pull-before-diagnose works. **Fix-not-monitor diagnostic still owed before the closeout fire.**
- **HOST v0.3 questionnaire draft review** — shared 5/27 per CIO carry; awaits xian's pre-fielding pass.
- **Klatch + weather repo status diagnostic** — 10 days unreachable for Klatch; org listing shows neither name. Same long-running call as before, but the org-listing data point is new — likely a rename or visibility change rather than a PAT scope issue.
- **Anthropic competitive context — meeting?** Open since 5/12 (reinforced by 5/12 LDH × Anthropic legaltech-marketplace launch); **T+18 to billing split (Mon Jun 15)**.
- **Bet 1 product-name + contact-channels decisions** — Phase 2 cover material still gated. Shortlist standing: Research Workpaper / Research Trail / Verifiable Legal Research.
- **Usage CSV refresh** — last entry **2026-05-05 (23 days stale)**, past four weekly resets. kindsys balance $6.35 still under $10 watch threshold five weeks running; auto-reload ON.

## Agent Status

- **CIO (PM)**: **Day-2 of multi-day autonomous operation** confirmed with the 2nd consecutive overnight day-boundary auto-crossing (`fa25127`, 12:23 AM PDT). 4 Fires May 28 so far, all quick-IDLE no-op. v0.6.3 advance-low-priority-at-IDLE governing standing-items cleanup (daytime-only). 9 v0.7+ candidates accumulating toward eventual v0.7 design refresh.
- **Docs (PM)**: Day-1 mutual-assessment filed 5/27 ("what surprised me after 4 Docs cycle fires"); v0.6 duty-cycle adoption substrate stood up at `:17` hourly; Fire 0 complete; ready for mutual-monitoring with CIO.
- **HOST (PM)**: v0.3 Agent 360 questionnaire draft shared for xian pre-fielding review; v0.6 adoption confirmed (cron at `:37` hourly).
- **Lead Dev (PM)**: GitHub Actions operational refactor lane accepted (primary owner); MEM-975 cohort-rollout sequencing (HOST + Docs week 1, PA + Comms week 2 — hybrid); methodology candidate for load-bearing line-count delta + coverage-audit gate filed; v0.6.1 adoption ack at `:27` offset.
- **PA (PM)**: Outcomes lane findings (paper-comparison vs CT v2.3.1, UI Lifecycle Verifier) shipped; discovered-work-tracking disposition memo filed accepting weekly-sweep ownership; v0.6.2 adoption confirmed at `:42` offset.
- **Architect (PM)**: GH Actions paths-filter sanity-check concurred; v0.6.1 adoption at `:52` offset.
- **Exec (PM)**: Duty-cycle v0.6.1 adoption confirmed at `:32`; cron-interval clarification absorbed.
- **CXO (PM)**: Discovered-work-tracking memo from Lead Dev received; awaits disposition.
- **Comms (PM)**: 9-essay arc closed; two untracked insight drafts surfaced last week.
- **Web (PM)**: v0.6.1 duty-cycle adoption queued (PM-nudge pending); publish-post.js inline-image conversion bug + edit-pass mirror-bug both filed by Docs.
- **Vergil (OpenLaws)**: Three-layer-framing clean re-run completed 5/27; PR #51 reshape underway (option-B rebase). EOD wrap clean.
- **Jerry (OpenLaws)**: PR #52 + #53 merged; PR #50 approved (xian to merge). **Moves May 31 → June 15; Big Bear remote Jun 1-5; off Fri Jun 5.**
- **PO (OpenLaws)**: Duty-cycle pilot underway (~6+ autonomous fires; mechanism confirmed at 15:13 PT first autonomous fire). 19:07 deferred-tick anomaly noted for morning followup. Three DK signals queued for morning.
- **John (OpenLaws SME)**: Eval complete; flagged hosted-MCP-tension; actively reaching out to advisors for next SME.
- **Janus (DinP)**: 5/27 sweep substantive + 7/7 delivery (1 MCP fallback). Cadence holding.
- **Argus (Klatch, split regime)**: External auto-scan continues on DinP side. Internal Klatch session work paused with the project; **Klatch repo unreachable from PAT for the 10th day**; mediajunkie org listing this morning shows no `klatch` repo at all.
- **Dispatch-DinP / Dispatch-Kind**: Cadence restored after the long weekend. Both 5/27 dailies + DinP 5/27 inbox-check (self-corrected) landed. Stale-clone pattern matched both sides 24h apart; companion-check proposed and accepted; SKILL.md update queued.

## Deadlines

- **Thu 5/28 (today, T+0)**: `brief-reliability-closeout` one-time fire at 16:00 UTC — will report failure with 5/26 miss; remediation still owed. CIO loop's first true overnight test fires tomorrow 6 AM — laptop/session must stay awake.
- **Sun 6/1 (T+4)**: Next `merge-keeper-sweep.sh` window — env-guard or inline workaround needed before then.
- **Fri 6/5 (T+8)**: Jerry off (start of his Big Bear remote week).
- **Sun 6/7 (T+10)**: OpenLaws Bet 1 sprint window close.
- **Sun 6/15 (T+18)**: Anthropic billing split (Agent SDK / `claude -p` / GitHub Actions / third-party SDK apps → separate credit pool); Sonnet 4 / Opus 4 deprecation; Jerry returns from Big Bear; UV/Node + hosted-MCP destination conversation needs to land before this.

## Usage Check

- **designinproduct.com (Max 20x)**: last CSV entry **2026-05-05** — 48% weekly, balance $32.92, auto-reload ON. **23 days stale.**
- **kindsys.us (Max 20x)**: last CSV entry **2026-05-05** — 19% weekly (Fri 5:59 AM reset), balance **$6.35**, auto-reload ON. **23 days stale. Balance under the $10 watch threshold five weeks running.**

## Today Carried Queue

(All items survived the DECISIONS.md + session-log anti-zombie checks.)

- OpenLaws Day-3: PO week-5 plan review + Day-3 task shape pass.
- C1 prototype-ownership routing (b vs c) — verify if 5/27 Slack post absorbed it.
- DK morning signals to PO: hook reversion, Slack calibration, Notion DB.
- UV/Node + hosted-MCP destination conversation with Jerry (window narrowing — Jerry off Jun 5–15).
- `merge-keeper-sweep.sh` v0.2 env-guard.
- OpenLaws Vergil-branch triage (install-guide-fix + cross-check-10-state).
- PR #40 review.
- Phase B surveyor handoff relay — *likely closed by 5/27 Slack post; confirm or drop*.
- Brief-reliability diagnostic (closeout fires today 16:00 UTC).
- HOST v0.3 questionnaire draft review.
- Klatch/weather repo status diagnostic (org-listing data point new this run).
- Anthropic meeting question.
- Bet 1 product-name + contact-channels decisions.
- Usage CSV refresh.

**Dropped this pass:**

- *OpenLaws week-5 sequence (#150 / #151 / stock-take / Vergil go)* — sequence completed yesterday; PO handoff shipped; PRs merged; canvas posted; week-5 plan refreshed. Whole 5/27 sequence is closed.
- *MCP-enrichment three-layer rewrite Slack post* — xian shipped 18:45 PT per attention-po.md.
- *Pre-flight checklist ratification* — xian ratified per attention-po.md 5/27 EOD.

## Cross-Project Intelligence

Fresh from yesterday's 2026-05-27 cross-pollination brief:

- **The autonomous loop crossed a day boundary on its own** — Fire 62 STOP at 11:30 PM PDT, Fire 1 START at 12:33 AM (now repeated tonight at 12:23 AM, 2nd consecutive). Updates the prior "cron ends at session boundary" model: in a long-lived session, a cron with conditional dispatch can handle day transitions autonomously. Transferable to any agent loop that needs to span day boundaries (Klatch's Calliope if it ever builds one; Janus's daily sweep trigger).
- **"Two Migrations in One Day" published** to pipermorgan.ai and Medium — Beat 1 of the 9-beat building narrative arc; paragraph-2 correction applied during post-publish edit pass.
- **publish-post.js edit-pass mirror bug** — the post-publish correction generates a fresh hashId rather than reusing the original, orphaning corrected content under a new identifier while the site serves the original. Heads-up filed Docs → Web; manual workaround applied. Filed as Pattern-073 instance (Documentation-Asserted-Behavior Drift, except here it's Site-Asserted-Content Drift).
- **Stale-clone Pattern-073 echo** — DK hit it 5/26 against DinP brief; DinP hit it 5/27 against the inbox-check audit. Same shape 24h apart. Both `test -f` step-0 checks verify local-clone state, not origin state. Companion-check (`git fetch && git diff origin/main --stat` or unconditional session-specific re-clone path) proposed and accepted both sides.

## Brief Reliability Note

**Closeout fires today 16:00 UTC.** Recurring-cron path producing again (5/25, 5/27, 5/28 all clean; 5/26 missed in the window — the one weekday miss DK's pull-before-diagnose framing surfaced). The launchd-equivalent durability fix on faoilean remains the leading hypothesis but is not the only path — today's brief was produced from the sandbox via git-over-HTTPS, demonstrating the recurring-cron path survives even when faoilean isn't the production surface.

## Sandbox Note

This brief was produced from a disk-tight sandbox: `/sessions` was 89% full mid-run; freed ~1GB by dropping the larger clones (piper-morgan-website, piper-morgan-product, OpenLaws) after read so the dispatch commit/push could complete. Public repos (dispatch, designinproduct, piper-morgan-product, OpenLaws) cloned cleanly. Klatch / Rebel / Weather PAT-clones returned `Repository not found`; cross-check against `mediajunkie` GitHub org listing shows Klatch + Weather absent from the org's public repos (Rebel is present as `rebel-alliance-11ty-site`). The SKILL.md clone list may need an update once xian confirms the rename/visibility state.
