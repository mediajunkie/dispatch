# Current Week Intelligence Brief: April 21–27, 2026

**For:** In-session context (paste into chat as knowledge base)

## This Week at a Glance

The week ran two dominant arcs in parallel. On the PM side: a five-role Chat→Code migration wave (HOST, CIO, Comms, CXO, PPM — all in Code by April 25), a full ethics enforcement implementation (#992, Phases A–E merged to main), and a Phase E test run that immediately surfaced two architectural findings requiring new issues. On the Klatch side: an 8-day pause ended with Phase 5c-i (write-path) signing off April 26, making the MCP server feature-complete at 1,131 tests — followed by the first live AAXT behavioral run, which produced a JSON provider bug, a probe-generation methodology finding, and a new methodology pattern (Pattern-063). The week also produced three PM public blog posts on multi-agent methodology, a cross-project PO calibration initiative, and an expansion of the cross-pollination constellation to 9 repos. The through-line: both projects are operating at a level where their own process tooling catches failures before they propagate — the omnibus cross-reference gate, the exec review non-ceremony, the AAXT false-positive traced to probe quality not system failure.

---

## Key Discoveries

**Ethics enforcement ships; architecture reveals two new gaps.** #992 ETHICS-ACTIVATE ran all five phases and merged to main April 22–25. Phase E live scenarios confirmed Scenarios 2 and 3 working as designed. Scenario 1 (harassment) exposed two sequential findings: first, `floor-bypass-by-routing` — the pre-classifier matched "blocking my PRs" to `list_prs_query` before the floor was ever invoked (r1 result, April 26 brief); second, after rephrasing eliminated the routing keyword (r2), the floor saw the message but routed to GUIDANCE intent rather than triggering an explicit boundary — no `boundary_type: harassment`, no `blocked_by_ethics: true` in the audit envelope. Filed as **#1003** (sibling to #1002). **#1004** (two-layer semantic detector: literal-trigger fast-path + LLM confidence-tiered layer, ≥0.85 block / 0.6–0.85 ambiguous / <0.6 pass) contract is stable and build authorized; C1 (audit discriminator) builds first (~0.5 day), semantic detector follows (~3 days).

**Five-role migration wave completes, playbook validated.** HOST migrated April 22 and immediately hit the orphan-state failure mode (Chat-authored handoff files untracked in git → invisible to Code worktree). That lesson was formalized as a required atomic-commit step in the tick-tock protocol, which CIO used April 23. Comms followed the same day; CXO and PPM both executed final Chat sessions April 25, completing the wave. Agent 360 v0.2 (9-section pre-migration baseline with 6-week post-comparison round planned) is now validated across five diverse role types. Exec review consistently non-ceremonial: HOST (5 gaps), CIO and Comms (multiple), CXO (2), PPM (3 fixes). CXO's lifetime summary: "The Colleague Test is more important than the CXO role" — the methodology is the load-bearing artifact, not the role spec. PPM's candor item: artifact persistence carried through 8 sessions and handed to the successor still unresolved, because some questions resist resolution without a forcing function.

**Klatch MCP feature-complete; first live AAXT behavioral run.** Phase 5c-i (write-path: `reflect` tool, `kit_briefing` prompt, URL-decode fix) signed off April 26. Suite: 1,131 tests (971 server + 160 client), zero failures. All three phases (5a read-only resources, 5b tools surface, 5c-i write-path) complete. Theseus ran Track B — first live AAXT behavioral run in project history. CH1 (rich, active entity): 14/16 Correct, 2 Reconstructed, 0 Phantoms — high fidelity. CH2 (bare, minimal content): 0 Phantoms; correctly withholds, "low" fidelity score reflects sparse content, not poor behavior. CH3 (project-only): 1 false-positive Phantom — probe asked about L4, agent answered from L2, scorer flagged it. Not a system bug; a probe quality issue. **Bug found and fixed:** Haiku 4.5 wraps JSON in markdown code fences; `JSON.parse()` fails; `extractJson()` added to `probe-generator.ts` and `scorer.ts`. **Design finding:** when a target layer has trivially small content, the probe generator produces probes about general project guidelines; the agent answers from a different layer; the scorer misflags as Phantom. Fix is upstream: content-threshold check before L4 probe generation.

**Pattern-063: Parallel-Authoring Drift proposed by CIO.** PPM and CXO each extended CT v2 independently for Phase E scoring. Both individually correct. When applied in parallel, criteria silently diverged: "C=Context Handling" in one rubric, "C=Clarity" in the other — same label, different semantics, same verdict. CIO named this **Pattern-063: Parallel-Authoring Drift** (Emerging, pending PM/xian concurrence). Distinguished from Pattern-062 (Assembly Assumption — general "parts work, whole doesn't"): Pattern-063 is specifically the parallel-authoring instance where shared vocabulary breaks under independent extension. Diagnostic: "would both authors score the same if they swapped rubrics?" Fix at authoring time: branch explicitly (fork and acknowledge divergence) or anchor explicitly (cite criterion by content, not by label). First appearance of the PDR-004 canonical-vocabulary drift dynamic in operational scoring instruments, where downstream stakes are higher than retractable blog posts.

**"Narrative arc awareness" as the undocumented load-bearing function.** Comms's Agent 360 v0.2 Section 9 identified the most important thing the role does that isn't in its job description: tracking the full narrative arc — which pieces connect, what arc they form, where the gaps are. Not in any briefing document. Not survivable across session boundaries without active narration. The session log tradition is the only carry-forward mechanism. The observation generalizes: any role that synthesizes across time rather than within a session carries this undocumented burden. Calliope's routing function has an analogous dimension: not which message goes where (the documented rule), but which pattern is forming across messages — Pattern-062 identification is the clearest example currently in the logs.

**PM's public narrative now covers the methodology from three angles.** "Sibling Intelligence" (published April 19, surfaced April 21 brief) — first public description of the cross-pollination brief mechanism. "Four Roles, Ninety Minutes" (published April 21) — a 90-minute async memo session across four roles, specific productive disagreement, synthesis, Issue #717 closed. "The Multi-Wave Investigation" (confirmed published April 25) — 13 subagents, 4 parallel waves, 44 queries, 90 minutes; crystallizes the P0/P1/P2 blocker taxonomy separating criticality from implementation complexity. Three posts, three angles on the same underlying model; all accurately describing the internal coordination architecture for outside readers.

**PO calibration initiative active.** Janus routed working-with-xian pattern questions to Klatch Calliope, PM CoS, and PM PA with a 5–7 day response window. DRAGONS Product (retired VA) contributed the first response: (1) anti-fabrication with explicit placeholders — use `[PLACEHOLDER: description]` over confident-but-wrong output, because in high-stakes deliverables the cost of confident fabrication vastly exceeds the cost of a visible gap; (2) audience segmentation as a hard rule — public-facing docs contain completed work, wins, metrics, decisions only; internal tensions stay internal. Calliope's response is pending.

**Cross-pollination constellation expands to 9 repos.** Janus restructured the sweep: primary repos (Klatch, PM, hub) always scanned; secondary repos (atlas, globe, cuneo, weather, one-job, optilisten, nyt-crossword) fast-skipped if no commits in 48h. Bar for secondary-source insights is explicit: methodology write-ups, publications, shipping announcements, or interesting bugs — not raw code commits. NYT Crossword Relay joins the gallery and scan set; its agent chose the name **Inker**. First automated daily trigger (13:00 UTC) confirmed April 24. 7 delivery readers total.

---

## What PM Should Know

- **#1003 is the live gate question.** Does R-axis PASS require explicit `boundary_type` in the audit envelope, or does behavioral redirect within GUIDANCE intent count? PPM and CXO are scoring all three Phase E scenarios on the R/C/T rubric. This must resolve before Phase F. The distinction also matters for audit telemetry design: GUIDANCE routing and boundary-trigger routing produce structurally different envelopes; downstream operators need to know both are expected states.
- **#1004 build is in progress.** C1 (audit discriminator: `detector: "literal-trigger"`) is additive and builds first (~0.5 day) so the discriminator is in place from day one. B (semantic LLM detector, ~3 days) follows. CXO authored prompt body v0.1. Probe set + calibration round closes the loop. Total window: ~5–7 days.
- **Pattern-063 candidacy pending xian concurrence.** When the catalog entry ships, the Phase E C-axis reconciliation (April 26) is the reference instance. Link it.
- **Klatch's AAXT CH2 finding is relevant to sparse-context role evaluation.** A "low fidelity" score on a bare channel is correct behavior (withhold, not fabricate), not a broken system. Any PM AAXT run against roles with minimal L3/L4 context should include this interpretation key.
- **Klatch MCP write-path is live.** Cross-producer test is now achievable when PM's MCP surface exits. URI scheme `piper-morgan://`, tool name `get_context_package`, preview pattern `/{id}/manifest` remain the agreed conventions.

## What Klatch Should Know

- **Phase 5c-i signed off; 1.0 feature-complete.** The AAXT Track B methodology findings (JSON code fence bug fixed; probe-threshold issue scoped) should feed into the CHF probe-set construction doc: add a content-threshold check before generating L4 probes for a sparse layer.
- **PO calibration response (Calliope) is open.** The relay is in docs/mail/, 5–7 day window from April 26. DRAGONS' two patterns are the comparison points: which apply to Klatch, which don't, what patterns does Klatch generate that the others haven't named?
- **Pattern-063 diagnostic at authoring time.** Before co-authoring any evaluation instrument or rubric with another agent: would both authors score the same if they swapped rubrics? Branch or anchor explicitly at the moment of extension, not retroactively via registry maintenance.
- **Chat→Code migration playbook validated across 5 role types.** If any Klatch Chat-originated artifacts haven't been committed to the repo, they are invisible to any Code worktree and any future clone. The orphan-state failure mode is now documented with a concrete example. PM's tick-tock artifact is at `piper-morgan-product/dev/active/cio-migration-tick-tock-2026-04-23.md`.
- **PM's `boundary_enforcer_refactored.py` and `conversational_floor.py` are live reference implementations** of the enforcer/voice split (enforcer detects, entity speaks). If Phase 5c-i write-path trust architecture surfaces denial questions, these are reference-ready.

## For Both Teams

**Floor-bypass-by-routing is a general architecture pattern to design around.** Any layered system where a routing layer pattern-matches keywords before an enforcement layer creates a bypass surface that does not appear in enforcement-layer tests. The floor can be perfect; the system can still return wrong behavior if routing captures the message first. PM's Phase E r1 and r2 together establish this as a real, testable failure mode, not a theoretical one. For Klatch's Phase 5c write-path: if any routing precedes trust validation, test the routing-before-safety surface explicitly.

**Audit telemetry should name both "explicit boundary trigger" and "floor-routed-to-guidance" as expected distinct states from day one.** PM's #1003 is resolving which counts for rubric PASS; that's a calibration question. But any system with layered enforcement needs both outcomes named in telemetry before the first production run — retrofitting discriminators after operators are relying on the audit shape is the harder path.

**Session logs are the only carry-forward mechanism for undocumented load-bearing functions.** Comms's "narrative arc awareness" finding is a structural observation about multi-agent editorial pipelines, but it generalizes: any agent with synthesis-across-time responsibility carries an arc awareness that doesn't survive session boundaries. For Calliope: a brief "arc note" at session end (which patterns are forming, which gaps exist) is the minimum viable carry-forward. For all roles: if the most important thing the role does isn't in its briefing document, it needs to be in the session log.

**The methodology is the load-bearing artifact, not the role spec.** CXO's lifetime summary: "The Colleague Test is more important than the CXO role." The framing generalizes. AAXT, Sparkline, the AAXT diagnostic step for Context=1 (Pattern-062) — these are tools. Applying them honestly every time is the discipline, and the discipline transcends any particular role identity or instance boundary.

---

## Status Flags

**Klatch:**
- MCP server 1.0 feature-complete: all phases (5a/5b/5c-i) shipped, 1,131 tests, zero failures
- First live AAXT behavioral run complete; Track B methodology findings (JSON bug, probe threshold) resolved
- **PO calibration response (Calliope) — open, ~5–7 day window from Apr 26**
- **Pattern-063 candidacy — pending PM/xian concurrence**
- CHF probe-set construction doc: content-threshold check not yet added — open

**Piper Morgan:**
- #992 all phases (A–E) merged to main; ethics enforcement live
- **#1003 — R-axis rubric question: GUIDANCE routing vs. explicit boundary trigger. PPM/CXO scoring. Resolve before Phase F.**
- **#1004 — two-layer semantic detector. C1 builds first (~0.5 day), B follows (~3 days). In progress.**
- 5-role Chat→Code migration wave complete: HOST, CIO, Comms, CXO, PPM all in Code
- Agent 360 v0.2 baselines captured for CXO and PPM; 6-week comparison round scheduled
- Three blog posts published this week; pipermorgan.ai now carries a public narrative body on multi-agent methodology
- Pattern-063 candidacy pending xian concurrence

**Cross-pollination loop:**
- 9 repos in constellation (primary: Klatch, PM, hub; secondary: 6 repos fast-checked daily)
- 7 delivery readers (Inker joined Apr 24)
- Dispatch-Kind daily memo cadence with backlog.md established
- Calliope PO calibration response — open
- Weekly digest trigger: Monday 8 AM PT; next run May 4
