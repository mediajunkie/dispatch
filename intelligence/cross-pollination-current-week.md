# Current Week Intelligence Brief: April 13–19, 2026

**For:** In-session context (paste into chat as knowledge base)

## This Week at a Glance

The week's arc is one of convergent completion. Klatch moved from a behavioral calibration design discussion on Sunday morning to a live, tested MCP server by Friday — Phase 3.5 (three-mode behavioral field notes), Phase 4 (Claude Code and claude.ai export transports), and Phase 5a/5b (MCP resources and tools surface) all shipped and tested, 1069 tests, zero failures. PM moved from a testing infrastructure gap to a three-tier CI pipeline (E2E, canonical, AAXT, CI) in a single Lead Dev session, then closed M2c at 95.1% routing and 72.1% quality — a +9.8 point improvement from the M2a baseline. The week's deepest cross-project development happened on a single day: April 18, when Klatch shipped as an MCP server and PM and Klatch settled cross-producer protocol alignment in one exchange — URI schemes, shared tool name (`get_context_package`), and cheap-preview pattern (`/{id}/manifest`) all locked simultaneously. Both projects also added `DECISIONS.md` files on the same day. The theoretical context interchange protocol is now a working spec with shared conventions on both sides.

---

## Key Discoveries

**Klatch completes Step 10 in seven days.** The Phase 3.5 arc — open design questions to consensus to tested backend to export review UI — ran in 48 hours across four agents (April 13–14). The three extraction modes (external analysis, self-authored briefing, micro-reflections) merge at export time; a six-point handoff prompt covers any entity type without role-specific variants; trust transitions are explicit (draft → human-authored on accept). Phase 4 followed: the Claude Code transport (CLAUDE.md + MEMORY.md zip) and claude.ai transport (conversations.json + projects.json + memories.json) both shipped April 15, with Argus's Round 24 running a round-trip proof — the claude.ai export feeds cleanly into Klatch's own import pipeline. Phase 5 capped the sprint: April 18 brought five MCP resources (`klatch://channels`, `klatch://channels/{id}`, `klatch://channels/{id}/manifest`, `klatch://projects/{id}`, `klatch://entities/{id}`) and three tools (`list_channels`, `get_context_package`, `get_manifest`). One shared package builder is the single codepath for both HTTP export and MCP — no format drift is possible between them.

**PM's testing infrastructure and M2c both close.** PM's Lead Dev shipped the entire automated testing stack in one session: 9 E2E tests via ASGI transport, a two-tier canonical suite (61 queries: deterministic routing checks on every PR, LLM-as-judge quality nightly), five AAXT golden scenarios (4/5 PASS — the one failure is a genuine quality finding), and GitHub Actions CI (E2E ~90s, canonical ~8 min, AAXT nightly ~$0.50). M2c then closed with canonical retest Run 5 at 95.1% routing / 72.1% quality. The remaining quality gap to 80% traces primarily to fresh-account context: users with no projects or history can't receive anchored responses (Context=1 floor). M2d (MUX lifecycle) is next; fourteen follow-up issues organized by family are queued, none blocking.

**Cross-producer MCP alignment settled on April 18.** Three decisions resolved in a single exchange between Daedalus's memo and PM Architect's reply: URI scheme per producer (`klatch://`, `piper-morgan://`); `get_context_package` as the shared cross-producer tool name with producer-specific options and a canonical Phase 1 response envelope; `/{id}/manifest` as the cross-producer cheap-preview convention. These decisions are already pinned in Klatch's test suite. A multi-producer client can now call both servers with the same tool name and route by URI scheme — alignment at naming layer costs near zero when caught before either project ships.

**Ethics enforcement: wired since October 2025, switch off by default.** The `#964 FLOOR-ETHICS-VERIFY` audit closed April 16 with a P1 finding: `ENABLE_ETHICS_ENFORCEMENT=false` is the code default — not a config, not an env file. BoundaryEnforcer at `services/intent/intent_service.py:631` covers harassment / professional / inappropriate content patterns. It has never been active in production. CXO voice guidance for Mode-2 decline copy arrived the same evening, unblocking activation. `#992 ETHICS-ACTIVATE` is now implementation-ready: implement the decline voice layer, validate false-positive rate against canonical corpus (ceiling: 2–3%), flip the flag. CXO also introduced a Colleague Test Tone=0 auto-fail criterion — failure at the tone dimension auto-fails the full rubric, not MARGINAL.

**Entity reframe: entities are conversations promoted into roles.** During Iris's Phase 3.5d UX walkthrough, xian reframed the core mental model: entities are not abstractions you define in a manager, then assign to a channel. They are existing conversations that develop into working relationships, then get promoted. A klatch is a meeting of existing chats, each with full context — not a new conversation with pre-configured personas. This inverts the primary UX flow (promotion first, creation second) and has direct implications for how Klatch's import-to-export arc is described. For PM: the MCPB distribution model read through this lens means the install isn't "here are pre-configured agents" but "here is a conversation that becomes your PM assistant as you use it."

**Pattern-062 named as a diagnostic step.** PM's canonical retest (Run 5, 72.1%) showed Identity queries stalled at MARGINAL despite tone work landing. Per-dimension analysis: Context=1 on 4 of 5 Identity queries — the same signature as Temporal queries before `#951`. The diagnosis: `_gather_identity_context` supplies only global capabilities data; nothing anchors to the specific user (stated projects, recent topics, trust stage). The fix extended the assembler, not the prompt. Pattern-062 is now a named diagnostic: when a judge scores Context=1 consistently for a category, the assembler is the suspect, not the prompt tone. Fix the data before adjusting the language. Calliope routed this to Argus for formal encoding in the AAXT diagnostic protocol.

**Evaluation instrument taxonomy settled.** Three decisions landed April 16 evening from CXO review of cross-pollination inputs: (1) PM's AAXT scorer adopts the six-failure-mode vocabulary (Correct, Reconstructed, Confabulated, Absent, Phantom, Subliminal) — filed as `#994`; (2) standalone fabrication probe set (5–10 probes, 5 absence categories) as a separate regression instrument for the `#960` guardrail — filed as `#995`, CXO-endorsed; (3) Colleague Test rubric stays three-dimensional (R/C/T) — no fabrication dimension added. Fabrication and conversational quality are orthogonal failure modes requiring distinct instruments. Mixing them degrades diagnostic resolution.

**Ghost IDE settings as multi-agent codebase hazard.** PM's `#981` (spurious import re-insertion during iterative edits) traced to a repo-tracked `.vscode/settings.json` with `editor.formatOnSave: true` scoped globally and `python.linting.pylintEnabled: true` for an uninstalled linter. The pre-commit stack (black, isort, flake8) was not the cause — none add imports. The IDE was silently reformatting on save, and because the settings file is tracked, every contributor's VSCode/Cursor session was affected. Fix: scope `formatOnSave` to `[python]` only, disable source actions. As part of the same session, consolidated to a single ruff hook — caught a test file with literal `from,` and `import,` in its import list that had silently passed flake8 for months.

**DECISIONS.md added to both repos on the same day.** Klatch and PM independently added `DECISIONS.md` append-only indexes (format: `DATE | DECISION | PARTICIPANTS`) on April 18. Stated motivation on both commits: anti-zombie brief checks — giving the daily sweep machine-readable decision history to scan. Klatch's file has six entries (April 10–17); PM's has four. This is a convergent infrastructure move.

---

## What PM Should Know

- **`#992 ETHICS-ACTIVATE` is implementation-ready.** The acceptance criteria are fully specified: decline voice layer from CXO, canonical false-positive validation (≤2–3%), then flag flip. The Colleague Test Tone=0 auto-fail criterion from CXO affects scoring across all rubrics, not just ethics probes — flag for any agent running AAXT or Colleague Test evals before the next run.
- **M2c closed: 95.1% routing, 72.1% quality, M2d next.** The 72.1% ceiling is primarily a fresh-account anchoring problem (`#989`) — users with no projects or history get Context=1 by default. Fourteen follow-up issues from M2c are filed and organized by family (context assembler, ethics, LLM infrastructure, testing, hygiene); none block M2d start.
- **Evaluation instruments are now settled.** AAXT scorer uses six-failure-mode vocabulary (`#994`). Fabrication probe set is a standalone instrument (`#995`), not a Colleague Test dimension. Proceed with implementation on both.
- **Klatch's MCP surface is live.** Cross-producer alignment is settled: `piper-morgan://` URI scheme, `get_context_package` shared tool name, `/{id}/manifest` preview pattern. PM's MCP server design should confirm these before its own Phase 5 equivalent exits. The Klatch Phase 5 design doc (`STEP-10-PHASE-5-MCP-SERVER.md`) has the full surface spec for comparison.
- **Probe coordination offer from Klatch is pending.** Calliope routed a coordination offer to Argus: do PM's `#995` absence categories align well enough for a shared probe set? If PM Lead Dev receives a short memo via dispatch mail on this, it warrants a response. Category label alignment (even without shared probes) enables cross-project result comparison.
- **Pattern-062 is now a named diagnostic.** Before adjusting prompt language for any persistently low-scoring dimension: check per-dimension Context scores in the judge output. Context=1 consistently signals assembler gap, not tone. The fix is always assembler extension first.
- **Quality ladder cross-project memo from Argus/Klatch is expected.** Phase 1 (Ollama + comparison run) is scoped for this week. The evaluation protocol (N=10–20 paired outputs, blind review, agreement rate ≥80%, failure rate ≤10%) is directly applicable to PM's LLM-dependent functions (floor routing, DeepEval scorer, composting pipeline). Reserve a slot for the memo when numbers arrive.

## What Klatch Should Know

- **Step 10 is complete through Phase 5b.** 1069 tests, zero failures. The export path (HTTP + MCP) uses one shared package builder — format integrity across both consumers is structural. Phase 5c (prompts + `reflect` write-path) is tentative pending post-5b decision. HTTP transport (5d) is deferred past 1.0 with no blocking use case.
- **Cross-producer alignment is locked.** URI scheme `klatch://`, tool name `get_context_package`, manifest pattern `/{id}/manifest` — all pinned in tests. PM Architect has confirmed. A cross-producer test calling both servers by name is the concrete interop proof when PM's server surface is ready.
- **Pattern-062 should be a formal AAXT diagnostic step.** Calliope routed this to Argus: before adjusting prompt language for a persistently low-scoring dimension, ask "is the context assembler providing what this category needs?" This applies directly to Tier 3–5 evaluations where thin assembly masquerades as tone problems in handoff briefings and entity conversations.
- **Confirm six-failure-mode vocabulary in AAXT scorer.** PM adopted it as `#994`. A quick scan of the current AAXT scorer spec — are all six modes (Correct, Reconstructed, Confabulated, Absent, Phantom, Subliminal) named and enforced? If not, file the gap. If yes, note as confirmed so the cross-project brief can stop tracking it.
- **Decide on probe coordination this week.** Calliope's offer is in the loop: do Klatch's absence categories (file, entity, memory, history, channel absence from the AAXT fabrication probe class) and PM's `#995` categories align well enough for shared category labels? Even a short note back to Calliope closes the loop. The brief is tracking both `#994` and `#995`.
- **Behavioral guardrail state should be checkable at a glance.** PM's ethics finding (wired since October, switch off by default) applies as a general discipline: any behavioral gate (content shape, response scope, floor prohibitions, not just ethics) should have its on/off state visible as a named variable — not implicit code behavior. Track this as Klatch entity conversations and outbound response surfaces mature.
- **Local model Phase 1 numbers expected soon.** Ollama + Gemma 4 26B comparison run is scoped for this week. When actual numbers land, a cross-project memo to PM Architect and Lead Dev is the agreed next step.

## For Both Teams

**The context interchange protocol is now a working spec.** "Context interchange" was a phrase in a futures memo three weeks ago. As of April 18, it has shared URI schemes, a shared tool name with a canonical response envelope, and a shared cheap-preview pattern — both sides tested and confirmed. The Managed Agents bootstrap path (export from Klatch → seed Memory Stores → create Agent with role prompt → start Session with seeded stores) is no longer theoretical. When PM's MCP server surface exits, a two-producer client test is the concrete interop proof.

**The cold-start / fresh-account ceiling is a shared structural problem.** PM's 72.1% quality ceiling traces to users with no projects or history — Context scores floor at 1 when the assembler has nothing to anchor on. Klatch's Alpha tester work surfaced the same gap: high-quality responses require anchoring context, but new users have none. Both projects need a channel bootstrapping / user-anchoring strategy for day-one sessions. Comparing approaches before either project commits to an implementation would be useful.

**Convergent infrastructure is a signal worth reading.** DECISIONS.md added independently to both repos on the same day. The six-point handoff prompt designed as universal (Gall's Law: one prompt, see if it works). The `known_pathological` category added to both test suites from different directions. These convergences are not coincidence — they reflect both teams running the same operational discipline and arriving at the same structural need. When this happens, the brief will name it explicitly.

---

## Status Flags

**Klatch:**
- Phase 5a/5b complete: live MCP server, 1069 tests, zero failures
- Phase 5c (prompts + `reflect` write-path) tentative, pending decision
- HTTP transport (Phase 5d) deferred past 1.0, no blocking use case
- Local model Phase 1 (Ollama + comparison run) in progress this week
- Cross-producer alignment locked: `klatch://`, `get_context_package`, `/{id}/manifest`
- DECISIONS.md added April 18 (six entries, April 10–17)
- **Probe coordination response to Calliope — open, this week**
- **Pattern-062 formal encoding in AAXT diagnostic — open, Argus**
- **Six-failure-mode vocabulary confirmation in AAXT scorer — open, Argus**

**Piper Morgan:**
- M2c closed: 95.1% routing, 72.1% quality (+9.8 points from M2a baseline)
- M2d (MUX lifecycle) is next; 14 follow-up issues filed, none blocking
- `#992 ETHICS-ACTIVATE` implementation-ready; CXO voice guidance received
- Three-tier CI pipeline operational (E2E ~90s, canonical ~8 min, AAXT nightly)
- `#994` (AAXT six-failure-mode vocabulary) and `#995` (standalone fabrication probes) filed and CXO-endorsed
- DECISIONS.md added April 18 (four entries)
- Ruff migration complete; `.vscode/settings.json` IDE ghost settings resolved
- Gemini wired as real primary/fallback provider in LLMClient
- **`#992 ETHICS-ACTIVATE` — P1, next in queue**
- **Local model quality ladder cross-project memo — pending Klatch Phase 1 numbers**

**Cross-pollination loop:** Active. Briefs generating daily. OpenLaws removed as a cross-pollination source (data boundary, April 15). Two sources operational (PM, Klatch). Weekly digest at this file.
