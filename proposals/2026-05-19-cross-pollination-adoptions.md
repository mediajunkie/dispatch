---
title: Cross-pollination adoption proposals — six innovations from PM + Klatch
date: 2026-05-19
author: Dispatch-Kind
purpose: Six adoption candidates surfaced from the 5/16–5/19 cross-pollination briefs. Each is sized for an individual decision (accept / adopt-with-modification / defer / skip). Work through them one at a time per xian's preference.
status: open — no decisions yet
---

# Cross-pollination adoption proposals — 2026-05-19

Six innovations from the PM and Klatch sibling projects, surfaced in the 5/16–5/19 cross-pollination briefs. Each below is decision-ready: what it is, what it would change on our side, effort, risk, DK's prior. Items ordered by leverage-vs-cost (cheapest highest-leverage first); take them in any order you like.

## Summary table

| # | Proposal | Cost to adopt | Leverage | DK prior |
|---|----------|---------------|----------|----------|
| 1 | `safe-push.sh` wrapper for non-fast-forward retry | small (≈30 min) | high — eliminates a recurring failure mode | **adopt** |
| 2 | `pre-commit-broad-staging-warn.sh` hook | small (≈30 min) | medium — prevents a class of incidents we've had | **adopt** |
| 3 | Pattern-073 awareness + `doc-sync-sweep` skill | medium (≈2 hr methodology import + skill scaffold) | high — substantial Pattern-073 surface in OpenLaws workdesk | **adopt-with-scope** |
| 4 | Move closed mail to `mail/read/` discipline | small (one-time ≈1 hr + ongoing) | medium — visibility on what's still in flight | **adopt** |
| 5 | `worktree.bgIsolation: "none"` for Code tasks | tiny (config flag) | low–medium — simpler Code-task spawning | **adopt-with-validation** |
| 6 | Anthropic June 15 billing-split awareness | tiny (just surface) | situational — pricing-discussion input for John | **surface to John, no DK action** |

---

## 1. `safe-push.sh` wrapper — non-fast-forward retry

**Source:** PM shipped `scripts/safe-push.sh` on 2026-05-15, codified in the 2026-05-16 cross-pollination brief. Wraps `git push` with auto-retry on non-fast-forward via `stash → fetch → rebase → retry`. Handles the "push fails because another agent pushed mid-flight" case without manual intervention.

**Why for us:** today I had two Code tasks hit this exact failure mode (one on dispatch, one on openlaws). Each required either a manual rebase-and-retry in the Code task or a follow-up push-arm cycle. Both repos have multi-agent commit activity that produces non-fast-forward pushes routinely.

**What changes:**
- Lift PM's `scripts/safe-push.sh` into `dispatch/scripts/safe-push.sh` and `openlaws/scripts/safe-push.sh` (each repo gets its own copy, per the family-resemblance convention)
- Update DK scheduled-task SKILL.md so the osascript push step calls `safe-push.sh` instead of raw `git push`
- Optional: install as a git alias `git safe-push` for interactive use

**Effort:** ≈30 minutes to lift, adapt, test. Idempotent script; low risk of regression.

**Risk:** the auto-rebase could mask a genuine merge conflict that needed human attention. PM's script handles this by aborting on conflict and surfacing; verify ours does the same when adapting.

**DK prior:** adopt. This is the most directly-painful gap on our current setup.

### Status: ADOPTED — 2026-05-20

Lifted from PM `scripts/safe-push.sh` (commit 04a86ef6, 2026-05-15) under the family-resemblance convention. Installed at:
- `dispatch/scripts/safe-push.sh`
- `openlaws/scripts/safe-push.sh`

**Adaptation:** dropped `-u` from `git stash push` to respect this repo's shared-checkout discipline (PM's original sweeps untracked files; we don't, per CLAUDE.md). All other semantics preserved.

**Documentation:** `dispatch/standards/SAFE-PUSH.md` covers usage, exit codes, failure modes, and the rationale for the `-u` removal.

**SKILL.md integration:** DK scheduled-task SKILL.md files (`dinp-daily-memo`, `dinp-inbox-check`) will be updated next to call `./scripts/safe-push.sh origin main` instead of raw `git push`. This will be tested on the next scheduled-task fire.

**Tested:** bash syntax check passed on both copies. First real-world push (landing this script + standards + status update) used the script itself as a self-test.

---

## 2. `pre-commit-broad-staging-warn.sh` hook

**Source:** PM shipped this 2026-05-15 alongside the worktree-default policy elevation. Warns when a single commit sweeps 3+ mailbox roles, 20+ files, or 2+ role-slug session logs simultaneously. That combination is the signature of a staging-race accident.

**Why for us:** the OpenLaws CLAUDE.md cites a 5/04 stash-sweep incident as the precedent for the "pre-destructive-op + pre-commit checklist" discipline. That incident is *exactly* the failure shape this hook catches. Even with the human-side discipline, a mechanical guardrail is the right complement. We've also had the multi-agent shared-checkout commits eat each other's work multiple times.

**What changes:**
- Install `scripts/hooks/pre-commit-broad-staging-warn.sh` in both `dispatch` and `openlaws`
- Hook into `.git/hooks/pre-commit` (or a `pre-commit` framework if one is already used; check first)
- Hook is a warn, not a hard-block — exits 0 with a prominent message rather than aborting the commit. Lets the agent decide; provides the alert.
- Calibrate thresholds for our repo shapes (PM's 20-file threshold may be too high or too low for OpenLaws's typical workdesk-write rate)

**Effort:** ≈30 minutes to install + calibrate. Per-repo.

**Risk:** false positives on legitimate broad commits (e.g., a deliberate rename across many files). Mitigated by warn-not-block behavior.

**DK prior:** adopt. Worth the small overhead even if the trigger fires rarely.

### Status: ADOPTED — 2026-05-20

Lifted from PM `.claude/hooks/pre-commit-broad-staging-warn.sh` (commit 04a86ef6, 2026-05-15) under the family-resemblance convention. Installed at:
- `dispatch/scripts/hooks/pre-commit-broad-staging-warn.sh` + `dispatch/.git/hooks/pre-commit` symlink
- `openlaws/scripts/hooks/pre-commit-broad-staging-warn.sh` + `openlaws/.git/hooks/pre-commit` symlink
- `dispatch/scripts/install-hooks.sh` + `openlaws/scripts/install-hooks.sh` — setup script for new clones to install the symlinks
- `dispatch/standards/PRE-COMMIT-HOOK.md` — usage, thresholds per repo, install procedure, lift provenance

**Adaptations per repo** (PM uses `mailboxes/<role>/` directory structure that we don't have):
- **Dispatch:** detects author prefixes in `mail/` filenames (`memo-dispatch-<role>-to-...`); threshold 2 distinct dispatch authors OR 15 total files. Uses awk for extraction (BSD sed alternation is unreliable).
- **Openlaws:** matches known agent slugs in any staged path; threshold 3 distinct slugs OR 20 total files OR 2 distinct session-log authors in `logs/`.

**Tested 2026-05-20:**
- No-warn case (single author, few files) — exit 0
- Warn case dispatch (2 authors in mail/) — exit 2, formatted warning ✓
- Warn case openlaws (3 distinct slugs) — exit 2, formatted warning ✓
- Warn case openlaws (2 session-log authors) — exit 2, formatted warning ✓
- Empty index — exit 0

Warn-mode (exit 2), not block. Bypass on a specific commit with `git commit --no-verify` after verifying. Bug found and fixed during testing: BSD sed `-E` doesn't handle `(memo|signal)` alternation reliably; rewrote that path with awk.

---

## 3. Pattern-073 awareness + `doc-sync-sweep` skill

**Source:** PM filed Pattern-073 (Documentation-Asserted-Behavior Drift) on 2026-05-16 with 6 instances across 5 surface layers; promoted to Proven on 2026-05-18 with 13 instances across 10 layers. The recognition trigger is *"present-tense assertion about a named code surface, not auto-generated from that surface."* Verb tense + quantifiers are the leading surface cues ("always", "handles", "all routes"). Filed alongside: `.claude/skills/doc-sync-sweep/SKILL.md` v0.1 — after code-shipping commits, identify likely-affected narrative surfaces and audit each for drift.

**Why for us:** OpenLaws workdesk material has substantial Pattern-073 surface. Concrete examples:
- The Surveyor SKILL.md asserts MCP tool behavior, citation formats, and API response shapes that the actual code may have drifted from
- The PRD and PRD reviews have many "the tool does X" claims
- The install guides (`install-guide-{chat,cowork,code}-2026-05-11.md`) assert specific menu paths that Anthropic UI updates may have shifted
- The install-paths matrix I delivered today asserts UI flows that aren't auto-generated from the actual UI
- The submission-forms recon asserts the form has N fields and certain wording — captured from observation, not auto-generated

We don't catch this drift today.

**What changes:**
- Scope decision: import the *pattern recognition* (cheap; just a methodology note in `standards/`) without necessarily importing the *promotion machinery* (PM's filing/Emerging/Proven workflow; heavier)
- Lift the `doc-sync-sweep` skill scaffold into `~/.claude/skills/doc-sync-sweep/` (DK-side) or into the openlaws repo as a project skill
- Apply the sweep as a session-end discipline for Vergil and DK after any significant workdesk write
- Optional v2: schedule a weekly `doc-sync-sweep` on openlaws/workdesk in the same fashion as the merge-keeper sweep

**Effort:** methodology note ≈1 hour; skill scaffold ≈1 hour; first sweep run ≈2 hours (to cover the existing OpenLaws workdesk surface). Total ≈4 hours but spreadable.

**Risk:** the skill could surface drift faster than we can fix it, producing a backlog. Mitigate by starting with the highest-stakes surfaces (Surveyor SKILL.md, install guides) and treating others as a slow burn.

**DK prior:** adopt-with-scope. Bring in the recognition pattern + the skill scaffold; don't import the full PM methodology framework. Run the first sweep over Surveyor SKILL.md as a focused pilot before committing to broader cadence.

---

## 4. Move closed mail to `mail/read/` discipline

**Source:** Klatch adopted this on 2026-05-18 as one of three coordination disciplines. Calliope moved 151 pre-today mails to `docs/mail/read/` in one go, and codified the close-immediately norm: when a thread closes, move the file to `read/` at the moment of closing rather than letting `mail/` accumulate.

**Why for us:** our `dispatch/mail/` has been growing undifferentiated. There are 40+ DinP↔DK files there, plus the recent OpenLaws-side proxies. Closed threads sit alongside open ones; the only way to know what's still in flight is to read every file. A `read/` subdirectory turns the active-mail audit into an O(1) listing of `mail/*.md` rather than O(N) close-state-checking.

**What changes:**
- Create `dispatch/mail/read/` (subdirectory)
- One-time migration: move all clearly-closed threads to `read/`. Definition of "clearly closed": (a) signal has a `## Acknowledged` block; (b) ack memo exists from the other side with matching subject; (c) daily memos older than 7 days
- Update the inbox-check SKILL.md to (i) only scan `mail/*.md` (not recursive), (ii) move threads to `read/` immediately after writing an ack
- Update DinP-side SKILL.md? — needs DinP buy-in since she also writes to `mail/`. Propose to her via signal first.

**Effort:** one-time migration ≈1 hour. Ongoing: zero (just a `mv` in the close discipline).

**Risk:** if migration is too aggressive, a still-open thread gets moved to read/ and looks closed. Mitigate by being conservative on first pass (only move things explicitly acked or 14+ days old).

**DK prior:** adopt. Worth proposing to DinP first since the directory is shared; she may have a different preference for the close criterion.

---

## 5. `worktree.bgIsolation: "none"` for Code tasks

**Source:** Claude Code 2.1.143 (shipped 2026-05-15, surfaced in Klatch's 2026-05-18 external scan). Adds a new config option `worktree.bgIsolation: "none"` — allows background sessions to edit the working copy directly without `EnterWorktree`. Relevant to CCR environments where worktrees may be impractical.

**Why for us:** every Code task we spawn today goes through worktree isolation by default. Per `feedback_audit_destructive_scripts.md` + the 5/04 stash incident, we explicitly tell Code tasks NOT to use worktree isolation when they need to push direct-to-main on operational mail. The current pattern is "remember to add `Don't use worktree isolation` to every Code-task prompt." Setting `worktree.bgIsolation: "none"` as a project-level config makes that the default for our use case and removes a class of forgetting-the-flag mistakes.

**What changes:**
- Add `worktree.bgIsolation: "none"` to project-level Claude Code config in both `dispatch` and `openlaws` (likely `.claude/settings.json` per existing convention)
- Audit existing memory notes about "don't use worktree isolation" — the warning becomes obsolete once the default flips
- Verify the option does what we expect on a small Code task before committing the config change

**Effort:** ≈10 minutes config + ≈20 minutes validation. Low.

**Risk:** the option name is recent (Claude Code 2.1.143, 4 days old as of today). May behave differently than the brief implies. Validate before committing.

**DK prior:** adopt-with-validation. Cheap to try; back out if it doesn't behave as expected.

---

## 6. Anthropic June 15 billing split — awareness surface for John

**Source:** Klatch external scan 2026-05-18. Anthropic announced 2026-05-14 that starting 2026-06-15, four surfaces will draw from a new "Agent SDK credit" budget at full API rates rather than from the Claude subscription: (a) Claude Agent SDK (Python + TypeScript), (b) `claude -p` headless mode, (c) official Claude Code GitHub Actions, (d) third-party apps built on the Agent SDK. Interactive use (Claude Code CLI, claude.ai, Claude Cowork) stays in the subscription. Credit caps: Pro $20, Max 5x $100, Max 20x $200. Credits do not roll over.

**Why for us:** doesn't change anything we currently do — Surveyor as plugin/MCPB doesn't ride the Agent SDK distribution surface. But it's relevant for John's pricing strategy decisions:
- If Surveyor ever ships as Agent SDK / programmatic distribution (e.g., a CLI tool that wraps the MCP for non-Claude consumers), users hit the new credit pool
- Pricing-tier conversations with prospective enterprise customers should know Anthropic-credit costs are now bifurcated; "use Claude" pricing depends on the use mode
- The four-path IA on the landing page (the "I build my own product" path) intersects this: developers using the Agent SDK to consume Surveyor are now subject to a separate credit budget

**What changes:**
- DK action: none — just surface
- Suggested for John: a one-line note in the pricing-strategy thread that Anthropic-credit costs are now split by use mode after June 15. Could be a brief signal from DK→John or from Piper Open→John (PO is closer to John's pricing work)

**Effort:** zero on DK side; one signal to John on PO side (defer to PO).

**Risk:** none.

**DK prior:** surface to John via Piper Open. No direct DK action.

---

## Process for working through these

Default: take them in any order. The summary table is roughly cost-ordered (cheapest highest-leverage first), but each is independently decidable.

For each: a green light from xian = DK takes the next step (drafts implementation PR, runs the pilot, opens the Code task). Modifications welcome. Red lights / "not now" land in the deferred bucket without prejudice; we revisit when conditions change.

I'll track decisions in this file by appending a `## Status` block per proposal as we work through them.

— Dispatch-Kind, 2026-05-19
