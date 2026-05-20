# safe-push.sh — git push wrapper with non-fast-forward retry

**Status:** Adopted 2026-05-20, lifted from Piper Morgan under the family-resemblance convention.
**Source:** PM `scripts/safe-push.sh` @ commit 04a86ef6 (PM CIO disposition May 15, 2026).
**Adapted to:** `dispatch/scripts/safe-push.sh`, `openlaws/scripts/safe-push.sh`.

## What it does

`safe-push.sh` wraps `git push` with auto-retry on non-fast-forward via `stash → fetch → rebase → retry`. Up to 3 attempts. Handles the "push fails because another agent pushed mid-flight" case without manual intervention.

The recovery dance — fetch, rebase, retry — is mechanical and error-prone to do by hand, especially with intervening pre-commit hooks or stale local clones. This wrapper does it correctly.

## Usage

```bash
./scripts/safe-push.sh                  # pushes current branch to origin
./scripts/safe-push.sh origin main      # explicit remote + branch
```

## Exit codes

| Code | Meaning |
|------|---------|
| 0 | Pushed cleanly (may have rebased first) |
| 1 | Rebase conflict; manual resolution required |
| 2 | Unrelated failure (no remote, no upstream, auth, network, etc.) |
| 3 | Three retries exhausted without push success |

## Adaptations vs. PM's original

The key adaptation: **the `-u` flag on `git stash push` is omitted**. PM's original sweeps untracked files into the stash; this would violate the multi-agent shared-checkout discipline documented in CLAUDE.md (and would trigger the same failure mode as the 5/04 stash-sweep incident in OpenLaws).

In practice this means: if other agents have untracked files on the working tree when safe-push runs a rebase, those files stay where they are (untracked, not in the stash). The script's stash only catches tracked-file modifications.

If a rebase fails because of an untracked file that conflicts with upstream (rare), the rebase aborts and surfaces — the right behavior under shared-checkout discipline. Manual resolution is appropriate; the script doesn't sweep other agents' work.

## When to use it

**In SKILL.md push steps:** replace raw `git push origin main` with `./scripts/safe-push.sh origin main`. The DK scheduled tasks (`dinp-daily-memo`, `dinp-inbox-check`) and any Code task that pushes operational mail should use this.

**Interactive use:** if you're on a multi-agent shared checkout and pushing for the first time in a session, prefer `./scripts/safe-push.sh` over `git push` — it removes the manual rebase recovery step.

**When NOT to use:** force-pushes, branch-deletes, anything where you specifically don't want a rebase. Use raw `git push` (with `--force-with-lease` for force-pushes).

## Failure modes to know

1. **Rebase conflict (exit 1)** — the script bails out with a stash-recovery hint. The stash entry is named `safe-push retry <N>` so you can find it with `git stash list`.

2. **Unrelated push failure (exit 2)** — auth, network, unknown ref. Script surfaces the original git error and does not retry. Check `git remote -v` and network reachability.

3. **Retries exhausted (exit 3)** — three attempts all hit non-fast-forward. This implies a very hot repo with concurrent commits faster than rebase + retry can keep up. Practically rare in our setup; if it happens, run the script again manually or escalate.

## Cross-cutting note

`safe-push.sh` is the operational complement to:

- **`pre-commit-broad-staging-warn.sh`** (proposal #2 in `proposals/2026-05-19-cross-pollination-adoptions.md`) — catches multi-agent staging accidents at commit time
- **launchd push-arm** at `~/.local/bin/dispatch-push-arm.sh` — catches local-but-not-pushed commits within 15 minutes (defense-in-depth)
- **Phase 0 pull discipline** in scheduled-task SKILL.md files — prevents stale-clone reads before write

All four together produce the durable "push almost-never fails silently" property.

## Lift provenance

PM's safe-push.sh was authored 2026-05-15 alongside the worktree-default policy elevation. Surfaced in cross-pollination brief 2026-05-16 (Insight #2). Lifted to dispatch + openlaws on 2026-05-20 as proposal #1 of the adoption batch.
