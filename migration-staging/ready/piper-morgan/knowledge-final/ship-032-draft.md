# Piper Morgan Weekly Ship #032: From Green to Ready

**February 20-26, 2026**

Last week's "Assembly Required" identified a problem: individually correct features don't automatically compose into a correct system. This week we lived the fix. CXO testing with a fresh alpha account found only 2 of 5 M0 features passing the Colleague Test on Saturday — by Thursday, all known blockers were fixed, a critical security bug was caught, the domain model matured through cross-leadership consensus, and methodology started graduating from documents into automated infrastructure. The gap between "tests pass" and "users succeed" is closing, but it took concentrated effort to close it.

---

🚀 Shipped this week

🎯 Product & experience

B2 quality gate: the gap revealed. CXO tested M0's Conversational Glue features against a fresh alpha account and found two pass, one fails outright (soft invocation — recognizing implied needs), and two were blocked by calendar infrastructure issues. The Colleague Test caught problems invisible to automated testing: "yes" not registering as acceptance of an embedded offer, issue queries misclassified as project queries, soft invocation patterns too narrow for natural phrasing. All four CXO-identified blockers (#843-846) were fixed Tuesday, then systemic analysis asked "where else might these patterns exist?" — surfacing three more tracking issues (#849-851).

Domain model alignment achieved. CXO and PPM independently reviewed the Lead Developer's implementation questions about Product/Project/Repository relationships and converged on the same core principle: "products emerge from projects, not the other way around." Repository becomes a first-class entity with many-to-many relationship to Projects. Product-Project relationship gets built now but surfaced to users later through progressive disclosure. This became PDR-003 (Entity Concept Model), approved by both roles and ready for Chief Architect review.

Repository surfacing in progress. The #848 mini-epic to make GitHub repositories visible throughout Piper advanced significantly: project integration API (#859), setup wizard linking (#860), settings page (#861), conversational repo handler (#862), and repository domain model (#866) all closed by Thursday. One child (#863, portfolio onboarding) still open.

⚙️ Engineering & architecture

~24 issues closed across the week. Test suite at approximately 5,500 passing with zero failures at end of Thursday. Branch work continues — no releases this week.

#849 SEC-KEYCHAIN audit complete. Starting from a 9-out-of-30-point issue, Lead Developer rebuilt it to full compliance, wrote and audited a gameplan, deployed parallel subagents, cross-validated results, and closed with comprehensive evidence. The audit discovered 15 non-scoped keychain sites across 5 categories — including a critical Slack OAuth bug where an f-string in key names meant tokens were being stored but were never retrievable. 25 tests added plus a CI grep guard to prevent regression. Without the systematic audit, Slack integration would have appeared "connected" while silently failing on every retrieval.

Claude Hooks Phase 1 shipped. Implementing the CIO's Feb 20 approval, the new session-start.sh script performs four deterministic checks at every Claude Code session start: session log continuity (catches post-compaction duplicates), mailbox unread count, briefing freshness, and role identity injection. Three of our most common agent failure modes are now caught by infrastructure rather than protocol compliance.

Unified formality system (#838). Three competing formality subsystems — OnboardingNarrativeBridge, WarmthCalibration, and PersonalityProfile — consolidated into a single pipeline with 80 new tests.

🔬 Methodology & process innovation

Pattern-045 at the composition level. The week validated "Green Tests, Red User" as more than an individual-feature problem. All five M0 features passed their own tests. Integration tests passed. But a real user on a fresh account exposed gaps that no automated test caught. The Assembly Assumption (Pattern-062) now has a documented mitigation: systematic CXO review with fresh accounts after every major sprint.

From protocol to infrastructure. Claude Hooks is the first concrete example of methodology graduating to automated guardrail. CI grep guards on keychain scoping are another. The trajectory is clear: what starts as a document agents read becomes a check that runs automatically.

Methodology-20 updated. Omnibus logs had drifted from the prescribed timeline format, substituting session overview tables. PM's framing: "This is institutional memory, not busy-work." The methodology document now includes explicit anti-patterns and clarified requirements.

Pattern-061 elevated. Human-AI Collaboration Referee promoted from the stale piper-education/ folder after a forensic research session identified it as the only portable concept in an otherwise superseded section.

🌐 External relations & community

Ship #031 "Assembly Required" published midweek. Content pipeline delivered four pieces: "The Cathedral in Winter" (narrative, Feb 24), Ship #031 (Feb 25), and weekend insight posts queued.

Cindy Chastain podcast prep advanced. Comms Director reviewed the PM's planning call transcript and identified a five-act structure: world changed → prototype magic → manic coding → governance replaces drift → what remains. Key framing decisions: use "operating model" rather than "process," talk about Piper like a colleague, replace "the great refactor" with "deliberate stop." Sound check scheduled Monday, recording Wednesday March 4.

Ted Nadeau remains active. Mobile development experiments during travel, git sync exercise (26 commits pulled, 4 merge conflicts resolved with AI assistance), strategic discussions about Claude Hooks and tool-first vs. need-first exploration. Note: repo permissions may need review — direct pushes to main observed.

IA Conference 2026 (April). Registration complete with speaker discount. Travel booking in progress. Talk prep beginning with Comms Director.

📊 Governance & operations

Metrics (Feb 20-26): ~24 issues closed, ~180 tests added, ~5,500 tests passing at end of week (0 failures). No releases (branch work). 4 blog posts published (1 narrative, 2 insights, 1 Ship). 1 PDR created (PDR-003 Entity Concept Model). 1 pattern elevated (Pattern-061). 1 infrastructure tool shipped (Claude Hooks Phase 1).

Sprint gate #779 still open — CXO re-verification needed after this week's fixes.

Inchworm position: 4.5.0 (pending M0 gate closure).

---

💡 Learning pattern: The last mile is different work

Building features and polishing features require different kinds of attention. M0's five features were code-complete in three days. Making them actually work for a real user on a fresh account took an additional week of concentrated fix-test-fix cycling. The last mile isn't about writing new code — it's about discovering what the automated tests can't see: edge cases in natural language, implicit user expectations, the gap between "technically correct" and "feels like a colleague." Fresh-account CXO testing is now a standard gate, not a nice-to-have.

---

📚 Weekend reading

[PM to add]

---

🔮 Coming up next week

CXO re-verification of B2 quality gate with all fixes in place. Podcast recording with Cindy Chastain (Wednesday). IA Conference travel booking. Chief Architect review of PDR-003. Conversation lifecycle spec (#858) advancing. Continued M0 stabilization work.

---

*Building Piper Morgan: an AI-powered chief of staff for product managers.*
*Subscribe on LinkedIn · Read past ships on Medium*
*GitHub: https://github.com/mediajunkie/piper-morgan-product*
