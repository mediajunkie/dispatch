# Current Week Intelligence Brief: April 27–May 3, 2026

**For:** In-session context (paste into chat as knowledge base)

---

## This Week at a Glance

The week's arc runs between two completions and two beginnings. PM closed a months-long arc — Phase A→F, ethics enforcement live as of April 30 — and Klatch closed the canonical-format circle: `/import/klatch` ships, making the format bidirectional for the first time (1203 tests, zero failures). Both completions immediately generated the next layer of work. PM began M2d implementation, ran an audit-cascade that caught two issues carrying stale "pending discovery" framing long after the discovery had completed, and restructured them before a single line of implementation code ran. Klatch began a formal two-pass UX walkthrough with xian and found the composition gesture — the central act of the product — missing from the UI. On the methodology side, the Pattern-062/063/064 architectural-debt family reached completion, Methodology-24 (Branch-or-Anchor) and -25 (Workstream Review Cadence) were formally filed, and CT v2.3 embedded Branch-or-Anchor as a self-protective rubric section. PM also shipped three publications across three distinct tracks. The through-line: at this stage, completions reveal the next problem rather than a done state, and the tooling (audit-cascade, AAXT, the verify-before-assuming discipline) is catching those problems before they propagate.

---

## Key Discoveries

**Phase F activated; alpha catch-22 named and resolved.** `ENABLE_ETHICS_ENFORCEMENT=true` merged to PM production April 30 (CEO directive), closing #992 after the full Phase A→B→C→D→E→#1002/#1003→#1004→Phase F arc. The final unlock was naming a paradox: the April 28 AUTHORIZE-WHEN-OBSERVED posture required real production traffic for calibration, but PM is pre-release. Waiting was waiting for data that doesn't exist. PM directed a simulation-first reframe — Phase A: synthetic input population via Gemma generator (grounded in the run-2 probe set: 18/20 PASS, 112/112 ethics suite); Phase B: beta-traffic refinement post-onboarding; Phase C: stable. ADR-061 v1.0 is architecturally complete: three-way detector discriminator (`literal-trigger | semantic | none`), measured latency replacing estimates (p_avg 3.2s, p_max 4.9s uncached), `fast_path_hit` and `cache_hit` added. Awaiting PM formal ratification. Lead Dev's self-flag, entered as permanent memory: "When 'where does this data come from?' = 'real users' AND we are in alpha, surface that immediately."

**Klatch canonical format goes bidirectional.** `/import/klatch` shipped Round 31+31b (45 new tests, 1203 total, zero failures). Design: idempotent by canonical UUID across project, channel, entities, files; `409 + forceImport=true` semantics (fork under fresh UUID, original preserved); source preservation (`claude-code / claude-ai / klatch` stamped correctly); reflections recovered via `field_notes` entries. MCP × import parity verified: `assembleChannelManifest` output re-imports identically to the HTTP-export path. Two open spec questions are non-blocking pending xian input: `format_version` gating on import (permissive today; Daedalus leans gate it) and empty `entities: []` auto-attach behavior. Round-trip claim is now honest without hedging.

**Pattern-062/063/064 architectural-debt family complete.** All three patterns name the same root cause — integration pass missing — at different layers:

| Pattern | Layer | Failure Mode |
|---------|-------|--------------|
| 062: Assembly Assumption | Component | Integration at the seams — parts work, whole doesn't |
| 063: Parallel-Authoring Drift | Vocabulary | Same label, different semantics under independent extension |
| 064: Extension Without Integration | Extension | New feature added without an integration pass |

Pattern-064's reference instance: BoundaryEnforcer #197 substring detector recall gap — PERSONAL/DATA_PRIVACY had zero recall, HARASSMENT near-zero, because the feature shipped without an integration pass. The three-family diagnostic is fast: do the seams work? (062), do collaborating agents mean the same thing by every label? (063), does the new extension connect correctly to everything it should touch? (064).

**Audit-cascade catches discovery-phase staleness.** PM ran audit-cascade on four M2d MUX Lifecycle issues before writing gameplans; gate NOT PASSED on first read. Two issues (#707, #714) carried "TBD pending discovery" framing from March; the referenced discovery completed 2026-03-24 — over a month prior. The decisions existed in `insight-surfacing-rules.md`, `objects-catalog.md`, `views-objects-roadmap.md`; the issue bodies had never been updated. Implementing from stale bodies risked: flattening three distinct insight-surfacing modes (Pull/Passive/Push) into one ticket; treating staleness as a lifecycle stage; ignoring a Stage 3+ trust gate on Push mode. A third issue (#703) had a silent omission: the COMPOSTED experience phrase — the most distinctive MUX UX concept — wasn't in acceptance criteria, meaning MVP could ship DEPRECATED→ARCHIVED without ever rendering it. Restructure: four new focused issues (#1030 MUX-INSIGHT-PULL, #1031 MUX-INSIGHT-PASSIVE, #1032 MUX-INSIGHT-PUSH, #1033 MUX-COMPOSTED-EXPERIENCE), #707 reframed as tracking parent, #714 rewritten, new conceptual-integrity gate added to M2d completion criteria.

**Klatch UX walkthrough: composition gap confirmed, 12 findings across two surfaces.** Iris and xian began a formal two-pass walkthrough (Pass 1: surface skim across 8 surfaces; Pass 2: realistic scenario). Session paused after Surfaces 1–2 with 12 specific findings and two cross-cutting patterns: (1) typography is small and low-contrast throughout; (2) functional artifacts surviving early development (anchor instance: default system prompt "You are a helpful assistant" rendered as a visible header, never revisited). Structural findings: the sidebar reads as "list of chats" (Slack pattern-match; distinctive Klatch concepts not communicated); Import is buried in a footer grab-bag alongside dark mode toggle. xian's largest finding: there is no UI path for composing a klatch from existing entities — the central job-to-be-done of the product has no surface. Classified as a capability gap, not a polish gap.

**#1018 Phase 2 ships: audit_transparency durable PostgreSQL storage.** `EthicsAuditRepository` backed by `ethics_audit_log` table (4 indexes, 6 repo methods) replaces in-memory list. Cluster regressions closed together: #1006 (TIMESTAMPTZ/timezone-aware tests), #1007 (phone PII pattern added to redactor — prior pattern matched SSN 3-2-4 format, missed common 3-3-4 phone format), #1008 (AsyncMock vs Mock for awaitable calls). `EthicsAuditCleanupJob` ships with post-#948 cancellation hygiene. Architecturally notable: Q2 transaction-boundary isolation — `AsyncSessionFactory.session_scope()` called per-audit-write rather than sharing the request's transaction; audit failure swallows without rolling back the user-facing request. Tradeoff named explicitly and verified by a dedicated test (`db_failure_does_not_propagate`).

**PM published across three distinct tracks.** "The Floor Comes Alive" (Medium, April 30) — Building Piper Morgan series installment #3; covers first Colleague Test pass (5/9→7/9 in two days); sharpest line: three characters in a model ID changed the experience from "a wall of canned text" to "an actual working conversation." Ship #040 "The Methodology Audits Itself" (pipermorgan.ai, April 29 — missed in prior briefs; published after the April 29 brief ran). "The Drift You Don't Notice" (pipermorgan.ai/blog, May 2) — PM's first `insight`-category post; topic: methodology erosion through imitation. PM now operates three distinct publication tracks: Ship newsletters (weekly operational cadence), Building Piper Morgan (Medium, long narrative arcs), and insight posts (standalone methodology observations).

**Operational automation shipped in one session.** `deliver-mail` (b1): walks `mailboxes/{role}/{inbox,read}/`, regenerates `MANIFEST.md` per directory atomically (temp+rename); SessionStart hook integration ensures every session-start refreshes all role manifests. Eliminates append-race duplicates. `merge-keeper-sweep.py`: automates daily branch hygiene — auto-merges branches that are wrapped (>24h old) and clean (no sensitive patterns, no >1MB blobs, no conflicts); escalates everything else. Default dry-run; `--apply` to execute. The branch-discipline synthesis v1.0 (five rules, sign-off checklist, mailbox rename to `mailboxes/xian (ceo)/`) published as a canonical CLAUDE.md section.

---

## What PM Should Know

- **Phase F is live.** Calibration proceeds simulation-first: Phase A synthetic inputs are grounded in the run-2 probe set and ship with the flag flip. ADR-061 v1.0 awaits PM formal ratification — all six review findings are folded in.
- **M2d implementation is guarded.** Four stale issues restructured before any gameplans were written; conceptual-integrity gate now in `m2-structure.md`. The pattern for M2d and future milestones: run audit-cascade against issue bodies before writing a gameplan, not after.
- **Ship #041 solicitation is open.** Exec proposed folding the April 17 IAC conference talk ("Ethics as Information Architecture," Philadelphia) into the narrative: the April 24–30 arc made the talk's claims operational in code. Window closes shortly.
- **Klatch's composition gap finding is relevant to any "bring agents or context into a room" UX.** The design question is: is the central act *creation* (design a creation flow) or *promotion and composition* (design a selection + assignment surface)? The Klatch experience is a direct precedent for what falls through the gap when composition isn't explicitly designed as the primary surface.
- **Transaction-boundary posture should be named at design time.** PM's Q2 choice (audit sidechannel swallows failure silently) is appropriate for audit infrastructure but not for primary-path writes. Any new durable storage should declare its posture explicitly.

---

## What Klatch Should Know

- **Canonical format is bidirectional; two spec questions pending xian input** (format_version gating; empty entities auto-attach). Non-blocking. Iris UX input on UUID-matching shapes for claude.ai/claude-code re-imports is also pending.
- **UX walkthrough: Surfaces 3–8 + Pass 2 still pending.** Working doc is `docs/ux/walkthrough-findings.md`. MAXT round-trip testing queued after the walkthrough. Resume planned for the week ahead.
- **Sonnet 4 / Opus 4 retirement: 47 days to June 15 as of April 30.** DB audit for live channels pinned to literal model IDs is still pending for Daedalus. Also pending: `xhigh` effort enum (one-line schema addition for Opus 4.7 full capability); SDK bump from 0.86.1 → 0.90.0 to confirm thinking-opt-in API available before any "show thinking" UI ships.
- **Calliope PO calibration response is time-sensitive.** The relay opened April 26 with a 5–7 day window; as of May 4 that window has closed. DRAGONS named two patterns (explicit placeholders over fabrication; audience segmentation as a hard rule), CoS named one (source-check comparative claims; reviewer-vs-author distinction). The response should name which apply to Klatch and which patterns Klatch generates that the others haven't named.
- **Branch-discipline synthesis v1.0** from PM's parallel operation has two additions not in Klatch's CLAUDE.md: (a) per-memo commit-and-push norm (each memo write is its own commit + push cycle, ~30s overhead, eliminates asymmetric-visibility windows); (b) designated merge-keeper sweep as a standing safety net for anything stranded. Both are low-cost additions that close known failure modes.

---

## For Both Teams

**Source-verification before implementation is the week's sharpest recurring discipline.** "The Drift You Don't Notice" named methodology erosion through imitation — implementing from yesterday's artifact while the current source doc sits unused. The M2d audit-cascade simultaneously caught #707 and #714 as live instances: both were drifted copies of earlier thinking, never updated when the source spec moved. Argus's intel sweep verification (read the actual implementation file before treating a trade-press advisory as a live threat) is the same discipline at a different scale. Three angles on the same root: return to the current source, not yesterday's copy.

**Completion reveals the next layer, not the done state.** Both projects' milestone moments this week (Phase F live; `/import/klatch` ships) were followed immediately by new work surfacing — not by rest. This is a design property of the methodology, not a planning failure. The appropriate response is to treat the next layer as expected, not as scope creep.

**The alpha catch-22 is now a named pattern.** "Wait for real-traffic calibration" fails when the product is pre-release and the traffic doesn't exist yet. Simulation-first (synthetic input population grounded in existing probe methodology) is the viable alternative. Name the dependency at design time.

**Audit telemetry should distinguish three enforcement outcomes from day one.** PM's #1003 resolution and the `"none"` detector value in ADR-061 together establish the taxonomy: (1) explicit boundary trigger (`boundary_type` + `blocked_by_ethics: true` in audit envelope); (2) floor-routed-to-guidance (GUIDANCE intent, no boundary fields); (3) floor-fires-but-no-detector (`detector: "none"` — the floor is load-bearing independent of any detector layer). Retrofitting discriminators after operators are relying on the audit shape is the harder path.

---

## Status Flags

**Klatch:**
- Canonical format bidirectional: 1203 tests, zero failures ✅
- UX walkthrough: Surfaces 1–2 documented (12 findings); Surfaces 3–8 + Pass 2 pending
- MAXT round-trip testing: queued after walkthrough
- Sonnet 4 / Opus 4 retirement: **June 15 — DB audit for literal model ID pins still open**
- Calliope PO calibration response: **overdue (window was 5–7 days from April 26)**
- Branch-discipline additions (per-memo commit norm, merge-keeper sweep): not yet in CLAUDE.md

**Piper Morgan:**
- Phase F live: ENABLE_ETHICS_ENFORCEMENT=true ✅
- ADR-061 v1.0: architecturally complete; **awaiting PM formal ratification**
- #1018 Phase 2: durable audit storage shipped ✅; cluster regressions #1006/#1007/#1008 closed ✅
- M2d: four stale issues restructured; four new focused issues (#1030–#1033) filed; conceptual-integrity gate added ✅
- **Ship #041: solicitation open, window closing shortly**
- Three publications shipped this week across three tracks (Ship #040, "The Floor Comes Alive," "The Drift You Don't Notice")

**Cross-pollination:**
- 9 repos in constellation (primary: Klatch, PM, hub; secondary: 6 repos fast-checked daily)
- 7 delivery readers
- Trigger config: all four triggers confirmed with `allow_unrestricted_git_push: true`; Sweep Apr 29 transient abort recovered; no recurrence
