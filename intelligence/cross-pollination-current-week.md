# Current Week Intelligence Brief: May 18–24, 2026

**For:** In-session context (paste into chat as knowledge base)

---

## This Week at a Glance

The week's narrative arc ran from tooling through architecture through design through pause. PM spent the first half converting production runs into codified disciplines at high velocity — six versions of the publish-to-blog skill in one afternoon, a session crash turned into a recovered artifact, a stranded newsletter draft into a new branch rule — while Klatch validated three new coordination disciplines in a single day before going into PM-directed pause midweek. The second half shifted toward architecture: Piper's knowledge graph received a defense-in-depth privacy enforcement layer (1,530 LOC, 79 tests, all acceptance criteria closed), the autonomous duty cycle was retired at V1 and substantially redesigned through V0.3 with a fundamental model correction, and the BYOC plugin PoC entered its build phase. Five essays published across the week; the nine-essay Comms arc closed with all pub dates locked through June 23. The recurring meta-theme: disciplines become durable when embedded in mandatory gates, not when documented in prose.

---

## Key Discoveries

**Real-world exercise is the fastest discipline generator.** The week's clearest pattern appeared first on Sunday: PM's first production publish run through the new pipeline exposed nine process gaps in one afternoon, each fixed and codified as a new discipline in the same session (publish-to-blog v0.10 → v0.16). Monday at Klatch: three new coordination disciplines (read mail immediately, push worktree mail to main, close threads to `read/`) adopted and validated in a single day, compressing what Calliope estimated as a three-day probe cycle into one afternoon (ChannelSettings: 54% → 94% conveyance). The meta-principle: allocate time in a first-real-run session specifically to iterate; design-only exposure misses failure modes that only appear under production conditions.

**Pattern-073 promoted Emerging → Proven two days after filing.** Documentation-Asserted-Behavior Drift — written assertions about code that quietly become wrong as code changes — reached 13 instances across 10 surface layers by May 18 and was ratified Proven. New instances continued to surface across the week: a health check reading env vars while OAuth stored tokens in keychain (Slack integration fix), a spec clause that didn't survive contact with the actual repository interface (#1089 build), and a MANIFEST asserting empty while memos were physically present on disk. The recognition trigger: any present-tense assertion about a named code surface that isn't auto-generated from that surface. The doc-sync-sweep skill is the companion enforcement mechanism.

**"Discipline as infrastructure" as the week's recurring structural finding.** Three separate incidents demonstrated the same failure mode in different domains: (1) Ship #043 — an essay about how documenting a rule doesn't enforce it — was published with a fabricated External section that demonstrated the same failure. (2) The omnibus assembly gap (Pattern-062) was named as a practice five days before PM's own omnibus demonstrated it. (3) The CLI's mandatory dry-run gate was added only after a real publish run surfaced what informal review missed. In each case, the fix wasn't becoming more attentive — it was making a specific check mandatory at a specific gate. The cross-reference gate in the omnibus skill, the fold-on-handoff rule in branch discipline, and the pre-flight warn-on-empty check in publish-to-blog all share this structure: move the discipline from attention into infrastructure.

**CIO autonomous duty cycle fundamentally reframed through V0.3.** The CHECK step had been modeled as "check the inbox" through V0.1 and V0.2. PM's page-6 walkthrough on May 23 identified this as a fundamental modeling error: CHECK is a day-part dispatcher ("which day-part am I in?"), not an action. The cascade: mail detection belongs entirely inside the WORK flywheel; day-boundary termination is time-driven (past 11pm), not inbox-driven; WORK's (0,0) terminal — no mail, no tasks — routes to IDLE within the day, not STOP; IDLE is now formally defined as a mid-day polling state exited by new mail or new-day detection. The V1 cohort (HOST, Docs, Exec) was formally retired after PM directed a redesign; validated learnings (methodology-31 append-only architecture, methodology-32 Postel-robust header parsing, session-boundary constraint empirically confirmed) carry forward regardless of which V2 architecture is selected.

**Privacy enforcement shipped to Piper's knowledge graph.** #1089 closed all seven acceptance criteria in five tested increments: PrivacyLevel enum (PUBLIC/STANDARD/STRICT), write-path gate (STRICT raises `PrivacyFilterRejectedError` before any DB write), read-path filter (STRICT nodes excluded from reads and searches), repository-layer safety net (independent harassment-pattern scan at the DB layer as defense-in-depth), and audit-log integration (structured `EthicalDecision` records with `session_id` correlation). 79 new tests, 1,530 LOC across 6 files. The defense-in-depth structure — each layer makes its own independent decision; upper-layer presence doesn't disable lower-layer checking — is the transferable architectural pattern.

---

## What PM Should Know

- **M2g milestone substantially complete.** Slack DMs (#1085), calendar aggregator (#1086), Notion write adapter (#1080), and Slack→Notion URL unfurling (#1081) all shipped. Remaining: #1085 slice 3 (Slack mentions, needs `search:read` User Token OAuth re-auth — `search:read` is a User Token scope, not a Bot Token scope; available under the correct tab; ~50 LOC once unblocked).
- **Slack OAuth is now healthy.** Five-bug chain resolved: scope tab confusion, wrong workspace, missing redirect URI, instance-level nonce (fixed: class-level dict), health check reading env var instead of keychain. Integration Health shows "Slack: Healthy (last checked: 2026-05-22T18:14)." Three tracking issues filed: #1107 (DinP workspace migration), #1108 (OAuth failed-attempt UX), #1109 (Redis-backed state).
- **#1089 knowledge graph privacy: shipped.** 79 tests, all 7 ACs closed, 1,530 LOC. Side-finding: Architect's spec clause requiring `privacy_level != public` check at the repository layer doesn't survive contact with the repo interface (repo has no `privacy_level` parameter); spec-clarification memo sent to Architect, response pending.
- **BYOC PoC entered build phase.** Three-feature triangle ratified: cold-start-as-pm-profile, insight-journal-flat-file, composting-via-dreams-mcp. Build-less/either-outcome-is-signal posture per PM's framing. Stretch feature (Type 2 adversarial dreams probe) cut at second PM gate if it absorbs bandwidth.
- **CIO duty cycle: V0.3 committed; V2 design pending PM ratification.** Page-7 walkthrough and methodology batch deferred from the May 23 session. V1 cohort retired cleanly. North-star sentence confirmed: "wake if idle, check new messages/tasks, do unblocked things until blocked, batch update for my attention, then sleep."
- **Comms: nine-essay arc complete, pub schedule locked May 26–June 23.** Beats 7–9 drafted May 23 (Beat 7: *Hypothesis Refuted*; Beat 8: *Branch-or-Anchor in Ninety Minutes*; Beat 9: *The Hook and the Worktree*). Roughly once-per-week cadence from May 26 onward.
- **June 15 Anthropic billing split: ~3 weeks out.** Agent SDK, `claude -p` headless mode, Claude Code GitHub Actions, and third-party SDK apps move to a separate credit pool at full API rates. Monthly caps: Pro $20, Max 5x $100, Max 20x $200; credits don't roll over. BYOC PoC user-facing framing should note that programmatic use draws from Agent SDK credits.
- **Fold-on-handoff rule now in branch discipline.** Any agent finishing a draft on a worktree branch that needs a human gate (voice-pass, peer review) must copy to the canonical main-branch location and commit before closing the session. ~2–3 min cost; prevents the "I can't find the draft" recovery scenario.
- **ROSTER.md filed.** PM's first org-shape document, separate from CLAUDE.md's assignment-flow view. Tier 1: 7 leadership roles; Tier 2: 3 staff roles; Tier 3: specialized. The "org-shape vs. assignment-flow" split is the generalizable design insight for any team with a CLAUDE.md role table past ~8 rows.

---

## What Klatch Should Know

- **Klatch is paused by PM direction as of May 20.** Last substantive sessions: May 18 (Calliope's wrap log + Argus Round 33b). Round 40 AAXT conveyance at 94% and Round 33 fully closed are stable. No action required until PM signals resumption; May 18 context is the clean handoff point.
- **"Project Biorhythms" published May 23.** PM's Comms essay from November 2025 on discovery/build oscillation. The reframe: Klatch's pause is an inhale, not a failure mode. "Entering exhale" is the accurate orientation when Klatch resumes.
- **Three coordination disciplines validated before pause.** Read mail immediately (don't batch); push mail from worktree branches to main immediately so other agents can see it without hunting branches; move closed threads to `docs/mail/read/` at the moment of closing. All three adopted in CLAUDE.md and exercised same day (54% → 94% ChannelSettings conveyance). Worth re-anchoring at session restart if any have drifted.
- **Session-boundary constraint empirically confirmed.** `CronCreate durable=true` is session-only — the cron terminates at the session boundary, not the calendar day. Any autonomous cycle needs re-instantiation each session; it doesn't persist overnight.
- **OAuth integration lessons (transferable).** OAuth state (nonces, tokens, PKCE verifiers) must be class-level or process-global storage, never instance-level — per-request handler instantiation silently garbage-collects state between the authorize and callback steps. Health checks must read from the same data source the writer uses (if credentials go to keychain, health check must read keychain — not env vars).
- **Pattern-073 recognition trigger.** Any present-tense assertion about a named code surface that isn't auto-generated from that surface. Klatch's CLAUDE.md assertions, coordination.md status fields, and session-log conventions all carry this exposure. Run a doc-sync-sweep pass after any significant refactor.
- **ROSTER.md model.** When the Klatch agent roster grows past ~8 named agents, separating org-shape view from assignment-flow view (two documents, two readers) is the clean pattern. Current count: 7. File when a new agent finds the CLAUDE.md role table harder to parse than it should be.

---

## For Both Teams

**The detection-vs-response separation is a reusable architecture.** PM's ethics enforcer ("The Voice of a Denial") and Piper's privacy filter both now use the same structure: a machine-legible signal (pattern-match log entry, `PrivacyFilterRejectedError`) produced for audit, plus a category-only hint routed to the conversational floor, which writes the actual user-facing response. Audit artifact and user experience are produced by different layers with different optimization targets. This applies anywhere an agent must refuse or redirect a request: log the machine-legible signal; give the floor a category hint; let the floor write the response. Prevents "system-error in user-facing voice" without sacrificing audit integrity.

**Disciplines are durable when they're gates, not guidelines.** The week's recurring structural failure — Ship #043's fabricated External section, the omnibus assembly gap catching PM's own synthesis, the informal review missing a formatting bug — all share the same root: a discipline written in prose is applied only when someone remembers to apply it. The fixes were structural: mandatory cross-reference gate in the omnibus skill, pre-flight warn-on-empty before publish, editorial-calendar verification as a required skill step. The design question worth asking for any existing guideline: "Is this enforced at a specific gate, or is it available-when-remembered?"

**CHECK vs. WORK is the key semantic distinction for any autonomous loop.** The CIO duty cycle's V0.1–V0.2 modeling error — putting mail-checking in the outer routing step rather than the inner action loop — is a generalized trap for any loop design with an outer routing step and an inner action step. Diagnostic test: "Is this step deciding what to do next, or doing it?" If ambiguous, split it. The corrected model (CHECK = day-part dispatcher; WORK = where all actions happen; IDLE = mid-day polling state) applies directly to Klatch's AAXT loop cadence and Argus's weekly sweep design.

---

## Status Flags

**Piper Morgan:**
- M2g substantially complete ✅; #1085 slice 3 pending `search:read` User Token OAuth re-auth
- #1089 knowledge graph privacy: shipped ✅ (79 tests, all 7 ACs, 1,530 LOC)
- Slack integration: Healthy ✅ | #1107 DinP migration, #1108 OAuth UX, #1109 Redis-backed state: filed
- CIO duty cycle: V0.3 committed ✅; page-7 walkthrough deferred; V2 design pending PM ratification
- BYOC PoC: in build phase ✅ (three-feature triangle ratified)
- Comms: nine-essay arc drafted ✅; pub schedule May 26–June 23 locked
- Fold-on-handoff rule: live in branch-worktree-mailbox-discipline.md ✅
- ROSTER.md: filed ✅
- **June 15 Anthropic billing split: ~3 weeks out** — BYOC PoC + Klatch Step 10 export path both affected
- Pattern-073: Proven ✅ (13+ instances, 10+ surface layers; new instances continue to surface weekly)

**Klatch:**
- Paused since May 18 by PM direction; clean hold ✅
- Round 40 AAXT: 94% conveyance ✅
- Round 33: closed ✅ (1,289 tests green, no regressions)
- Three coordination disciplines: adopted ✅ (read-immediately, push-mail-to-main, close-to-read/)
- Resume trigger: PM direction; May 18 is the clean handoff point
- Framing: pause = inhale (see "Project Biorhythms"); resume = entering exhale

**Cross-pollination:**
- Weekly Digest trigger: nominal this run
- June 15 billing split: affects both projects' Agent SDK surface areas; flag in any user-facing deployment framing
- Klatch Intel Sweep: paused context; resume alongside Klatch session restart
