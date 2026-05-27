# Dispatch Daily Brief — 2026-05-27

## Overnight Activity

- **dispatch (4 commits since 5/25)**: 5/26 daily memos both directions (DinP→DK on AM cycle; DK→DinP open + EOD-updated); 5/26 cross-pollination brief published — *autonomous loop pilot (cron-bind-to-IDLE), memory audit pilot (#974), post-deletion except-chain tail risk (#1116)*; inbox-check 5/25 clean. No daily-brief-2026-05-26 in `intelligence/` — yesterday's brief was the cron miss flagged in DK's 5/26 memo.
- **piper-morgan-product (~25 commits 5/26 → early 5/27)**: **MEM-975 implementer-lane complete** (Lead Dev) + handoff memo to lead cc'd CEO; CIO duty-cycle v0.6 design + cron-lifecycle procedure landed; **62 cron fires** across two test phases (10-min flywheel × 57 + hourly day-parts × 5); **STOP procedure validated end-to-end** at 11:30 PM PDT (`97c7a44`); **START procedure executed autonomously** post-midnight (12:33 AM PDT, `d51c8a5`); first three May-27 fires running quick-IDLE returns. *Two Migrations in One Day* corrected + Medium URL added; Docs filed publish-post edit-pass mirror-bug heads-up to Web.
- **OpenLaws (~10 commits 5/26)**: **Goal E1 SUBSTANTIALLY ACHIEVED — John's SME eval complete** (~2h testing, Notion feedback page filed); **E1 experiments concluded** ($42 / 28 runs; survey-then-cite hypothesis refuted on V-19); **week-4 retro synthesized and ratified** (three-part operational discipline: pre-flight / test-before-assert / recognize-shifting-platform; CLAUDE.md gained 4 new standing rules); **PO session wedged ~15:30 PT** (170MB / 5-week-old / `role 'system'` API error) and recovered via fresh chat + clean handoff memo; **UV-bundle vs Node-rewrite spike filed** (Jerry leans Node); **C1 multi-keyword-variant experiment** ($21 / 16 runs) returned the architectural finding *MCP-internal multi-variant tool needed*; **model-knowledge five-whys filed** to Jerry as discovery memo (V-3-control-r1 reproducer + SKILL.md↔CLAUDE.md doc conflict + three option shapes); **shared-tree cleanup** (82 modified + 59 untracked committed in 9 chunks; PO + Vergil now on dedicated worktrees).
- **designinproduct (4 commits 5/25 + 5/26)**: 5/25 sweep substantive + delivery 7/7 (1 MCP fallback); 5/26 sweep substantive + delivery 7/7 (1 MCP fallback) — *autonomous loop pilot (cron-bind-to-IDLE), memory audit, post-deletion tail risk*. Cadence holding.
- **piper-morgan-website**: clone unavailable this run (disk-tight sandbox); no new commits beyond 5/24 (*Five Whys for Design Decisions*) per commit-log read.
- **Klatch / Rebel / Weather**: PAT-authed clone returns `Repository not found` again (Klatch since 5/18; Rebel + Weather since 5/23). Klatch remains formally paused. **PAT scope / remote-name diagnostic now 9 days old on Klatch side** and stalls all anti-zombie checks for those three projects.

## Needs Your Attention

- **OpenLaws Bet 1 — Week 5 Day 2 (today).** Per PO handoff (16:50 PT yesterday), do in order: (1) update week-5 plan doc thoroughly (#150 — fold John eval + 6-cluster E2 backlog + experiment re-centering); (2) propose sprint-canvas additions (#151 — deliverable-mode, real names only); (3) progress check / stock-take; (4) then put Vergil back to work. **Critical re-prioritization flag (#144):** the multi-level experiment framing may have eclipsed John's *original* core ask — varying keyword sets, comparing variants, judging best, searching with those. xian to read three experiment docs first to recover the L1/L2/L3/L4 framing.
- **Decision: pick one of C1's three next-directions.** (a) Hand C1 to Jerry as empirical motivation for the MCP-internal multi-variant tool; (b) Vergil prototypes the MCP-internal tool directly; (c) pause keyword-search experiments, route convergent finding back through Jerry's judgment. C1 was the *fourth surface* in 48h pointing at the same structural read: **SKILL-prompts-as-discipline is the wrong layer for behavioral enforcement** (E1 + E4 + C1 retrieval-procedure angle, model-knowledge tag assertion-discipline angle). Architectural recommendation consistent across all four.
- **Decision: Jerry MCP enrichment handoff — C1 corroboration addendum or not?** Routing question on whether to add C1 evidence before the handoff lands with Jerry.
- **UV-bundle vs Node-rewrite — destination conversation with Jerry.** Jerry's spike filed yesterday; clean A/B (UV-bundle 1-2 days partial vs Node-rewrite 1-2 weeks full). Jerry leans Node. **Unresolved tension:** John's Slack reaction *"hosted-MCP might make language moot"* operates at a layer above the spike. Needs xian + Jerry conversation about destination commitment before the language decision resolves.
- **`merge-keeper-sweep.sh` v0.2 `SWEEP_SKIP_WORKTREE` env-guard** — Mon 5/25 sweep skipped; **13 days open since 5/14**. Next window Mon 6/1 — bake the env-guard into the script or DK applies inline one-off again.
- **OpenLaws Vergil-branch triage** — `vergil/install-guide-fix-2026-04-30` + `vergil/cross-check-10-state-2026-04-29` (8 commits Haiku ablation; **do NOT delete without Vergil**). 13 days open.
- **PR #40 (Phase A bundle)** — Jerry + Copilot review still pending; xian is integration arbiter. 8 days open.
- **Phase B surveyor handoff to Jerry** — Vergil's drafted memo (`jerry-surveyor-skill-phase-b-handoff-2026-05-20.md`) still pending xian relay. 7 days open. May have been absorbed by the UV-spike outcome — confirm or relay.
- **Brief reliability — recurring cron survived the long weekend on the schedule plumbing but not on content.** Today's brief is the first since 5/25 (5/26 missed). DK's read: "Fix-not-monitor diagnosis still stands, but pull faoilean's clone before the diagnostic — the problem may be smaller than it looks." Worth a focused diagnostic this morning.
- **HOST v0.3 questionnaire draft review** — HOST sharing target ~May 27 (today) per CIO carryforward.
- **Anthropic competitive context — meeting?** Open since 5/12 (reinforced by 5/12 LDH × Anthropic legaltech-marketplace launch); **T+19 to billing split (Mon Jun 15)**.
- **Bet 1 product-name + contact-channels decisions** — Phase 2 cover material still gated. Shortlist standing: Research Workpaper / Research Trail / Verifiable Legal Research.
- **Usage CSV refresh** — last entry **2026-05-05 (22 days stale)**, past three weekly resets. kindsys balance $6.35 still under $10 watch threshold four weeks running; auto-reload ON.

## Agent Status

- **Lead Dev (PM)**: MEM-975 implementer-lane shipped yesterday — `scripts/generate-delta.py` (~210 LOC) + SessionStart hook Section 7; smoke + edge tests pass; cohort-rollout handoff memo distributed. Heavy day.
- **CIO (PM)**: Phase B autonomous-loop pilot **Day-2** running end-to-end. v0.6 design + 4 procedure docs + new `cron-lifecycle.md` (~140 LOC) landed; STOP validated; START validated 12:33 AM PDT (named-procedure test); hourly day-parts test ongoing (drift narrowing — 23 min yesterday → 11 min Fire 2 → 6 min Fire 3). v0.7+ candidate filed: commit-cadence-during-no-op-fires (cohort × 7 roles × multiple fires/hr could produce ~42 commits/hr of mostly-no-op).
- **Docs (PM)**: *Two Migrations in One Day* published Tuesday; paragraph 2 corrected (Docs-already-in-Code → "leadership roles" framing); publish-post.js edit-pass mirror-bug heads-up to Web cc PM (today's post hit it; manually corrected). May 25 omnibus + #972 MEM-TEMPORAL CIO unblock + #974 MEM-EVAL amendment all landed earlier in the week.
- **PA (PM)**: Discovered-work-tracking memo from Lead Developer awaits PA disposition (Option 2+3: session-wrap review + weekly sweep recommended); also CC'd to CEO/Arch/CXO.
- **Comms (PM)**: 9-essay arc remains closed (pub dates through Jun 23).
- **Web (PM)**: publish-post.js mirror-bug heads-up landed yesterday.
- **Vergil (OpenLaws)**: E1 + E4 + C1 executed end-to-end yesterday; model-knowledge five-whys filed; Vergil also wrote own handoff memo for fresh chat (context near full). On dedicated worktrees post-cleanup. Standing down after EOD wrap; awaits xian's pick on next direction (a/b/c above).
- **Jerry (OpenLaws)**: UV/Node spike filed; **moving May 31 → June 15**; Big Bear remote Jun 1-5; house-sitting Jun 6-15. Off Fri Jun 5.
- **PO (OpenLaws)**: Recovered from wedge; week-5 plan + sprint-canvas + stock-take queued for xian today.
- **John (OpenLaws SME)**: Completed eval; flagged compliance-officer segment contradiction surfaced earlier (5/11 DECISIONS); flagged hosted-MCP-makes-language-moot in #bet-sandbox.
- **Janus (DinP)**: On cadence. 5/25 + 5/26 sweeps substantive; 7/7 delivery sustained.
- **Argus (Klatch, split regime)**: External auto-scan continues on the DinP side. Internal Klatch session work paused with the project; Klatch repo unreachable from PAT for the 9th day.
- **Dispatch-DinP / Dispatch-Kind**: Cadence restored. DinP 5/26 AM memo + DK 5/26 EOD-updated memo both landed. 5/27 traffic open.

## Deadlines

- **Wed 5/27 (today, T+0)**: HOST v0.3 questionnaire share target; xian's OpenLaws stock-take + decision-pick day; the brief-reliability-closeout fires tomorrow.
- **Thu 5/28 (T+1)**: `brief-reliability-closeout` one-time fire at 16:00 UTC — with 5/26 miss it will report failure; the actual remediation diagnostic still owed.
- **Sun 6/1 (T+5)**: Next `merge-keeper-sweep.sh` window — env-guard or inline workaround needed before then.
- **Fri 6/5 (T+9)**: Jerry off.
- **Sun 6/7 (T+11)**: OpenLaws Bet 1 sprint window close.
- **Sun 6/15 (T+19)**: Anthropic billing split (Agent SDK / `claude -p` / GitHub Actions / third-party SDK apps → separate credit pool); Sonnet 4 / Opus 4 deprecation.

## Usage Check

- **designinproduct.com (Max 20x)**: last CSV entry **2026-05-05** — 48% weekly, balance $32.92, auto-reload ON. **22 days stale.**
- **kindsys.us (Max 20x)**: last CSV entry **2026-05-05** — 19% weekly (Fri 5:59 AM reset), balance **$6.35**, auto-reload ON. **22 days stale. Balance under the $10 watch threshold four weeks running.**

## Today Carried Queue

(All items survived the DECISIONS.md + session-log anti-zombie checks; nothing was found marked closed.)

- OpenLaws week-5 sequence: plan-doc update → sprint-canvas additions → stock-take → Vergil go.
- C1 next-direction pick (a/b/c) + Jerry-handoff-addendum decision.
- UV/Node + hosted-MCP destination conversation with Jerry.
- `merge-keeper-sweep.sh` v0.2 env-guard.
- OpenLaws Vergil-branch triage (install-guide-fix + cross-check-10-state).
- PR #40 review.
- Phase B surveyor handoff relay (may be absorbed by UV-spike; confirm).
- Brief-reliability diagnostic.
- HOST v0.3 questionnaire draft review.
- Anthropic meeting question.
- Bet 1 product-name + contact-channels decisions.
- Usage CSV refresh.

**Dropped this pass:**

- *V-broader anchor spot-check (V-16–V-21, V-24, V-26)* — not surfaced anywhere in 5/26 OpenLaws logs or PO handoff; convergent architectural finding (E1+E4+C1+model-knowledge) supersedes the validation-gate framing of the prior 102/102 provisional pass. Drop until re-raised.
- *CIO duty cycle v0.2 page 6/7 PROVISIONAL* — v0.6 design + procedures landed yesterday; STOP + START both validated. Whole provisional gate is closed.
- *PA Day 53 / Day 51 retroactive close* — both closed earlier in the week.

## Cross-Project Intelligence

Fresh from yesterday's cross-pollination brief (2026-05-26.md):

- **CIO autonomous loop pilot — cron-bind-to-IDLE design principle.** First live test exposed a timing gap: a 5-minute cron interval shorter than a single substantive task's work duration caused a three-fire pile-up. PM's correction (4:03 PM): the cron must pause while work is in progress — entering WORK dispatches `CronDelete`; reaching the (0,0) quiescent state dispatches `CronCreate`. A second refinement: PM-presence during active conversation also suppresses the cron (PM is the wake mechanism). Now two IDLE sub-states: **IDLE-PM-absent** (cron fires) and **IDLE-PM-present** (cron paused). Transferable to any agent-loop combining a scheduled trigger with autonomous task dispatch — Klatch (Calliope) if it ever builds one; Janus's cross-pollination sweep already addresses a related failure mode via Step-1 receipt-push-before-work.
- **Memory audit pilot (#974) across all role session logs.** Docs deployed a three-bucket audit step at session-wrap to learn which context surfaces agents actually use — pilot data accumulating from this week forward.
- **Post-deletion except-chain tail risk (#1116).** Lead Dev's morning verification session uncovered a silent server bug hiding in a startup exception handler left behind when the inference engine was deleted nine days ago. Lesson: when a subsystem is deleted, also delete the defensive scaffolding that was protecting against its failures — otherwise it goes on protecting *something else* silently.

## Brief Reliability Note

**Plan 2 Step 7 monitor failed again — third cycle.** Last clean brief is 2026-05-25. 5/22, 5/24, 5/26 all missed in three separate weeks. Recurring-cron path survives session boundaries (the cron fired today, producing this brief), but content production drops on long-weekend / xian-off windows. Today's brief lands but doesn't close the diagnostic — `brief-reliability-closeout` fires tomorrow Thu 5/28 16:00 UTC and will report failure absent a remediation. HOST's May-21 durability memo (`CronCreate durable=true` is session-only) remains the leading hypothesis. DK's 5/26 read worth honoring: pull faoilean's clone before the diagnostic — the visible miss count may be narrower than it looks.

## Sandbox Note

This brief was produced from a disk-tight sandbox: `/sessions` was 92% full on entry; pre-existing `/tmp/<repo>` clones were owned by `nobody` and unwritable, so fresh clones went to `$HOME/work/`. Klatch / Rebel / Weather clones returned `Repository not found` (9th, 4th, 4th consecutive day respectively); piper-morgan-website did not fit in remaining disk so commit-log read only. Public repos (dispatch, designinproduct, piper-morgan-product, OpenLaws) cloned cleanly with full content.
