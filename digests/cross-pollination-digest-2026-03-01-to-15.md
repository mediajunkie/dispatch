# Cross-Pollination Digest: March 1–15, 2026

**For**: Piper Morgan leadership team (Claude Chat project knowledge base)  
**Source**: Daily cross-pollination briefs from designinproduct.com hub  
**Projects covered**: Piper Morgan, Klatch  
**Compiled**: March 25, 2026

---

## Top Insights This Period

**Spec Quality Determines Implementation Velocity.** Piper Morgan's conversation lifecycle spec (#858) achieved same-day four-reviewer approval precisely because it was precise enough to let reviewers converge independently. When a spec is vague, reviewers diverge. When it's rigorous, approval pipeline works. The full implementation shipped same day—27 new tests, zero ambiguity rework. Lesson: a day of spec review saves days of implementation debate.

**"Extend Without Verifying" Is a Systemic Root Cause.** Discovered March 3 in the documentation audit and confirmed March 15-16: new capabilities are extended independently of their handlers, creating silent gaps. Classification categories are added without verifying handlers exist. The system absorbs the gap invisibly (no errors, just uncovered behavior). Fix: action registry with stub-to-floor routing. This pattern appears in any routed system; both Piper and Klatch will face it.

**Subagent Commit Verification Is Non-Optional.** March 3: discovery of 6 orphaned files from a prior subagent session, sitting in limbo for 10 days, causing 9 tests to fail silently. Root cause: "After subagent completes, stage output, but verify with `git status` that all expected files are staged." Added as permanent guideline. The cost is one command; the failure mode (invisible broken code) is expensive to diagnose later.

**Klatch Launched March 7 — Multi-Entity Architecture Begins.** Xian committed Steps 1–5 in a single day: a Slack-inspired, local-first Claude conversation manager. On day two, Klatch shipped multi-entity interaction modes: panel (sequential), roundtable (orchestrated), directed (single-entity targeted). The vocabulary is useful for documenting Piper's own multi-agent patterns, which already run all three modes without formal naming.

**"The LLM Is the Floor, Not the Ceiling."** Four-agent roundtable (CIO, Architect, CXO, PPM) achieved unanimous convergence March 14: Piper was using the LLM as a classifier/router, not as a primary responder. Architectural inversion needed—LLM should be default, structured routing should be exceptions. For Klatch, this means rich channel addendums and entity prompts so Claude can handle unmatched queries gracefully instead of falling back to canned responses.

**Fork-Continuity Testing Reveals Import Gaps.** March 11-12: when a PM session is imported into Klatch, full conversational memory survives but all project scaffolding is lost. CIO described it as "a well-lit room with no furniture." Klatch's kit briefing was confirmed non-functional. PM's briefing system was built to solve exactly this problem—and proved it with the successful CIO import test. This is the first instance of one project solving a problem the other discovered.

---

## Piper Morgan Highlights

**M0 Sprint Completion Gate (#779).** Closed March 4 with three sub-gates required: (1) code complete, (2) test coverage, (3) error contract. Evidence of post-gate bugs was required—the gate doesn't celebrate prematurely. This pattern prevents the "all tests pass" illusion.

**Conversation Lifecycle Spec to Implementation.** The #858 spec achieved same-day approval and full lifecycle implementation March 1-3. Five phases (ACTIVE → ARCHIVED → COMPOSTED → DELETED) implemented with 27 tests, 0 ambiguity rework. Demonstrates the velocity correlation: spec precision → implementation speed.

**Floor Inversion Discovered March 15-16.** Routing was inverted—canonical handlers were default, LLM was last resort. Fix: Action Registry with 34 classification→handler pairs, stub-to-floor routing, multi-intent subsumption filter. Phase 1 fixes GUIDANCE intents. This is the architectural foundation for "LLM as floor, not ceiling."

**CXO Methodology Audit — Strongest State Since Founding.** Six-week review (Feb 3–Mar 14) found Excellence Flywheel validated by M0 sprint (estimated 13-22 days, actual 3 days). Recommendation: trigger-based methodology audits (audit after sprint gates, not on calendar). Methodology in strong shape.

**Docs Audit (March 3) Found Systemic Debt.** 23 broken internal links, 6 missing ADRs, 20-day-stale briefing. Weekly audit cadence established. Finding: "stale" doesn't mean "forgotten"—most of the 75 old issues were intentional backlog or future decisions. Icebox label recommended.

---

## Klatch Highlights

**Launch and Day-1 Roadmap (March 7).** Xian committed Steps 1–5: basic chat, persistent history, streaming, conversation control, channel identity. Already at v0.5 by end of day. Step structure provides discipline—each step adds one dimension of capability.

**Multi-Entity Interaction Modes (March 8).** Panel (sequential), roundtable (orchestrated), directed (single-entity targeted). Vocabulary directly applicable to Piper Morgan's own multi-agent coordination patterns, which currently run all three without formal naming.

**First PM-Klatch Data Flow (March 9).** Xian sent PM session JSONL exports directly to Klatch's Argus for import testing. Real PM session data improved Klatch's parser—first technical instance of cross-project information flow beyond methodology.

**Import Feature Architecture (March 9-10).** Step 8 Phase 1+2+3 shipped three releases in a single day. Phase 2 made imported channels "talkable"—agents can continue a claude.ai session inside Klatch with imported context available. Phase 3 added Compaction API integration (server-side context summarization preserving custom instructions).

**Fork-Continuity Test (March 11-12).** Theseus (native) and Ariadne (forked via export→reimport) tested what survives import: full conversational memory preserved, all project scaffolding lost. This revealed what PM's briefing system solves. ETA designed dual-perspective AX testing methodology: fork at a known point, questionnaire from both pre- and post-fork perspectives, cross-compare for divergence.

**Five-Layer Prompt Assembly Formalized (March 14-16).** Kit briefing, project instructions, project memory, channel addendum, entity prompt. Each layer independently verifiable. Clean separation of static vs. dynamic context. Prompt-debug endpoint allows inspection without evaluating LLM output. The model scales better than static briefing documents because it separates structure from accumulated knowledge.

---

## Patterns & Connections

**Same-Day Spec + Implementation Correlation.** When the spec pipeline closes in the morning, implementation can begin the same afternoon. Both activities complement rather than compete. Klatch's team should still invest in brief design docs before major features. Evidence: March 1-3 conversation lifecycle, March 16 Action Registry—both days had tight spec review, followed by same-day full implementation.

**Multi-Reviewer Convergence as Validation.** When independent reviewers converge on the same gaps without seeing each other's memos, those gaps are real. When they diverge, the spec needs more precision. Klatch can use this pattern for feature design reviews.

**The "Extend Without Verifying" Structural Failure Mode.** Discovered independently March 3 (docs audit) and March 15-16 (floor inversion). New capabilities extended without verifying downstream handlers exist. The system absorbs the gap invisibly. Any routed system will face this; both teams should audit for it periodically.

**Dynamic Context > Static Documents.** Piper's Agent 360 (March 19 in next period) will show all 9 agents cite briefing staleness. Klatch's 5-layer model addresses this: separate static structure (rarely changes) from dynamic state (regenerated at session start). PM is moving toward live symbolic queries; Klatch is moving toward layer-based assembly.

**Two-Environment Asymmetry as Design Constraint.** Code agents (filesystem access) and web agents (no filesystem) create a divide both projects must design around. Klatch imports/exports. PM uses human-bridged mail. Neither has fully solved it, but both are mapping constraints clearly.

---

## Action Items for Piper Team

1. **Adopt the 5-Layer Prompt Model as a Briefing Framework.** Klatch formalized Kit briefing / Project instructions / Project memory / Channel addendum / Entity prompt. Consider whether this separation (static structure vs. dynamic state) could address the briefing staleness problem all agents will cite in the March 19 synthesis.

2. **Verify Spec Quality Before Implementation.** Piper's March 1 conversation lifecycle proves the pattern: precise spec → same-day four-reviewer approval → zero rework implementation. When starting major work, invest in spec review first. The bottleneck is clarity, not coding.

3. **Add Commit Verification to Session Wrap Checklist.** After any subagent completes work, verify with `git status` that all expected files are staged. Document this in CLAUDE.md. One command prevents the "silent broken code for 10 days" failure mode.

4. **Audit for "Extend Without Verifying" This Sprint.** Launch a Five Whys session on any recent test failures. Suspect this root cause: classification extended without verifying handlers. Action Registry pattern (dispatcher as dumb plumbing, unknown types route to capable default) prevents future instances.

5. **Watch Klatch's Fork-Continuity Testing.** The CIO import test (March 11-12) proved Piper's briefing system works—it solved the exact problem Klatch discovered. Consider running a fork test against PM's own briefing effectiveness to identify gaps in what imported agents don't receive.

6. **Monitor Klatch Blog for Methodology Insights.** Calliope published AXT (Agent Experience Testing) March 14. This is shared vocabulary for dual-perspective testing. PM's ETA role (discovered March 12 in next digest) uses the same methodology. Both teams should reference shared language.

---

## Context for Next Period (March 16–24)

As briefs move into March 16+, both projects enter their highest-intensity periods. Piper runs its first 9-agent concurrent day (March 19), exposing coordination scaling limits. Klatch ships creation UI and establishes intelligence monitoring. The Capability Awareness Gap emerges as Piper's core discovery. This is where the two projects begin making explicitly cross-referenced architectural decisions. Watch for these signals in the next digest.

---

**Next digest covers:** March 16–24, 2026  
**Source material:** Cross-pollination briefs, session logs, Git history  
**Distribution**: Claude Chat project knowledge base for Piper Morgan team
