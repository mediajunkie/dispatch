# Dispatch Daily Brief — 2026-04-28 (Tuesday)

**Headline:** PM #1004 semantic detector shipped end-to-end Mon (Steps 8+9, 112/112 PASS); #1002 + #1003 closed; Phase F flag-flip conditions met — decision now sits with PM/PA. Klatch ran first live MCP stdio integration test (27/27) + live export round-trip surfacing three gap findings. CoS Q5 PO calibration reply landed; Bet 1 bundle complete and relayed to PO before Sprint Day 1 kicked off.

## Overnight Activity

- **Piper Morgan (product, 30+ commits — heaviest)** — #1004 SHIPPED in one session: Step 8 Phase C run-1 (11/20 PASS) → CXO divergence scan → prompt v0.2 + probe deltas → run-2 (18/20 PASS) → Step 9 ship merge. Full ethics suite 112/112 PASS. #1002 + #1003 closed with full evidence. Lead Dev filed Phase F notification — conditions met, decision routed to PM/PA. CIO published Methodology-00 (Flywheel v2) broadcast + omnibus reframing/workstream review source-shift memo. CXO landed CT v2.3 with embedded Branch-or-Anchor section. Methodology-24 + 25 filed. Pattern-063 + Pattern-064 slot allocation ratified by PM. Three PR merges (#1022/#1023/#1024). HOST published 360 synthesis cover.
- **Klatch (9 commits)** — Theseus Round 29 (extractJson regression) + Round 30 (probe content threshold). First live MCP stdio integration test in project history: spawned server via official TS SDK over stdio, 27/27 pass on second run. Live export round-trip across all three formats — three gap findings filed (UUID-matching, no re-import path, L4/L5 lost). Phase 3.5b dual-mode extraction live (9 field notes; cross-validation pattern visible). AAXT against imported 143-message Theseus channel: 13/13 Correct on first L1 probing. Calliope routed Argus PM #995 outreach via Dispatch.
- **designinproduct (9 commits)** — Apr 28 cross-pollination brief shipped substantive (3 sources). Relayed CoS Q2 + Q5 replies for OpenLaws Bet 1 bundle. PA Q6 closure to Janus. Sweep + delivery receipts filed. Apr 27 log (Janus quick review of new 4-trigger rhythm).
- **OpenLaws (~10 commits)** — Sprint Day 1 closed clean: 6 deliverables, 3 deepenings, follow-ups tracker. Pitch v0.8 (bake-off → cross-check reframe + Phase-1 carry-overs). Local cross-check MCP — generic-OpenAPI proxy mirroring John's Scalar surface. Fat-marker sketches + audit walkthrough cleanup. DK Monday log + DinP thank-you. Vergil Tuesday-AM pickup signal filed.
- **Dispatch (8 commits)** — Bundle complete signal (CoS Q2+Q5 landed); DK Monday relay received; consolidated PO relay updated; weekly cross-pollination digest Apr 21–27; brief 4/27.
- **Weather/Zephyr** — no new commits since last brief (the two listed are reordered Sunday brief deliveries).
- **Piper Morgan (website)** — no commits.
- **Rebel** — still not a git repo (back burner since Apr 9).

## Needs Your Attention

- **#992 Phase F flag-flip decision (PM/PA call).** All four conditions are met per PPM v4: Architect scoping ✅, #1002 + #1003 closed with evidence ✅, diagnostic shows flag matters (5/5 harassment-vector flag-off runs pre-tuning) ✅, probe set + two calibration rounds on main ✅. Lead Dev's recommendation: defer the actual flip until ADR-061 (architectural-delta codification, in flight from Architect) lands. New today; routed to PM/PA inboxes Mon afternoon.
- **Usage CSV is 11 days stale** (last appended Apr 17). Apr 25 snapshot captured in dispatch activity log but never committed to `intelligence/usage-tracking.csv`. dinp 100% of $200 cap; kindsys 101% of $150 cap (over by $1.85). Both reset Fri May 1 (T+3). OpenLaws Bet 1 sprint will continue to drive Kind-side burn — kindsys balance thin at $14.46.

## Agent Status

- **Janus** — Apr 28 substantive brief delivered (3 sources). First full Monday on the new 4-trigger rhythm (Klatch external sweep 10:00 UTC, weekly digest 10:30 UTC, intel sweep 12:00 UTC, xpoll delivery 13:00 UTC). Healthy.
- **Argus** — Internal curated sweep last filed Apr 26 (2 days, healthy; flag at 14 days). External CCR scan: latest file in `klatch/docs/intel/` is Apr 26 — Mon Apr 27 9 AM PT auto-trigger does not appear to have produced a new file; flag if Apr 28's run is also missing. Sonnet/Opus 4 DB audit before Jun 15 still the open hard-deadline item.
- **Daedalus (Klatch)** — Standing down per xian's direction; awaiting test-driven findings.
- **Theseus (Klatch)** — Monday session: 998 server tests, zero failures. First live MCP stdio integration. Round-trip + Phase 3.5b live. Imported-channel AAXT first L1 run. Two MAXT-ready channels left in DB.
- **Calliope (Klatch)** — Routed Argus PM #995 fabrication-probe coordination memo via Dispatch. Iris UX synthesis on docket for Tuesday morning per yesterday's wrap.
- **PM agents** — Lead, Arch, CXO, PPM, CIO, HOST, Comms, PA, Docs all active Monday. Five-role Code-era migration wave still complete and stable. Methodology catalog compounding (Methodology-00 v2, 24, 25; Patterns 062/063/064).
- **Dispatch-Kind** — Daily memo cadence active. Consolidated PO relay (advice 5/5 + bundle 6/6 minus xian-direct Q6) delivered to PO before Sprint Day 1 kickoff. DK observations note added flagging Pattern-062 multi-agent confirmation, DRAGONS-PLACEHOLDER convergence, manifest-as-API for v1 MCP, and session-log-discipline shape.

## Deadlines

- **Today (Apr 28)** — OpenLaws Bet 1 Sprint Day 2.
- **Wed Apr 29 (T+1)** — Bet 1 Day 3 prototype bake-off prep (John's Scalar vs OpenLaws POC).
- **Fri May 1 (T+3)** — both extra-usage caps reset (dinp $200, kindsys $150).
- **Sun Jun 7 (T+40)** — Bet 1 sprint window close.
- **Sun Jun 15 (T+48)** — Sonnet 4 / Opus 4 deprecation. Aliases in place; DB audit query for pinned literal IDs is the remaining work (Argus tracked).

## Usage Check

- **designinproduct.com (Max 20x)** — last logged Apr 25: 100% of $200 extra cap, balance $32.90, weekly 12%. Resets May 1.
- **kindsys.us (Max 5x)** — last logged Apr 25: 101% of $150 extra cap (over by $1.85), balance $14.46. Resets May 1.
- CSV append still pending since Apr 17.

## Today Carried Queue

- **#992 Phase F flag-flip decision** — PM/PA call; Lead Dev recommends ADR-061 wait.
- **Usage CSV refresh + Apr 25 snapshot append.**
- **PO advice-on-working-with-xian — Calliope (Klatch) reply still pending.** Day 4 of the 5–7 day window. DRAGONS, CoS, PA all on record. Tracking only.
- **Janus DinP backlog three §1 items** (bootstrap scaffolding update, memory file refresh, daily memo composition) — Apr 27 was a quick-review session, no advancement; resumable.

*Dropped from yesterday's queue (verified via DECISIONS.md, mail, or working tree):*
- Pattern-063 slot confirmation — CLOSED (PM concurrence Apr 27 PM: 063 = "Parallel-Authoring Drift," 064 = "Extension Without Integration").
- Bet 1 v0.6 voice review — CLOSED (pitch advanced to v0.8 Mon, bake-off→cross-check reframe).
- piper-morgan-product stash-pop merge conflict — CLOSED (working tree clean except for one untracked PDF).

## Cross-Project Intelligence

Apr 28 cross-pollination brief is fresh (today, substantive, 3 sources). Four key insights:

1. **#1004 ships end-to-end in one session; Phase F flag-flip open to PM/PA.** Calibration pipeline (typed probe dataclass + async runner + domain-expert divergence loop) is transferable to Klatch's AAXT if it ever extends to behavioral-correctness assertions on redirect content. `hint_shape_violation` is a named failure mode on substantive domain words — foreseeable gotcha for any system auditing redirect output for input-substring leakage.
2. **Klatch first live MCP stdio integration (27/27) + three export round-trip gaps.** Findings map to Phase 3.5 / L5 portability work in flight: (a) UUID-matching gap means re-import creates duplicate projects; (b) canonical format has no `/import` endpoint, currently write-once for round-trip; (c) silent round-trip drops Layer 5 — Phase 3.5 is the design answer but must be explicitly invoked.
3. **CoS PO advice: source-check comparative claims before they ship under someone else's name.** Reviewer-vs-author distinction. Discipline depends on the relationship's tolerance for "wait, let me check that." The xian-Calliope Klatch reply is still pending; DRAGONS (anti-fabrication PLACEHOLDERs + audience segmentation) and CoS (verifiable-claims) are both on record as comparison points.
4. **Methodology-24 (Branch-or-Anchor) + 25 (Workstream Review Cadence) filed; Pattern-063 self-implements via CT v2.3.** The canonical Colleague Test rubric now tells its own users how to avoid Pattern-063 when extending it. Methodology-25 codifies source discipline for workstream reviews effective Ship #041 onward (read primary session logs first; omnibus is coverage check, not primary input).
