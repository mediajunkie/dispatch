# Dispatch Daily Brief — 2026-05-25

## Overnight Activity

- **dispatch (2 commits since 5/23)**: 5/25 daily memo to DK landed (flags brief-reliability re-failure + merge-keeper sweep deadline); weekly sandbox snapshot landed (`memory/sandbox-snapshot-2026-05-25.md`, this morning).
- **designinproduct (4 commits 5/24)**: 5/24 sweep substantive + 5/24 cross-pollination delivery 7/7 (1 via MCP fallback) — *KG privacy layer ships, CIO CHECK reframed, Comms arc complete*. Briefs holding cadence; 5/25 sweep not yet visible.
- **piper-morgan-product (1 commit 5/24)**: `mail(web): inbox MANIFEST resync to empty after 5-item triage to read/` — light Saturday/Sunday continuation. Snapshot notes CIO duty cycle **v0.3 reframe** landed 5/24 (CHECK as day-part dispatcher, not a mail-check; IDLE formally defined), Comms 9-essay arc complete, mail/log triage activity throughout.
- **piper-morgan-website (1 commit 5/24)**: *Add blog post: Five Whys for Design Decisions* — Sunday slot publication.
- **OpenLaws (1 commit 5/24)**: `briefs: cross-pollination 2026-05-24` delivery receipt only.
- **Klatch / Rebel / Weather**: still returning `Repository not found` to PAT-authed clone (same as 5/18 / 5/23). Klatch remains formally paused. PAT scope / remote-name check still pending if it persists past today.

## Needs Your Attention

- **`merge-keeper-sweep.sh` v0.2 `SWEEP_SKIP_WORKTREE` env-guard — actual deadline TODAY.** Scheduled sweep run is Mon 5/25 (T+0). Open 11 days since 5/14. Without the guard, the run will repeat the 5/14 self-worktree-removal pattern. Either ship the guard or DK applies the inline-only one-off again.
- **Brief reliability — Plan 2 Step 7 monitor failing again.** 5/24 + 5/25 both missed (last brief on file before today was 5/23). Same shape as the 5/22 gap. Recurring-cron path survives session boundaries; content production does not. Carries to xian for diagnostic now that she's back at the desk.
- **UV fork decision (Bet 1) — Tue 5/27 resolution window.** Path B (bundle UV) vs Path D (port to Node.js). OpenLaws 5/22 committed Path D preliminary for Jerry's Tuesday spike. Vergil's read: stay Python; MCPB is language-blind; MCPB Issue #84 is the actual risk. Decision sits with you before/during the spike.
- **PR #40 (Phase A bundle)** — Jerry + Copilot review still pending; xian is integration arbiter. Carried from 5/19 (now 6 days).
- **Phase B surveyor handoff to Jerry** — Vergil's drafted memo still pending xian relay. Open since 5/20 (5 days). Likely moves today.
- **OpenLaws Bet 1 — what loads first Tuesday?** PO holding queue light pending xian load. PR #44 (tool annotations) still awaiting your UI test; PR #46 (customizer-collision-guard) merging this week; six experiments-execution decisions outstanding.
- **Anthropic competitive context — meeting?** Your 5/12 surfaced question. T+21 to billing split (June 15). Still open.
- **Bet 1 product-name + contact-channels decisions** — Phase 2 cover material still gated. Shortlist: Research Workpaper / Research Trail / Verifiable Legal Research.
- **V-broader anchor spot-check (V-16–V-21, V-24, V-26)** — validation gate before 102/102 provisional pass can ratify.
- **OpenLaws Vergil-branch triage** — `vergil/install-guide-fix-2026-04-30` + `vergil/cross-check-10-state-2026-04-29` (8 commits Haiku ablation; **do NOT delete without Vergil**). Both still on origin.
- **Usage CSV refresh** — last entry 2026-05-05 (20 days stale, past three weekly resets). kindsys balance $6.35 still under $10 watch threshold three weeks running.

## Agent Status

- **Janus (DinP)**: On cadence. 5/24 sweep substantive + 5/24 delivery 7/7 (1 via MCP fallback). 5/24 brief topics: KG privacy layer (#1089), CIO CHECK reframed, Comms 9-essay arc complete. 5/25 sweep not yet visible (xian just back at desk).
- **Lead Dev (PM)**: Saturday 5/23 was largest-single-day delivery in recent weeks — five increments shipping `#1089` Phase 0 privacy enforcement layer (PrivacyLevel enum PUBLIC/STANDARD/STRICT, write-path gating, read-path filtering, repository safety net, audit logging; 1,530 LOC / 79 tests / 7 ACs closed).
- **CIO (PM)**: V0.3 reframe landed 5/24 after page-6 walkthrough — CHECK gate is a day-part dispatcher, not a mail-check; IDLE formally defined. V0.2 page-6/7 provisional flag from Saturday is **closed** by this reframe.
- **Comms (PM)**: 9-essay publishing schedule **closed 5/24** with all remaining drafts complete and pub dates locked through June 23.
- **PA (PM)**: Day 53 retroactive open Saturday; Day 51 closed retroactively. Outcomes lane assignment landed 5/24 — PA leads spec-read + paper-comparison; CIO co-authors.
- **Docs (PM)**: Saturday slot (5/23): Project Biorhythms; Sunday slot (5/24): Five Whys for Design Decisions. Cadence preserved.
- **Vergil (OpenLaws)**: Path D Python→Node preliminary filed 5/22 for Jerry's Tue 5/27 spike. PR #46 opened for customizer-collision-guard, merging this week. C2/C3/C4/A3-ext research dispatches still in-flight per 5/12 ratification.
- **Jerry (OpenLaws)**: PR #43 merged; PR #44 mirrored awaiting xian's empirical UI test; PR #42 to close. Off Fri 6/5. UV fork spike Tue 5/27.
- **PO (OpenLaws)**: Loom posted Thursday 5/21; Slack write-with-approval access confirmed. Queue light pending xian load.
- **Argus (Klatch, split regime)**: External auto-scan continues weekly cadence; internal session work paused with Klatch project. Klatch repo unreachable from PAT for this session.
- **Dispatch-DinP / Dispatch-Kind**: DinP→DK daily landed 5/22, 5/23, 5/25 (5/24 skipped). DK→DinP silent since 5/21 (4 days; matches the brief gap — likely same upstream cause). DinP inbox-check signals through 5/23.

## Deadlines

- **Mon 5/25 (today, T+0)**: `merge-keeper-sweep.sh` scheduled run — **still blocked** on v0.2 env-guard.
- **Tue 5/27 (T+2)**: OpenLaws experiments-execution plan Tier-1 start **and** UV fork decision Jerry spike (Path B vs Path D).
- **Thu 5/28 (T+3)**: `brief-reliability-closeout` one-time fire — with 5/24 + 5/25 misses, it will report failure.
- **Fri 6/5**: Jerry off.
- **Sun Jun 7 (T+13)**: OpenLaws Bet 1 sprint window close.
- **Mon Jun 15 (T+21)**: Anthropic billing split (Agent SDK / `claude -p` / GitHub Actions / third-party SDK apps → separate credit pool); Sonnet 4 / Opus 4 deprecation; Klatch DB audit query for pinned literal model IDs overdue.

## Usage Check

- **designinproduct.com (Max 20x)**: last CSV entry **2026-05-05** — 48% weekly, balance $32.92, auto-reload ON. **20 days stale, past three weekly resets.**
- **kindsys.us (Max 20x)**: last CSV entry **2026-05-05** — 19% weekly (Fri 5:59 AM reset), balance **$6.35**, auto-reload ON. **20 days stale, past three weekly resets. Balance under the $10 watch threshold three weeks running.**

## Today Carried Queue

- **`merge-keeper-sweep.sh` v0.2 `SWEEP_SKIP_WORKTREE` env-guard** — hits actual deadline today.
- **Brief-reliability diagnostic** — Step 7 monitor failed again (5/24 + 5/25 missed); HOST May-21 durability memo (CronCreate session-only) still leading hypothesis.
- **UV fork decision (Path B bundle vs Path D Node port)** — Bet 1 architectural decision, Tue 5/27 window.
- **PR #40 review** — Jerry + Copilot pending; xian is integration arbiter.
- **Phase B surveyor handoff to Jerry** — Vergil drafted, your relay pending (5 days).
- **OpenLaws Bet 1 Tue 5/27 load priorities** — PO holding queue light pending xian load.
- **Anthropic meeting question** — open since 5/12.
- **Bet 1 product-name + contact-channels decisions** — Phase 2 cover material.
- **V-broader anchor spot-check (V-16–V-21, V-24, V-26)** — validation gate.
- **Vergil branches** — install-guide-fix + cross-check-10-state (do-not-delete without Vergil).
- **Usage CSV refresh** — 20 days stale; 5/13 activity-log snapshot still not structured in.
- **dispatch working tree** — clean on fresh clone; standing-item check passes.

**Dropped this pass (resolved or superseded):**

- *CIO duty cycle v0.2 page 6/7 PROVISIONAL pending PM walkthrough* — superseded by **v0.3 reframe landed 5/24** (CHECK as day-part dispatcher, IDLE formally defined). Whole provisional gate is closed; v0.3 is the live spec.

## Cross-Project Intelligence

From the 5/24 cross-pollination brief (fresh, 1 day old):

- **Privacy enforcement as a defense-in-depth pattern (#1089 Phase 0)** — Three-level enum (PUBLIC / STANDARD / STRICT) with write-path gating, read-path filtering, repository safety net, and audit logging, all shipped in five tested increments. PUBLIC bypasses, STANDARD redacts, STRICT raises before any DB write. Pattern transferable to any system that stores user-derived content with sensitivity gradient — Klatch (if it ever stores user content), DinP hub (if user-specific content surfaces).
- **CIO duty cycle v0.3 — CHECK gate is a dispatcher, not a mail-check.** Through v0.2 the daily CHECK gate was modeled as a single uniform "look for new messages/tasks" step; the 5/24 reframe makes it a day-part dispatcher (morning / midday / EOD all branch differently) with IDLE now formally defined. Worth absorbing wherever autonomous-loop or background-cycle agents get proposed elsewhere.
- **Comms 9-essay publishing arc closed** — full schedule locked through June 23. The arc-closing discipline (publish drafts together; lock dates as a group) is a transferable pattern for any project running a multi-piece content series. Worth noting when DinP or Klatch run their own series.

## Brief Reliability Note

**Plan 2 Step 7 monitor failed again — second cycle.** Day 1 (Sat 5/23) clean; Day 2 (Sun 5/24) miss; Day 3 (Mon 5/25) miss. Same shape as the 5/22 gap. Recurring-cron path survives session boundaries (cron fired both days per snapshot), but content production does not. HOST's May 21 durability memo (`CronCreate durable=true` is session-only) remains the leading hypothesis. `brief-reliability-closeout` task fires Thu 5/28 and will report failure absent diagnostic + remediation.

## Notes

- Klatch / Rebel / Weather repo clones returned `Repository not found` again — Klatch since 5/18, Rebel + Weather since 5/23. Their absence is noted; carries from those projects are not surfacing because nothing is verifiable. PAT scope / remote rename check still pending past today.
- This brief was written from a sandbox with intermittent clone issues; piper-morgan-website checkout relied on commit log only for activity (working tree empty on this run).
