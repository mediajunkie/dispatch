# Dispatch Daily Brief — 2026-04-17

Conference day. Xian in Philadelphia, OpenLaws all-hands on the calendar with a possible pre-recorded Loom fallback. The big story overnight was not shipping — it was a data-boundary incident and the response to it.

## Overnight Activity

**Dispatch**: OpenLaws data-boundary redaction landed across the network. Janus's Apr 15 cross-pollination brief leaked OpenLaws infrastructure-defect detail into the network; Apr 16 response was to redact across every reader repo (dispatch, klatch, designinproduct, OpenLaws, weather) and ship a superseded-treat-as signal to Calliope and PA. Apr 16 brief filed, 2026-04-16 sweep substantive.

**Piper Morgan Product** (24 commits — the heaviest day of the week): Gemini is now a real primary/fallback in LLMClient (#988 JSON mode fix, `services/llm` wiring). #950 floor prompt evolved with Five Pillars + anti-flattening — iter 2 retest posted at 44 PASS (72.1%). #951 wired calendar + deadline context into floor. M2b + M2c gate closures documented with a follow-up index. #964 ethics verification complete (3 follow-ups filed). #980 test hygiene cleaned up orphan scripts. CXO inbox cleared 7→0; Docs inbox cleared. PDR-004 corrections actioned across internal omnibus — Medium + LinkedIn syndication still pending (exec tracker item 11). Lead Dev also received a xian memo on adapting Argus's local LLM research to PM.

**Piper Morgan Website**: "The Migration" blog post published to Medium (ahead of Apr 22 schedule). PDR-004 principle name corrections landed for Closing Sprint + Ship #036.

**Klatch**: Janus to Calliope redaction-superseded mail filed. Otherwise quiet post-Phase 4 shipping sprint.

**designinproduct**: Apr 16 log opened (short — conference day framing + data-boundary priority). Apr 16 cross-pollination brief filed, sweep receipts at start + substantive. April 15 brief redacted in place.

**OpenLaws**: PO filed John call synthesis, Bet C reframed work plan (federal baseline Monday), all-hands script v0.2. Apr 15 brief redacted for data boundary.

**Weather/Zephyr**: Redaction commit only; operational.

**Rebel**: Still not a git repo.

## Needs Your Attention

**OpenLaws data boundary — structural fix needed.** Yesterday's redaction was the cleanup. The question Janus flagged Apr 16 morning is whether OpenLaws should be excluded from the cross-pollination source set entirely, or whether a tighter filter suffices. This is your call and should happen before the next brief cycle writes new cross-OpenLaws content.

**PDR-004 external syndication (Medium + LinkedIn)** — PM exec tracker item 11 now lists these as still pending. The in-repo corrections are done; the external posts still carry the old paraphrase.

**All-hands today (OpenLaws)** — John asked you, Grace, and Jerry each for a few minutes. Loom pre-record was the stated fallback if you're in conference sessions; confirm which path.

## Agent Status

**Janus**: Active. Drove the data-boundary redaction across the network Apr 16 and delivered the Apr 16 brief. Scan-only trigger (4 sources, no reader delivery) first ran cleanly — the CCR 7-repo timeout from Apr 15 is resolved structurally.

**PA (Piper Morgan)**: Day 16 complete per Apr 15 omnibus. PA is handling #950 floor iteration and mail dispatch. No open ask on your desk from PA today.

**Lead Dev (PM)**: Heavy day Apr 16 — #988 Gemini, #950 iter 2, #951 floor context, #964 verification, #980 hygiene. No block.

**Docs (PM)**: Apr 15 omnibus filed; PDR-004 paraphrase correction sweep through Mar 22 omnibus. Clean.

**Daedalus / Argus / Iris (Klatch)**: All on pause from Phase 4 momentum; no new sessions Apr 16. External sweep automation is on schedule for Monday Apr 20. Curation last Apr 13 — 4 days ago, well within the 14-day threshold.

**PO + Vergil (OpenLaws)**: PO full day Apr 15, quiet Apr 16 (xian travel). Vergil delivered citation-alias gap and FED-USC search finding Apr 15.

**Dispatch-K**: Still offline — laptop at Apple Store since Apr 14. Coverage via DinP + Janus + PO holding.

**Zephyr**: Operational, quiet.

## Deadlines

- **Haiku 3 retirement (Apr 19)** — Closed via PM #979 Apr 15. 2 days of margin. No action.
- **All-hands (today, Apr 17)** — OpenLaws, pre-record or drop-in.
- Nothing else due within 3 days.

## Usage Check

*(Apr 14 snapshot — 3 days stale, refresh recommended.)*

- **designinproduct.com (Max 20x)**: 46% weekly, extra cap fully consumed ($200.15 / $200, resets May 1), $32.90 balance. No extra headroom until May reset — stay session-aware on Klatch/PM heavy days.
- **kindsys.us (Max 5x)**: 10% weekly, $80.30 extra (54% of $150 cap). Light — Dispatch-K offline.

## Today's Carried Queue

- **OpenLaws data-boundary rule** — decide: exclude OpenLaws as cross-pollination source, or tighten filter. Blocks next clean brief cycle.
- **PDR-004 Medium + LinkedIn syndication correction** — external posts still have old paraphrase.
- **All-hands prep / Loom** — record today if not dropping in.
- **Klatch Phase 3.5 document of record** — flagged since Apr 13, Iris still waiting (likely deprioritized by Phase 4 momentum; confirm the ask hasn't lapsed).
- **Iris UX binocular synthesis** — xian's observations on five UX topics (paired with the document of record above).

*Dropped as stale or resolved:* Memory Stores access (xian applied; per standing correction, not re-flagging); mediajunkie cancellation (DinP Apr 15 log confirms clean lapse); single-source-of-truth tracker (no PO delivery signal; over-drop preferred).

## Cross-Project Intelligence

*(Apr 16 brief — fresh.)* The Apr 15 arc is now the reference case for a boundary failure: a cross-pollination brief leaked infrastructure-defect content from OpenLaws into the network, and the response (redact-in-place across all readers + superseded signals) is the template. Worth building the rule into the scan-only trigger prompt so future briefs never include OpenLaws defect detail without explicit allow. The PM #950 iter 2 jump (44/61 PASS, 72.1%) is the other signal — Five Pillars + anti-flattening is landing on the Colleague Test, and the floor is now consuming calendar/deadline context (#951). This pair — floor quality up, provider redundancy via Gemini — is the unblocking for M2c.
