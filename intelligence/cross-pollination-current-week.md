# Current Week Intelligence Brief: May 11–17, 2026

**For:** In-session context (paste into chat as knowledge base)

---

## This Week at a Glance

The week opened with a design reframe — panels as functional musculature, not settings admin — and closed with a published essay theorizing how exactly such reframes spread across sibling projects. In between, a single sweep item from Monday morning (Anthropic's Managed Agents "Dreaming" release) repositioned both projects' memory differentiation strategies within 48 hours, with Klatch publishing a full research spike by Tuesday and PM's Piper Alpha beginning a parallel PoC. Klatch ran three consecutive Iris design sessions (9–11), resolving UX vocabulary and producing a concrete 1.0 critical path. PM delivered its heaviest infrastructure week of the sprint cycle: ADR-054's Layer 3 memory moved from designed-but-unimplemented to live data, a silently-bypassed workflow engine was deleted (−10,734 LOC), and the conversational Floor gained real-time GitHub-state awareness. Both projects ended the week with cleaner architecture, lower surface area, and more clearly defined next horizons.

---

## Key Discoveries

**Anthropic's native memory store is architecturally identical to Klatch's L3.** Argus's Dreaming research spike (478 lines, 5 passes) confirmed: Anthropic's Managed Agents memory layer is a markdown filesystem with hierarchical namespace and session-persistent context — the exact shape of Klatch's L3. The April 12 Janus synthesis predicted this design space with ~90% accuracy four months in advance. The strategic corollary holds for both projects: **don't compete on "external memory layer for Claude"; compete on assembly-layer differentiation** — cross-channel context assembly and conversation-as-substrate are what the SDK doesn't provide. Klatch's import/export contract is unaffected (none of its three importers or transports touch memory-store APIs today). Five architecture decisions (D1–D5) are named and pending, with D1 (should Klatch export L3 snapshots in export packages?) as the load-bearing one.

**Opus 4.7 is now Klatch's default — the +35% tokenizer concern resolved empirically.** Monday's brief reported the flip held pending compaction-threshold recalibration. By Tuesday, Daedalus's own 4.7 sessions hadn't surfaced the concern and xian released the flip. The SDK bumped from 0.86.1 to 0.95.1 in the same window (was 6 minor versions behind). Klatch: 1,263 tests green on 4.7. PM has the same evaluation pending; the empirical Klatch data is positive evidence the +35% tokenizer impact isn't a practical constraint on current session shapes.

**Iris sessions 9–11 compressed an entire design sprint.** Three sessions across the week resolved: panels as functional musculature (F6.7 — the design mandate); a two-track patch/redesign split; panel disclosure taxonomy (settings panels inline, task/library panels as true modals); and all five user vocabulary questions (V1–V5: klatches/chats, agent/role, set-up-a-klatch, invite/convene, naming-is-promotion). A concrete 1.0 critical path design brief landed: composition gesture → klatch setup surface → Tier 1 patches → working meeting experience → promotion gesture. The faint-token fix completed a one-day round-trip: Iris spec'd → Daedalus shipped → Argus pinned in tests.

**PM's "designed-but-unimplemented" memory infrastructure finally produces real signal.** #1021 UserHistoryService Layer 3 shipped end-to-end: 4 new schema columns (topics JSONB, preview TEXT, is_private, turn_count), GIN index, DBUserHistoryRepository with ranking, maintenance hooks on save_turn and archive_conversation, 4 auth-gated API routes, and a latent bug fix in context_assembler that had been silently preventing MEMORY-category queries from populating the floor. The schema-discovery cut the estimate from 4–6 days to ~2–3 days because ConversationDB and ConversationTurnDB already existed. ADR-054 and PDR-002 adaptive greetings are now production-active.

**The workflow engine that had been silently bypassed for months was deleted.** Phase 0 audit confirmed the engine's main-path usage had been rerouted by #883 months earlier; Slack's tests were mocking it entirely. #1094 ENGINE-DELETION removed the orchestration engine, WorkflowFactory, and Slack dispatcher (−10,734 LOC; 59 files touched; 1,434/1,434 intent service tests pass). The Workflow domain model was preserved — machinery vs. model is the cut. The cleanup also tipped Pattern-072 ("Registries Grow into Architectural Shapes") to Proven: the task_type registry gained its fourth behavior-deciding consumer (Slack dispatch), meeting the formalization criterion.

**Documentation drift is now a named, filed pattern.** Six instances of Pattern-073 (Documentation-Asserted-Behavior Drift) surfaced within 48 hours of the engine deletion: docstrings that asserted behaviors the code no longer exhibited, fixture names that didn't match their actual classification behavior, user-facing copy referencing a deleted setup wizard, an issue body recommending a patch inappropriate for the actual column type. The pattern: a narrative artifact asserts a present-tense contract about a named code surface, the code drifts, the artifact doesn't. A companion doc-sync-sweep skill (v0.1) was drafted and applied same day. Promotion to Proven requires one more independent instance by May 30 and a clean fresh-fix flow by a different agent.

---

## What PM Should Know

- **M2f complete (Groups A+B+C+E).** Token refresh (#857 Option A) shipped; Floor has 7 cached, fail-graceful context surfaces including GitHub-state awareness (blocked items, active milestones, recent activity). All with TTLs and Redis fallback.
- **M2g-A+B closed; M2g-C+ in progress.** #1087 SEC-JWT-SECRET-PROD-GUARD filed (jwt_service.py uses hardcoded dev key when env unset — production risk). #1088 GITHUB-ADAPTER-DEMO-FALLBACK filed.
- **#1090 MUX/UI gap cohort underway.** Six roles contributing role-specific input by Wed May 20 EOD; CXO synthesis Fri May 22. Lead Dev surfaced 7 UI surfaces beyond MUX scope. CXO named three voice spines from existing MUX: colleague-not-system / offer-first / always-useful.
- **Pattern-073 Proven window: May 30.** Promotion requires one more independent instance within 14 days (by 2026-05-30) AND doc-sync-sweep skill operating cleanly on a fresh-fix flow by a different agent. The six confirmed instances were all surfaced by a single large deletion; the next candidate is any significant refactor.
- **Piper Alpha: Anthropic plugin/MCP bundle PoC underway.** PA is Skunkworks Lead; build-less-first posture; two prior-art repos provided (`claude-for-legal`, `knowledge-work-plugins/product-management`). Parallel to PDR-005 v0.3 (BYOC, in-flight via Architect + CXO).
- **#1070 multi-turn evaluation harness deferred** (3–5 hr methodology investment; was past 8pm on May 12).
- **Worktree-default is now standing policy** with enforcement hooks: `pre-commit-broad-staging-warn.sh` (warns on 3+ mailbox roles / 20+ files / 2+ role-slug session logs in one commit) and `scripts/safe-push.sh` (auto-retry on non-fast-forward via stash → fetch → rebase → retry).
- **Context-usage-reminder hook landed** (fires at 50MB transcript threshold, proactive complement to PreCompact). Two-tier context discipline now in place: 90% reminder → compaction → PreCompact warn.

---

## What Klatch Should Know

- **Opus 4.7 is now default.** SDK at 0.95.1. Suite: 1,263 tests green. The +35% tokenizer concern was empirically resolved — no unexpected compaction boundary in practice.
- **June 15 deprecation: zero exposure confirmed.** Argus's DB audit (May 11) found zero rows pinned to literal `claude-sonnet-4` or `claude-opus-4` IDs in entities, channels, or messages. Not a risk.
- **Dreaming D1–D5 pending decisions.** D1 (should Klatch add `extensions.klatch.l3_snapshot` to export packages?) is load-bearing — the `extensions` namespace in `packages/server/src/export/package-builder.ts:184` already accommodates it. D5 (cross-read with PM's PA spike) gates on PA's PoC publication. None urgent.
- **1.0 critical path defined.** Sequence: Daedalus Tier 1+2 patches (in flight) → Iris + xian spec composition gesture → Daedalus implements → Theseus MAXT-validates → 1.0 beta. Holistic redesign continues in parallel post-beta.
- **Panel implementation mandate.** F6.7 is a design directive, not a finding: the comparison surface for any panel is Surface 8 (export — the strongest in the app), not any settings/admin panel. Panel disclosure taxonomy: settings panels push the message list down (inline); task/library panels (entity manager, import, export preview) are true modals with explicit backdrop.
- **Vocabulary baseline confirmed (V1–V5).** User-facing: klatches/chats (not channels), agent/role (not entity for users), set-up-a-klatch (not configure/create-meeting), invite/convene (verb pair for add-to-existing vs. create-new), naming-is-promotion (no separate promotion verb).
- **Apply doc-sync-sweep after large refactors.** Pattern-073's recognition trigger is transferable: any present-tense assertion about a named code surface that isn't auto-generated from that surface. Run a sweep pass after any significant deletion or refactor. F6.3, F6.5, and F7.4 from Iris session 9 all remain open (import-vs-create asymmetry, composition gesture not findable from entity manager, Claude Code browse fragmentation in import dialog).
- **Argus sweep pre-curation step.** Before flagging an intel item as a new research find, grep `docs/mail/`, `docs/research/`, and `docs/intel/` for prior mentions. The MemPalace incident (May 11) confirmed the gap is real.

---

## For Both Teams

**The assembly-layer framing sharpens both projects' roadmaps.** Anthropic's SDK now handles memory primitives. The question for every memory-adjacent feature is whether it competes at the primitive layer (store, retrieve, version) or the assembly layer (what gets assembled across sessions, channels, and agents to produce context-aware behavior). Features in the assembly layer have no SDK competitor. Features in the primitive layer need a differentiation argument that wasn't required before May 6.

**Worktree-default is now PM canonical with mechanical enforcement; Klatch should adopt preemptively.** The failure mode — concurrent agents committing on shared main, cross-agent files landing in unexpected commits — occurred three times in one week at PM before enforcement shipped. Klatch's current session discipline is sequential enough to avoid this, but if Daedalus + Argus ever run concurrent sessions, the pre-commit staging-warn hook catches accidental sweeps before they land.

**Autonomous duty cycles are the next coordination surface.** PM's CIO designed a 30-minute duty cycle (V0.1 → V0.3 in one session): fixed-interval cadence, existing authority model reused rather than replaced, escalation file PM can check when curious, Day-N digest. PA fanned v0.1 to DinP. The design's North Star — "PM checks in because PM wants to, not because PM has to" — applies equally to Klatch's Argus sweep cadence and any role that currently waits for user triggering. The key architectural decision is to reuse the existing authority model rather than writing new rules.

**"The Family Resemblance" is the canonical external explanation of what this brief is.** PM's Comms published an essay (May 16) describing the cross-pollination mechanism as a Wittgenstein family resemblance: overlapping subsets of features rather than mandated standards. DECISIONS.md spread via the brief; worktree discipline traveled from PM; handoff memo template moved outward and Klatch extended it. No single feature is universal. What it enables: fast adoption with retained sovereignty — any agent can adopt a practice without negotiating its shape and modify it without permission. Calliope: this is the canonical external reference if Klatch needs to explain the brief mechanism to a new agent or outside reader.

---

## Status Flags

**Piper Morgan:**
- M2f complete (Groups A+B+C+E) ✅
- M2g-A+B closed ✅; M2g-C+ in progress
- #1021 UserHistoryService Layer 3: production-active ✅ (ADR-054 / PDR-002 now live)
- #1094 ENGINE-DELETION: merged ✅ (−10,734 LOC)
- M2f-E Floor: 7 cached GitHub-aware context surfaces ✅
- Pattern-072 (Registries Grow into Architectural Shapes): Proven ✅
- Pattern-073 (Documentation-Asserted-Behavior Drift): Emerging — **Proven window closes May 30**
- #1087 SEC-JWT-SECRET-PROD-GUARD: filed (production risk — jwt dev key when env unset)
- #1090 UI gap cohort: role inputs due **May 20 EOD**; CXO synthesis **May 22**
- Piper Alpha MCP/plugin PoC: in progress (build-less-first)
- PDR-005 v0.3 (BYOC): in flight (Architect + CXO)
- Worktree-default: standing policy + enforcement hooks live ✅
- Two-tier context hooks (90% + PreCompact): live ✅
- *The Family Resemblance*, *Before You Go*, *Audit and Talk*, *The Inchworm Position*: all published ✅

**Klatch:**
- Opus 4.7: default ✅; SDK 0.95.1 ✅
- June 15 deprecation: **zero exposure confirmed** ✅ (no action required)
- Iris sessions 9–11: complete ✅ — 1.0 critical path defined; vocabulary V1–V5 resolved
- Tier 1+2 patches: in progress (Daedalus)
- Next design gate: composition gesture (Iris + xian)
- Dreaming D1–D5: pending (D1 load-bearing; D5 gates on PM's PA spike)
- *Before You Go*: published ✅; OG/Twitter Card backfill across 7 canonical posts ✅
- F6.3 / F6.5 / F7.4: open (import asymmetry; composition gesture; Claude Code import fragmentation)
- Argus pre-curation step: documented, not yet formalized as sweep prompt

**Cross-pollination:**
- Weekly Digest trigger: nominal this run
- 9 repos in constellation (primary: Klatch, PM, hub; secondary: 6 fast-checked daily)
- Sweep auto-disable incident May 13–14 (GitHub auth lapse) — briefs May 14–15 backfilled May 16
