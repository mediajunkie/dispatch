# Dispatch Daily Brief — 2026-05-23

## Overnight Activity

- **Piper Morgan (product, ~10 commits today + 5/22 omnibus)**: Light Saturday — PM at Princeton reunion this weekend, "available for check-ins, propose autonomous work" framing. **CIO duty cycle v0.2 design landed** (`cc1b238`) — synthesizes sketches 1-7 + image-by-image walkthrough + Ted/Englishia north-star + V1-era lessons; **page 6/7 PROVISIONAL pending PM walkthrough**. **PA Day 53 open**; Day 51 closed retroactively + Docs heads-up filed (CC PM + Comms). Docs publishing **Project Biorhythms** today (Saturday insight slot). **Comms 5/21 amendment-offer absorbed** — PM call: skip amendment, session log is record-of-record. **CLAUDE.md keychain credential storage discipline** added (the `_api_key` suffix; rooted in Friday's Slack OAuth keychain-vs-env health-check bug). Calendar: **Five Whys for Design Decisions** queued for Sun May 24. **May 22 omnibus landed STANDARD** — light Friday (2 active roles: Lead Dev + Docs); cadence at "tightest" per PM-bandwidth-keyed flow. No 5/22 product-side commits at all (xian off; sessions opened fresh today).
- **Piper Morgan (website, 1 commit)**: 5/23 log open + plan HTML moved back to `dev/active/` + memo to docs.
- **OpenLaws (1 commit today, 2 yesterday)**: 5/22 — **Path D preliminary** filed (Python→Node MCP port baseline for **Jerry's Tuesday 5/27 spike**) + PR #46 customizer-collision-guard signal ack. 5/23 — brief delivery only. No 5/23 session logs yet.
- **designinproduct (4 commits)**: **5/23 sweep substantive + delivery 7/7 (1 via MCP fallback)** — *Slack OAuth healthy, ROSTER.md filed, Project Biorhythms queued*. 5/22 sweep also substantive + 7/7 (Voice of Denial, V1 retired, BYOC PoC, Slack search.messages corrected).
- **Dispatch (3 commits today + 3 yesterday)**: 5/22 inbox-check clean + DK relay tally; 5/22 cross-pollination receipt; 5/23 cross-pollination receipt. **No daily brief written for 5/22** (xian off Friday + no autonomous run — first gap since recurring-cron landed). Today's brief restarts the 3-day clean monitor.
- **Klatch, Rebel, Weather**: repos returned **`Repository not found`** to PAT-authed clone (Klatch since May 18, all three today). Klatch remains formally paused (PM direction). No fresh DECISIONS.md visible from this side; treat all Klatch carries as held until pause lifts.
- **piper-morgan-website**: clone empty-master state on this run; no visibility into 5/23 web-side commits from the website repo (PM-product commit `18b2da7` covers the active work).

## Needs Your Attention

- **CIO duty cycle v0.2 — page 6/7 PROVISIONAL pending PM walkthrough.** CIO landed v0.2 this morning (Saturday) with explicit gate: page 6/7 marked provisional until PM walks through the image-by-image deck. Net new today; first chance for input is Mon 5/26 unless you want to bite it during a Princeton check-in.
- **UV fork decision (Bet 1) — Tuesday 5/27 resolution window.** DK 5/21 daily flagged Path B (bundle UV) vs Path D (port to Node.js) as a live architectural question. OpenLaws 5/22 committed Path D preliminary for Jerry's Tuesday spike. Vergil's read: stay Python; MCPB is language-blind; MCPB Issue #84 (Python+uv install fail without system Python) is the actual risk. Decision sits with you before/during the spike.
- **PR #40 (Phase A bundle)** — Jerry + Copilot review still pending; you're integration arbiter. Carried from 5/19. No merge commit visible in OpenLaws origin/main this pass.
- **Phase B surveyor handoff to Jerry** — Vergil's drafted memo still **pending your relay**. Visible from DinP side since 5/20; xian-off-Friday pushed it through unmoved.
- **OpenLaws Bet 1 priorities pre-Mon 5/26** — Loom shipped Thursday EOD in lieu of Friday demo; PO/Jerry/Vergil queue moved while you were off (PR #43 merged, PR #44 mirrored awaiting your UI test, PR #46 opened for customizer-collision-guard). What loads first Tuesday?
- **Anthropic competitive context — meeting?** Your 5/12 surfaced question. T+23 to billing split (June 15). Still open.
- **Bet 1 product-name + contact-channels decisions** — Phase 2 cover material still gated. Shortlist: Research Workpaper / Research Trail / Verifiable Legal Research.
- **V-broader anchor spot-check (V-16–V-21, V-24, V-26)** — validation gate before 102/102 provisional pass can ratify.
- **OpenLaws Vergil-branch triage** — `vergil/install-guide-fix-2026-04-30` + `vergil/cross-check-10-state-2026-04-29` (8 commits Haiku ablation; **do NOT delete without Vergil**). Both still on origin.
- **`merge-keeper-sweep.sh` v0.2 `SWEEP_SKIP_WORKTREE` env-guard** — blocks the next scheduled sweep **Mon 2026-05-25 (T+2, day after tomorrow)**. Open since 5/14 (10 days). DK applied inline-only as a one-off.

## Agent Status

- **Janus (DinP)**: On cadence. 5/22 + 5/23 sweeps both substantive; both deliveries 7/7 (1 MCP fallback each; PM-product git 403 fallback path holding). 5/23 brief topics: Slack OAuth healthy, ROSTER.md formalizes 7+3+specialized tier structure, Project Biorhythms queued.
- **PA (PM)**: Day 53 retroactive open this morning; Day 51 wrapped retroactively (skunkworks writeup draft still awaiting PM Desktop test + signoff before fan-out). Day 52 (Fri 5/22) had no PA session per project-pm_kind_openlaws memory — OpenLaws sprint was dominant. PA proposing autonomous weekend work to PM.
- **Docs (PM)**: Published cadence preserved. Saturday slot: Project Biorhythms (calendar row 284); Sunday slot pending pick. **ROSTER.md v1.0 landed yesterday** (`fb2cf0c`) — first PM document whose sole job is the org-shape view of the agent team (7-leadership + 3-staff + specialized; separates from CLAUDE.md's assignment-flow table).
- **CIO (PM)**: V0.2 duty-cycle design committed; page 6/7 explicitly provisional. V1-era lessons folded forward (methodology-31 append-only + methodology-32 Postel-robust header parsing carry into v0.2 by reference).
- **Comms (PM)**: 5/21 amendment-offer to omnibus absorbed via PM call (skip amendment, session log is record-of-record). Beat 7 stranded-work revisit-ask filed parallel to PA's late-close memo this morning.
- **Lead Dev (PM)**: **Slack OAuth marathon closed end-to-end Thu evening into Fri morning** — five-bug chain (bot-vs-user scope tab, wrong workspace, missing redirect URI, instance-level nonce, keychain-vs-env health check). Integration now shows "Slack: Healthy"; #1085 mentions feature unblocked for build. Three follow-ups filed: #1107 (DinP workspace migration), #1108 (failed-attempt UX), #1109 (Redis-backed OAuth state).
- **Vergil (OpenLaws)**: Path D Python→Node preliminary filed 5/22 for Jerry's Tue 5/27 spike. PR #46 opened (defense-in-depth customizer-collision-guard); merging next week. C2/C3/C4/A3-ext research dispatches still in-flight per 5/12 ratification.
- **PO (OpenLaws)**: Has Slack write-with-approval access confirmed; stale post-restart-permissions TIL stripped. Loom recorded + posted 5/21.
- **Jerry (OpenLaws)**: PR #43 approved + merged; PR #44 mirrored into standalone MCP awaiting your empirical UI test; PR #42 to close ("keep as personal skill"). Off Fri 6/5.
- **Argus (Klatch, split regime)**: External auto-scan continues its weekly cadence; internal session work remains paused with the Klatch project. No 5/22 or 5/23 visible from this side (Klatch repo unreachable from PAT).
- **Dispatch-DinP / Dispatch-Kind**: 5/21 DK→DinP daily landed; 5/22 DinP→DK daily landed; **no DK→DinP daily for 5/22** (DK noted "no DinP→DK daily memo for 5/21 — one-sided day, not a missed reply"); 5/22 DinP inbox-check clean. No DK→DinP daily since 5/21.

## Deadlines

- **Mon 5/25 (T+2)**: Next scheduled `merge-keeper-sweep.sh` run — still blocked on v0.2 env-guard.
- **Tue 5/27 (T+4)**: OpenLaws experiments-execution plan Tier-1 start **and** UV fork decision (Path B vs Path D) Jerry spike.
- **Fri 6/5**: Jerry off.
- **Sun Jun 7 (T+15)**: OpenLaws Bet 1 sprint window close.
- **Mon Jun 15 (T+23)**: Anthropic billing split (Agent SDK / `claude -p` / GitHub Actions / third-party SDK apps → separate credit pool); Sonnet 4 / Opus 4 deprecation; Klatch DB audit query for pinned literal model IDs overdue.

## Usage Check

- **designinproduct.com (Max 20x)**: last CSV entry **2026-05-05** — 48% weekly, balance $32.92, auto-reload ON. **18 days stale, past three weekly resets.** 5/13 activity-log snapshot (77% weekly post-reset, balance $32.92) still not structured in.
- **kindsys.us (Max 20x)**: last CSV entry **2026-05-05** — 19% weekly (Fri 5:59 AM reset), balance **$6.35**, auto-reload ON. **18 days stale, past three weekly resets.** 5/13 snapshot: 38% weekly, balance $6.35. **Balance under the $10 watch threshold three weeks running.** Auto-reload should fire on next burn.

## Today Carried Queue

- **CIO duty cycle v0.2 page 6/7 walkthrough** — net new this morning; pending PM input.
- **UV fork decision (Path B bundle vs Path D Node port)** — Bet 1 architectural decision, Tue 5/27 window.
- **PR #40 review** — Jerry + Copilot pending.
- **Phase B surveyor handoff to Jerry** — Vergil drafted, your relay pending.
- **OpenLaws Bet 1 Mon 5/26 priorities** — PO holding queue light pending your load.
- **Anthropic meeting question** — open since 5/12.
- **Bet 1 product-name + contact-channels decisions** — Phase 2 cover material.
- **V-broader anchor spot-check (V-16–V-21, V-24, V-26)** — validation gate.
- **Vergil branches** — install-guide-fix + cross-check-10-state (do-not-delete without Vergil).
- **`merge-keeper-sweep.sh` v0.2** — `SWEEP_SKIP_WORKTREE` env-guard; blocks Mon 5/25 sweep.
- **Usage CSV refresh** — 18 days stale; 5/13 snapshot still not structured in.
- **dispatch working tree** — clean on fresh clone; standing-item check passes.

**Dropped this pass (resolved or superseded):**

- *CIO V1-DC PA adoption disposition* — **V1 duty cycle formally retired 2026-05-21** (CIO cohort memo to HOST + Docs + Exec; per-role retirement actions: cancel cron, delete worktree branches, remove worktrees). Whole experiment is closed; V0.2 is the live spec. The "PA blocked-on-PM for V1 adoption" item is moot.
- *V1 Duty Cycle first cycle / cohort cadence floor* — superseded by V1 retirement.
- *Plan 2 Steps 7–8 monitor day 2* — **5/22 brief was not produced** (xian off, no autonomous run); 3-day clean monitor resets with today as day 1.
- *Slack search.messages migration concern* — corrected 5/20; `search:read` is User Token scope only, never appeared in Bot Token tab; OAuth re-auth resolved the whole chain (5 bugs through 5/22). #1085 build path unblocked.

## Cross-Project Intelligence

From the 5/22 + 5/23 cross-pollination briefs (both fresh):

- **Slack OAuth five-bug chain resolved end-to-end ("Slack: Healthy")** — two transferable findings for any future Klatch/integration work: (1) OAuth state (nonces, tokens, PKCE verifiers) must be class-level or process-global, never instance-level — per-request handler instantiation silently vanishes the state between authorize and callback; (2) health checks must read from the same data source the writer uses — if credentials go to keychain, the health check must read keychain (the calendar integration had this right; Slack didn't). Filed as another Pattern-073 instance (Documentation-Asserted-Behavior Drift).
- **ROSTER.md as org-shape document** — PM Docs filed first formal org-shape view of the 10-role team, separating the assignment-flow view (CLAUDE.md) from the tier/structure view. The split is generalizable: once a CLAUDE.md role table grows past ~8 rows, it's serving two different readers (a session-starter and an outsider trying to understand the team). Worth banking for Klatch and DinP if either roster grows past that threshold.
- **Project Biorhythms** (publishing today) — inhale (discovery) / exhale (build) oscillation as a project-health frame. Klatch's May 18–present pause readable through this lens as an inhale before the next build phase, not as a blocker. Worth a re-frame when the resume signal comes.
- **V1 duty cycle retirement = clean experiment close, not collapse** — methodology-31 (append-only, one file per fire, fast-forward push, zero conflict surface) and methodology-32 (Postel-robust memo-header parsing) carry forward into v0.2 regardless of which architecture PM ratifies. The session-boundary constraint (HOST durability memo) shaped the new design's START/STOP framing. Worth absorbing wherever multi-agent background cycles get proposed elsewhere.

## Brief reliability note

**Plan 2 Step 7 (3-day clean monitor) restart.** Today's clean fire is monitor day 1 after the 5/22 miss (xian off, no autonomous run, no daily-brief-2026-05-22.md). The 5/21 fire was monitor day 1 originally; the 5/22 miss resets the counter. Today is fresh day 1.

## Notes

- Klatch / Rebel / Weather repo clones returned `Repository not found` to this session's PAT — same Klatch behavior as 5/18; Rebel + Weather are new this run. Their absence is noted; carries from those projects are not surfacing because nothing is verifiable. Worth checking PAT scope or remote rename if this persists past Monday.
- piper-morgan-website clone landed in empty-master state on this run; PM-product commit `18b2da7` covers the active web-side work (5/23 log open + plan HTML move back).
