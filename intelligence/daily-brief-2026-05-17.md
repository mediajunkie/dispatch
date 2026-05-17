# Dispatch Daily Brief — 2026-05-17

**Gap note:** Last brief was 2026-05-12. The brief-generation task was sidelined by the same `start_code_task`-vs-osascript ghost-run that knocked out `dk-daily-memo` (diagnosed and fixed 5/15 — this brief is the first scheduled run on the working path). 5/13–5/16 are reconstructed from the activity log, DECISIONS.md across projects, dispatch mail, the cross-pollination briefs, and the 5/16 Janus log.

## Overnight Activity

- **Piper Morgan (product, Sat session)**: Banner Saturday for methodology + comms. **Pattern-073 filed (Documentation-Asserted-Behavior Drift)** on a six-instance cluster across docstrings, methodology guides, fixture names, user-facing copy, dependency stubs, and an issue body. Companion **`doc-sync-sweep` skill v0.1 drafted** and applied in-session (caught 6 drift instances). Lead Dev closed 7 issues + #1083 hook. **CIO V1 duty cycle design (v0.1→v0.3)** — 30-minute autonomous interval, escalation file, daily digest into session log; PA fanned out to DinP. **PA assigned Skunkworks Lead** for an Anthropic plugin / MCP bundle PoC expressing PM's value (composting, object models, ethics floor); study targets `anthropics/claude-for-legal` + `knowledge-work-plugins/product-management`. **"The Family Resemblance" essay published** — explicit articulation of how the cross-pollination brief works (Wittgenstein family-resemblance framing). PreCompact hook suspended on main to unfreeze Lead Dev.
- **Piper Morgan (website, ~10 commits)**: `publish-post.js` single-command pipeline shipped + `/admin/publish-queue` Dashboard A; 25 syndication-duplicate blog entries quarantined and the underlying write-path fix landed; 60 explicit-any type casts replaced; sync-csv-to-json field destructure corrected (11→13 cols); imageAlt/imageCaption now render from CSV; Family Resemblance live with Medium + LinkedIn URLs.
- **OpenLaws (5+ commits since 5/12)**: **Vergil Phase 2 trust artifacts substantively complete** — 8 Evaluator Brief sections + 9 System Card sections drafted using bracketed-placeholder discipline. **PO V-broader bulk scoring 102/102 pillars at 100% provisional pass** across 30 queries; 8 anchor candidates flagged for xian spot-check; NY parser failure confirmed on a second specialty compilation; FL + CO coverage gaps to harvest pipeline. **SME advisors unlocked via John** — Dave Zvenyach (FAR) and Chris Hilliard (financial-services compliance) become lead adversarial-review path. **Friday demo recorded** — three queries exercising `survey_jurisdictions` / `expand_hierarchy` / `search_codified_law`. **Trust page→Vanta** confirmed (no custom trust page to build). Vergil **claude-for-legal sequencing memo** drafted (CONNECTORS.md line 62 explicitly solicits regulatory primary sources). AALL editorial drafts (Florio + AI Law Librarians) ready for xian voice-pass.
- **designinproduct (heavy Saturday)**: Sweep + Delivery were auto-disabled 5/14 after a `github_repo_access_denied` failure; xian re-added the GitHub MCP, both triggers re-enabled, 5/14 + 5/15 briefs backfilled by Janus, 5/16 brief landed and propagated 7/7. **Plain-language-pass discipline baked into Sweep (Step 4.5)** after xian called out jargon-as-content opacity. **Klatch Intel Sweep methodology fix (Step 3.5 grep)** addressing Argus's two flagged gaps. **Letters to xian launched** — new `/internal/letters/` page + first Q&A (Janus seed letter); Sweep prompt updated to insert "Letters to xian" section before footer. **Outage detection trigger built** (`trig_01J3g6Y6vw8GWNrFQ7tjXDtH`) — daily 14:30 UTC brief-health check, alerts xian via Slack on missing brief or delivery error. **VA project removed from aggregator** (aggregator 475 → 473 rows). PM-push 403 root-caused; Delivery prompt updated with Step 3.9 MCP-push fallback. Backlog (`docs/backlog.md`) systematically refreshed.
- **Dispatch (~5 commits)**: Two daily DK memos exchanged (5/14, 5/15, 5/16). **Ghost-run diagnosis + fix landed 5/15** (osascript → `start_code_task`). 5/14/15/16/17 cross-pollination briefs filed. Agent-activity aggregator catch-up: PM May 3–14 (47 rows), Klatch Calliope canonical through May 12 (110 rows), DinP + Dispatch May 11–16; aggregator 425 → 475.
- **OpenLaws Bet 1 cross-cutting decisions (5/12 Sunday)**: PII Shield deferred (later, not next). Four-path landing-page IA accepted as working assumption ("I use Claude" / "I use ChatGPT" / "I build my own product" / "I run a legaltech AI product"). Daily standup in #bet-sandbox dropped (redundant with #check-in). API design philosophy ratified: JSON shapes are suggestions, not mandates. Trust-artifacts scope reshape after John feedback (Trust Center page out-of-scope; no-query-retention claim false for default tier; SOC 2 "Readiness Report for Enterprise" language replaces Type II framing).
- **Klatch, Weather, Rebel**: No fetchable clones (klatch / rebel / weather repos returned 404 from `mediajunkie` org under those names this pass — likely renamed or now private; activity captured indirectly via cross-pollination briefs).

## Needs Your Attention

- **OpenLaws PR #9 + PR #10 — merge.** PR #10 carries the safelist fix that keeps `merge-keeper-sweep.sh` from trying to delete `origin/main`. Until #10 lands, every routine sweep needs the patch reapplied by hand. Next sweep is tomorrow (Mon 5/18). Strong recommend merge before then.
- **Stale DK branches — your OK to delete.** `dk/2026-05-05-push-pattern-verify-pr` and `dk/2026-05-05-symmetric-tasks-live`. Both DinP + DK vote delete (superseded by the two-tier push policy). Open since 5/13.
- **OpenLaws DERIVED branches — decide review pattern.** `claude/busy-mirzakhani-08ca55`, `po-cleanup-pass-2026-04-29`, `vergil/install-guide-fix-2026-04-30`. DK is asking: walk through each, or delete-with-prejudice. STRANDED `vergil/cross-check-10-state-2026-04-29` (8 commits, Haiku ablation) needs Vergil's input before any move.
- **Bet 1 Phase 2 cover blockers — product name + contact channels decisions.** Both trust artifacts (Evaluator Brief + System Card) are substantively complete but cover material can't land without these. Current working title "OpenLaws Legal Research Agent"; xian favorites include Research Workpaper, Research Trail, Verifiable Legal Research.
- **Bet 1 V-broader anchor spot-check (8 candidates: V-16–V-21, V-24, V-26).** Current validation gate before the 102/102 provisional pass rate can ratify.
- **Anthropic competitive context — meeting?** John flagged 5/12 1:15 PM: Anthropic shipped two legal-AI surfaces (Cowork legal-professionals launch + Legal Data Hunter × Anthropic partnership in the connector marketplace, 31M+ docs / 160+ jurisdictions). xian asked in thread: *"do we need to get a meeting with Anthropic on the books?"* Still open.
- **`merge-keeper-sweep.sh` v0.2 — bake in worktree guard.** Phase 3 force-removes all worktree dirs, not only empty-branch-pinning ones. DK applied a `SWEEP_SKIP_WORKTREE` env-guard inline 5/14 as one-off. Permanent fix needs to land.

## Agent Status

- **Janus (DinP)**: Banner Saturday — eight substantive closures in one session (auth outage recovery + 2-day backfill, plain-language pass discipline, Klatch Intel Sweep fix, Architect→Daedalus BYOC relay, PM push diagnosis, outage detection trigger, Letters to xian launch, backlog refresh). DinP §1 backlog now refreshed end-to-end; no longer a carry. Five feedback memories saved to memory (no-value-judgments, plain-language-pass, log-at-natural-breaks, inchworm-discipline, mail-on-main).
- **Vergil (OpenLaws)**: Six commits Friday on Phase 2 alone; Phase 2 substantively complete; standing by for joint-session direction or wireframe-iteration trigger.
- **Piper Open (OpenLaws)**: V-broader bulk scoring complete; Friday demo recorded; AALL drafts in xian's voice-pass court.
- **CIO (PM)**: V1 duty cycle pilot was 5/16 — design fanned out v0.1→v0.3 in one Saturday session. Pilot is the first empirical run; results gate any rollout to other roles.
- **Lead Dev (PM)**: 7 issue closures + #1083 hook + Pattern-073 filing + `doc-sync-sweep` skill v0.1 drafted; PreCompact suspension cleared the working-tree freeze.
- **PA (PM)**: Took Skunkworks Lead for the plugin/MCP bundle PoC; build-less-first, backseat to core duties.
- **Argus (Klatch, split regime)**: Two sweep-quality flags from 5/10 + 5/11 actioned by Janus (Step 3.5 grep added). External auto-trigger cadence not directly observable from this brief's fetch reach (Klatch repo unavailable); rely on cross-pollination brief for next signal.
- **Themis (DinP)**: Four-patch relay applied and pushed to origin 5/15. Held per xian ("not quite ready to focus on Themis yet").
- **Dispatch-DinP / Dispatch-Kind**: Round-trip closed 5/13 (push-arm `com.kindsys.dispatch-push-arm` live, 15-min cadence). Ghost-run fix verified working (this brief is proof). Daily memo cadence restored both sides.

## Deadlines

- **Mon 5/18 (T+1)**: Merge-keeper sweep next due. PR #9 + #10 should land before this for a clean sweep.
- **Sun Jun 7 (T+21)**: OpenLaws Bet 1 sprint window close.
- **Sun Jun 15 (T+29)**: Sonnet 4 / Opus 4 deprecation. Klatch DB audit query for pinned literal model IDs remains overdue per the 5/12 carry; no contradicting evidence found this pass.

## Usage Check

- **designinproduct.com (Max 20x)**: last CSV entry 2026-05-05 — 48% weekly (resets Wed 9 PM), Sonnet 2%, Claude Design 21%, balance $32.92, auto-reload ON. **12 days stale, past two weekly resets.** Activity log captured a 5/13 snapshot (DinP 77% weekly, reset that night, balance $32.92) that never made it into the CSV.
- **kindsys.us (Max 20x)**: last CSV entry 2026-05-05 — 19% weekly (resets Fri 5:59 AM), balance **$6.35**, auto-reload ON. **12 days stale, past two weekly resets.** Activity log 5/13 snapshot: 38% weekly, balance $6.35. **Balance still thin** — standing kindsys-watch threshold is <$10; sitting under that line two weeks running. Auto-reload should fire on next burn, but worth eyes-on.

## Today Carried Queue

- **OpenLaws PR #9 + #10 merge** — operational unblock for the sweep tooling. See above.
- **DK stale branches deletion** — xian decision still open since 5/13.
- **OpenLaws DERIVED + STRANDED branch review pattern** — DK asking for direction.
- **Bet 1 product-name + contact-channels decisions** — Phase 2 cover material blocked.
- **Bet 1 anchor spot-check (8 candidates)** — V-broader validation gate.
- **Anthropic meeting question** — xian's own surfaced question 5/12; nothing booked.
- **Usage CSV refresh** — 12 days stale; activity log has 5/13 snapshot to structure in.
- **Two DK logs uncommitted** on shared openlaws checkout (`2026-05-05`, `2026-05-11`).
- **OpenLaws working-tree hygiene** — `experiments/openlaws-mcp-poc-py/` rename residue (still untracked per last verified pass; flagged before but no clear close).
- **OpenLaws synonym-registry question to John** — workdesk draft still present at the path it has been since 5/04; not visibly resolved in DECISIONS.md. Light-touch sanity-check.
- **dispatch working tree** — clean on the fresh clone; standing-item check passes.

**Dropped this pass (resolved or superseded):**

- *Janus DinP §1 backlog* — systematically refreshed 5/16; was a multi-week carry, now closed end-to-end.
- *Ghost-run failure mode for `dk-daily-memo`* — diagnosed 5/15, fixed via `start_code_task` migration; verified by 5/16 + 5/17 memos landing.
- *DK reply on branch-bottleneck signal* — landed 5/12 (`signal-…-ack-bottleneck-accepting-two-tier`); push-arm follow-up landed 5/13.
- *DK→DinP daily memo gap* — restored 5/14 onward; backfill memo from DinP covered 5/12–14; cadence restored.
- *Round-trip verification* — tokens A↔B exchanged 5/13; both clones confirmed synced; both Phase 0 pull gaps acknowledged.
- *Sweep + Delivery auto-disable (5/14)* — recovered 5/16 via GitHub MCP re-add + manual re-run; outage-detection trigger built to surface it next time.
- *Cross-pollination current-week brief staleness* — stale at 5/12 brief, but 5/14/15/16/17 daily briefs filed and 5/17 brief landed Saturday-afternoon-fresh; staleness flag retired.
- *Iris session 10 / Surfaces 3–8* — was on the list pre-5/12; nothing new surfaced via fetchable channels, and the Klatch repo wasn't reachable this pass for direct confirmation. Dropping per drop-on-unverifiable until next Klatch-visible cycle.
- *PM SDK / roadmap-staleness / #983* — all closed pre-5/12; not re-flagging.

## Cross-Project Intelligence

From the 5/17 cross-pollination brief (Pattern-073 + autonomous-cycle theme, published this morning):

- **Pattern-073 (Documentation-Asserted-Behavior Drift)** is the narrative sibling of Pattern-064 (Alive Scaffolding). The recognition trigger is portable: *a present-tense assertion about a named code surface, not auto-generated from that surface*. Klatch's engine and Layer 3 code surfaces have the same exposure; the `doc-sync-sweep` skill is a candidate transfer once Klatch is reachable.
- **"The Family Resemblance"** essay names two failure modes the cross-pollination brief avoids — *drift* (mandated standard abandoned in practice) and *rigidity* (standard preventing local variation) — and one new failure mode the plain-language discipline targets: importing a phrase as if it carried its mechanism. The Step 4.5 plain-language pass is the operational countermeasure.
- **CIO V1 duty cycle as portable autonomy template.** Key architectural decision: reuse existing authority model (the conversational "do everything you're unblocked on, batch questions, use discretion" rule) rather than inventing new rules. The escalation-surface pattern — a single visible markdown file PM can glance at when curious — is a lightweight alternative to richer status-reporting. Applicable to Argus's sweep cadence and any Klatch role currently waiting on user triggering.
- **PA Skunkworks PoC + Klatch MCP convergence.** PM is now starting an MCP-bundle PoC; Klatch already ships as an MCP server (Phase 5a/5b, 1069 tests per the brief). No coordination needed yet, but the brief is the right channel if API surface or plugin manifest shapes converge.

## Letter from Janus (5/16)

xian's framing for the new section: *"AI prompts human"* — one letter per brief; AI asks the question. First exchange went out 5/16: Janus asked what it's like to be the convergence point (and origin point) for the family of agents. xian's answer touched on colleague-style management, salon qualities, and the real risk of cognitive exhaustion ("false economies after a while where all the switching adds up"). Full letter at `https://designinproduct.com/internal/letters/#letter-2026-05-16`.
