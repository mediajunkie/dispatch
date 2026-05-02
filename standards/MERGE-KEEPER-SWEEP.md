# Merge-Keeper Sweep — Cross-Repo Discipline

**Status:** v0.1 — drafted 2026-05-02 by Dispatch-Kind, after a hands-on proof-of-concept run on the openlaws repo. Lift-from PM's `scripts/merge-keeper-sweep.py` pattern (April 2026 PA branch-discipline synthesis v1.0).

**Applies to:** any repo with multi-agent feature-branch + PR + self-merge flow under a tightened-harness environment. Currently: `openlaws`, `dispatch`. Adoptable by `designinproduct` if useful.

---

## Why this exists

Multi-agent worktree-based development plus the harness's no-direct-push-to-main rule produces a structural pile of debris:

- **Empty branches** that were merged via PR but the branch never deleted on origin or locally
- **Stale worktrees** at `.claude/worktrees/<name>/` (or `/private/tmp/...`) pointing at empty branches
- **Stranded commits** on branches whose content reached main via a different SHA path (e.g., `git diff` discovers no unique files)
- **Genuinely stranded content** — branches whose work never made it to main and isn't in any PR

Without active maintenance, the pile grows and eventually masks the *genuinely* stranded items inside the noise. The sweep's job: prune the noise routinely so the genuine cases stay visible.

---

## Discipline shape

### What the sweep does

1. **Audit every non-main branch (local + remote)** in the repo. For each, classify:
   - **EMPTY:** zero commits not already on main (`git log main..<branch>` returns no commits)
   - **DERIVED:** unique commits exist, but every file in those commits is also on main via a different SHA path (audit each path against `git cat-file -e main:<path>`)
   - **STRANDED:** unique commits exist with content that is NOT on main
   - **LIVE-PR:** branch is the head of an open PR (skip — that's how it's supposed to look)

2. **Prune EMPTY branches automatically.** Local: `git branch -D`. Remote: `git push origin --delete <branch>`. Worktrees that pin EMPTY branches: `git worktree remove --force <path>` first, then delete the branch.

3. **Report DERIVED branches as "likely safe to delete; human review."** They might be safe (the PR landed; squash or rebase produced different SHAs) or might be a real stranded case my audit missed. Surface them; don't delete.

4. **Report STRANDED branches as "needs review."** Possible meanings: (a) work-in-progress on a side branch that hasn't merged yet; (b) genuinely orphaned content; (c) live PR I couldn't detect via `gh pr list`. Each requires human eyes.

5. **Leave LIVE-PR branches alone.** Detect by `gh pr list --state open --json headRefName --jq '.[].headRefName'` and skip those.

6. **Output a sweep report** summarizing: deleted local count, deleted remote count, worktree dirs removed, derived-needs-review list, stranded-needs-review list, branches remaining.

### Cadence

**Recommended starter:** weekly, run by any agent at session-open on Monday morning. Lower-cadence than PM's daily because OpenLaws's branch volume is lower; raise to daily if accumulation rate makes weekly feel late.

**Manual trigger** also fine: any agent who notices `.claude/worktrees/` getting busy can run the sweep.

### Owner

**Designated runner pattern (PM's model):** one agent named as merge-keeper for the repo, runs the sweep on its cadence, files the report. For OpenLaws, DK is the natural fit since DK is the coordinator-by-role.

**Backup:** any agent with the script can run it. The script is idempotent — running twice is a no-op on the second run.

### Scope

- **Sweep operates on one repo at a time.** Branch politics differ per repo; don't cross-pollinate. (PM has its own merge-keeper-sweep; OpenLaws has its own; etc.)
- **Sweep does not touch main.** Never. Nor any branch matching a configurable safelist.
- **Sweep does not commit anything.** The output report is filed by the human/agent that ran it, not auto-committed.

---

## Stranded-item triage

When the sweep reports STRANDED branches, the runner should:

1. **Look at the unique commits.** `git log main..<branch> --oneline` — message tells you what it was for.
2. **Check `gh pr list --search "<branch>"`** — sometimes a closed-without-merge PR explains it.
3. **Check the original author's session log** for what they were doing on that branch.
4. **Three outcomes:**
   - **Roll back into main via a fresh PR** — if the work is wanted and never got there
   - **Delete with prejudice** — if it's superseded / abandoned
   - **Keep stranded** — if it's intentional preservation (rare; document why in repo's branch-keep notes)

DERIVED items get the same triage but with stronger prior-toward-delete (the content is provably already on main; only the wrapper SHA is "missing").

---

## Implementation

Each repo gets its own sweep script tuned to its conventions:

- **openlaws:** `scripts/merge-keeper-sweep.sh` (shell — git is the API)
- **dispatch:** TBD — adopt if needed
- **PM:** `piper-morgan-product/scripts/merge-keeper-sweep.py` (the canonical reference; Python)

Scripts are repo-local because:
- Branch naming conventions differ (`claude/*` vs `dk/*` vs `vergil/*` vs `po-*`)
- Worktree locations differ (`.claude/worktrees/` is the standard but not universal)
- Safelist members are repo-specific (e.g., openlaws has `main`; PM has `main` + maybe others)

---

## v0.1 lessons (openlaws proof-of-concept, 2026-05-02)

First run on openlaws cleaned 21 local + 10 remote empty branches, plus stale worktree registry entries. Surfaced two findings worth knowing about:

1. **`git push origin --delete` is NOT blocked by the harness** that blocks adds-to-main. So remote-branch cleanup is fully automatable from a Code task.
2. **Side-channel worktrees do exist.** The sweep found a worktree at `/private/tmp/vergil-branch` outside the standard `.claude/worktrees/` tree. The sweep correctly flagged it for human review rather than deleting it. v0.2 of the script could optionally extend the worktree-search to include `/tmp` and `/private/tmp`, but only with explicit "yes also clean those" toggle — the default should be repo-internal only.

---

## Cross-Dispatch coordination

This discipline is one of two adoption candidates xian flagged on 2026-04-30 from PA's branch-discipline synthesis (the other was the per-memo commit-and-push norm). DinP and DK should both run repo-local sweeps on their respective repos; this doc is the shared reference. If/when a "share findings across repos" pattern proves useful, that's a follow-on; for now, each repo sweeps its own.

— Dispatch-Kind, 2026-05-02 ~17:45 PT
