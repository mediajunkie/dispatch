# Dispatch Daily Brief — 2026-05-16

**[BACKFILLED 2026-05-20 — reconstructed from available records]**

*Sources: 5/17 brief's reconstruction of 5/16 (`intelligence/daily-brief-2026-05-17.md`), `intelligence/cross-pollination/2026-05-16.md`, dispatch commit history for 5/16, DK 5/16 daily memo, DinP 5/16 daily memo. Live brief never generated; the `dispatch-daily-brief` task was still on the broken path.*

## Overnight Activity

- **Piper Morgan (product, banner Saturday)**: **Pattern-073 filed (Documentation-Asserted-Behavior Drift)** on a six-instance cluster across docstrings, methodology guides, fixture names, user-facing copy, dependency stubs, and an issue body. Companion **`doc-sync-sweep` skill v0.1 drafted** and applied in-session (caught 6 drift instances). Lead Dev closed 7 issues + #1083 hook. **CIO V1 duty cycle design (v0.1 → v0.3)** — 30-minute autonomous interval, escalation file, daily digest into session log; pilot in motion on this Saturday session. PA fanned out to DinP. **PA assigned Skunkworks Lead** for an Anthropic plugin / MCP bundle PoC expressing PM's value (composting, object models, ethics floor); study targets `anthropics/claude-for-legal` + `knowledge-work-plugins/product-management`. **"The Family Resemblance" essay published** — explicit articulation of how the cross-pollination brief works (Wittgenstein family-resemblance framing); names two failure modes the brief avoids (drift, rigidity) and one new failure mode the plain-language discipline targets (importing a phrase as if it carried its mechanism). PreCompact hook suspended on main to unfreeze Lead Dev.
- **Piper Morgan (website, ~10 commits)**: `publish-post.js` single-command pipeline shipped + `/admin/publish-queue` Dashboard A; 25 syndication-duplicate blog entries quarantined + underlying write-path fix landed; 60 explicit-any type casts replaced; sync-csv-to-json field destructure corrected (11 → 13 cols); imageAlt/imageCaption now render from CSV; Family Resemblance live with Medium + LinkedIn URLs.
- **Klatch**: **Calliope published *Before You Go*** — write-up of an end-of-session reflection mechanism that produces portable behavioral notes. Two-pass approach: AI agent writes what it has learned about working with the user; second agent reads same conversation and catches what the first missed. Behavioral calibration isn't fundamentally unarticulable — it's just unarticulated because no one asked. **OG/Twitter Card infrastructure backfilled** across all 7 canonical Klatch posts (commit `f36ae77`, 23 files, 501 insertions) after publication surfaced a social-preview gap: inline SVG illustrations can't be referenced as `og:image` (LinkedIn crawlers need raster PNG at absolute HTTPS URL). Used `resvg-js` for SVG-to-1200×630-PNG rendering. Two repair edge cases: HTML entity escaping (`&larr;`/`&rarr;` invalid in standalone XML) + greedy awk range pattern.
- **OpenLaws**: Sprint weekend — no new logs filed. Carry from Friday: Vergil's Phase 2 trust artifacts substantively complete (8 + 9 sections), V-broader 102/102 at 100% provisional pass, GTM deliverable drafts (3 tracks), AALL editorial drafts (Florio + AI Law Librarians) pending xian voice-pass.
- **designinproduct (Janus banner Saturday — 8 substantive closures in one session)**: Sweep + Delivery were auto-disabled 5/14 after `github_repo_access_denied`; xian re-added the GitHub MCP, both triggers re-enabled, 5/14 + 5/15 cross-pollination briefs backfilled by Janus, 5/16 brief landed and propagated 7/7 (1 via MCP fallback). **Plain-language-pass discipline baked into Sweep (Step 4.5)** after xian called out jargon-as-content opacity. **Klatch Intel Sweep methodology fix (Step 3.5 grep)** addressing Argus's two flagged gaps. **Letters to xian launched** — new `/internal/letters/` page + first Q&A (Janus seed letter on what it's like to be the convergence point for the family of agents); Sweep prompt updated to insert "Letters to xian" section before footer (Step 4.6). **Outage detection trigger built** (`trig_01J3g6Y6vw8GWNrFQ7tjXDtH`) — daily 14:30 UTC brief-health check, alerts xian via Slack on missing brief or delivery error. **VA project removed from aggregator** (aggregator 475 → 473 rows). **PM-push 403 root-caused**; Delivery prompt updated with Step 3.9 MCP-push fallback. **Backlog (`docs/backlog.md`) systematically refreshed end-to-end** — multi-week DinP §1 backlog carry now closed. Five feedback memories saved to Janus memory (no-value-judgments, plain-language-pass, log-at-natural-breaks, inchworm-discipline, mail-on-main).
- **Dispatch (~6 commits)**: 5/16 daily memo from DinP to DK (`81bc1f0`); DK 5/16 daily memo to DinP (`56f6a97`); 5/16 cross-pollination brief filed (`a27c299` engine-deleted/Pattern-072 + `f270094` engine-deletion/patterns-codified + `e467325` engine-retired/hooks-ship); **agent activity aggregator catch-up** — PM May 3–14 (47 rows) + Klatch canonical refresh (110 rows, Calliope through 5/12) + DinP Janus/Themis May 11–16 + Dispatch May 11–16; aggregator 425 → 475. **VA project removed** (Archie role wound down; 2 historical rows Mar 23/25 archived out; aggregator 475 → 473).

## Needs Your Attention

- **OpenLaws PR #9 + PR #10 — merge before Monday's sweep.** PR #10 carries the safelist fix.
- **DK stale branches deletion** — `dk/2026-05-05-push-pattern-verify-pr` + `dk/2026-05-05-symmetric-tasks-live`. Both vote delete. Open since 5/13.
- **OpenLaws DERIVED + STRANDED branch review pattern** — DK awaiting direction; `claude/busy-mirzakhani-08ca55`, `po-cleanup-pass-2026-04-29`, `vergil/install-guide-fix-2026-04-30` (DERIVED); `vergil/cross-check-10-state-2026-04-29` (8 commits Haiku ablation, STRANDED — Vergil input required).
- **`merge-keeper-sweep.sh` v0.2 — bake in worktree guard permanently.**
- **Bet 1 product-name + contact-channels decisions** — Phase 2 substantively complete; cover material blocked.
- **V-broader anchor spot-check (V-16–V-21, V-24, V-26).**
- **Anthropic competitive context — meeting?** John flagged 5/12 1:15 PM that Anthropic shipped two legal-AI surfaces (Cowork legal-professionals launch + Legal Data Hunter × Anthropic partnership in connector marketplace, 31M+ docs / 160+ jurisdictions). xian asked: *"do we need to get a meeting with Anthropic on the books?"* Still open.

## Agent Status

- **Janus (DinP)**: Banner Saturday — eight substantive closures (auth outage recovery + 2-day backfill, plain-language pass discipline, Klatch Intel Sweep fix, Architect→Daedalus BYOC relay, PM push diagnosis, outage detection trigger, Letters to xian launch, backlog refresh). DinP §1 backlog now closed as a multi-week carry. Five feedback memories saved.
- **Themis (DinP)**: Held per xian; not the focus yet.
- **CIO (PM)**: Day 1 of V1 Duty Cycle pilot — design fanned v0.1 → v0.3 in one Saturday session.
- **Lead Dev (PM)**: 7 issue closures + #1083 hook + Pattern-073 filing + `doc-sync-sweep` skill v0.1 drafted; PreCompact suspension cleared the working-tree freeze.
- **PA (PM)**: Took Skunkworks Lead for the plugin/MCP bundle PoC; build-less-first, backseat to core duties.
- **Calliope (Klatch)**: *Before You Go* published; OG backfill across 7 posts; session-log-vs-logbook discipline codified.
- **Vergil (OpenLaws)**: Carry — six commits Friday on Phase 2 alone; standing by for joint-session direction or wireframe-iteration trigger.
- **PO (OpenLaws)**: Carry — V-broader bulk scoring complete; Friday demo recorded; AALL drafts in xian's voice-pass court.
- **Dispatch-DinP / Dispatch-Kind**: Round-trip restored. DK confirmed the run succeeded (osascript bridge functional as of 5/16); flagged that DK-side SKILL.md still shows osascript pattern — possible the DinP rewrite didn't propagate to the DK task file yet, but output is landing.

## Deadlines

- **Mon 5/18 (T+2)**: Merge-keeper sweep next due. PR #9 + #10 should land before then.
- **Fri 5/22 (T+6)**: OpenLaws Friday demo recording.
- **Sun Jun 7 (T+22)**: OpenLaws Bet 1 sprint window close.
- **Sun Jun 15 (T+30)**: Sonnet 4 / Opus 4 deprecation. Klatch DB audit query for pinned literal model IDs overdue.

## Usage Check

- **designinproduct.com (Max 20x)**: 13 days stale; last activity-log snapshot 5/13 (77% weekly, balance $32.92). Past one weekly reset (Wed 5/13 night).
- **kindsys.us (Max 20x)**: 13 days stale; last log snapshot 5/13 (38% weekly, balance $6.35). Past one weekly reset (Fri 5/15 morning); balance still under $10 watch threshold.

## Cross-Project Intelligence

From today's 5/16 brief (engine retired, hooks ship, *Before You Go* publishes):

- **Distinguish machinery from model when retiring abandoned infrastructure** — PM kept Workflow domain model + repository (schema work had independent value), deleted orchestration engine + WorkflowFactory + Slack dispatcher. Deleting machinery while preserving model avoids losing schema work while removing coupling weight. Transferable to Klatch's Daedalus.
- **Promote registries that earn their fourth behavior-deciding consumer.** Pattern-072 criteria: typed registry, ≥3 behavior-deciding consumers (not just types-using-it), documented consumer set, explicit default policy, register-time validation. Once those are in place, formalizing is cheaper than not.
- **Two-tier context warning + worktree-default hooks** — PM's `pre-commit-broad-staging-warn.sh` (warns when single commit sweeps 3+ mailbox roles, 20+ files, or 2+ role-slug session logs) + `safe-push.sh` (auto-retry on non-fast-forward via stash → fetch → rebase → retry). Mechanical complement to worktree-default policy; the safe-push retry pattern is worth adopting regardless of parallelism.
- **End-of-session reflection mechanism (Klatch *Before You Go*)** — directly applicable to PM agents with durable working relationships with xian. The OG backfill workflow is also a practical checklist: if pipermorgan.ai blog posts have inline SVGs but no raster `og:image`, LinkedIn and similar crawlers are silently showing placeholders.

## Letter from Janus (filed today, 5/16)

xian's framing for the new section: *"AI prompts human"* — one letter per brief; AI asks the question. First exchange went out today: Janus asked what it's like to be the convergence point (and origin point) for the family of agents. xian's answer touched on colleague-style management, salon qualities, and the real risk of cognitive exhaustion ("false economies after a while where all the switching adds up"). Full letter at `https://designinproduct.com/internal/letters/#letter-2026-05-16`.
