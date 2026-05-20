# Pre-commit hook — broad-staging-warn

**Status:** Adopted 2026-05-20, lifted from Piper Morgan under the family-resemblance convention.
**Source:** PM `.claude/hooks/pre-commit-broad-staging-warn.sh` @ commit 04a86ef6 (PM CIO disposition 2026-05-15).
**Adapted to:** `dispatch/scripts/hooks/pre-commit-broad-staging-warn.sh`, `openlaws/scripts/hooks/pre-commit-broad-staging-warn.sh`.

## What it does

Pre-commit hook that warns (does not block) when the staged set looks like a multi-agent staging sweep — the precedent failure mode in OpenLaws CLAUDE.md's 5/04 stash-sweep incident.

Triggers a warning on:

| Repo | Trigger 1 | Trigger 2 | Trigger 3 |
|------|-----------|-----------|-----------|
| dispatch | ≥2 distinct `dispatch-<role>` prefixes in `mail/` staged | ≥15 total staged files | — |
| openlaws | ≥3 distinct known agent slugs in any staged path | ≥20 total staged files | ≥2 distinct session-log authors in `logs/` |

Exit codes:
- **0** — all clear, commit proceeds normally
- **2** — warn fired, warning printed to stderr, commit proceeds anyway

To bypass on a specific commit you've audited: `git commit --no-verify`.

## Why the warn-not-block design

Block-on-trigger would fire false-positives on legitimate broad commits (a deliberate multi-mailbox backfill; a rename across many files). The friction would push agents toward `--no-verify` as a habit, which would defeat the hook's purpose. Warn-mode keeps the friction proportional: agents see the message, decide if it's a real sweep or intentional, and proceed.

## Installation

Hooks live in two places:
- **Canonical (version-controlled):** `scripts/hooks/pre-commit-broad-staging-warn.sh`
- **Active (per-clone, not version-controlled):** `.git/hooks/pre-commit` → symlinks to the canonical

After a fresh `git clone`, run once:

```bash
./scripts/install-hooks.sh
```

The install script is idempotent. Re-run if the canonical script changes location, or if the symlink ever gets removed.

## Adaptations from PM's original

PM's hook detects "mailbox role" sweeps via the directory structure `mailboxes/<role>/...`. Neither dispatch nor openlaws has that structure — agent identity in our repos is encoded in filename slugs across multiple directories. Adaptations per repo:

**Dispatch:**
- "Author detection" reads filename prefixes in `mail/` (`memo-dispatch-<role>-to-...`, `signal-dispatch-<role>-to-...`)
- Threshold lowered to 2 distinct dispatch authors (we have 2 primary agents)
- File-count threshold lowered to 15 (smaller repo)
- Uses awk for the extraction instead of sed alternation (BSD sed `-E` is unreliable with `(a|b)` patterns)

**Openlaws:**
- "Author detection" matches a known-slugs allowlist (`dispatch-kind`, `dispatch-dinp`, `vergil`, `piper-open`, `jerry`, `janus`, `calliope`, `daedalus`, `argus`) anywhere in the staged path
- Threshold of 3 distinct slugs (matches PM's original — multiple agents active)
- File-count threshold of 20 (matches PM's original)
- Session-log detection on `logs/YYYY-MM-DD-<role>-log.md` — threshold 2

If an agent slug is added or changes, update the `AGENT_SLUGS_REGEX` in the openlaws hook.

## Tested behaviors

Verified 2026-05-20 on both repos:
- **No-warn case** (single author, few files staged) — exit 0, no output
- **Warn case (dispatch, 2 authors)** — exit 2, warning prints with author list
- **Warn case (openlaws, 3 slugs)** — exit 2, warning prints with slug list
- **Warn case (openlaws, 2 log authors)** — exit 2, warning prints with author list
- **Empty index** — exit 0, no output

Mass-staging trigger (15+/20+ file count) verified via threshold-only path; not exercised with a real 20-file commit.

## Cross-cutting note

Pre-commit hook complements `safe-push.sh` (post-commit safety) and the Phase 0 pull discipline (pre-read safety). Together they form a layered defense against the multi-agent shared-checkout failure modes that bit us repeatedly in April–May 2026.

## Lift provenance

PM's hook was authored 2026-05-15 alongside the worktree-default policy. Surfaced in cross-pollination brief 2026-05-16 (Insight #2). Lifted to dispatch + openlaws on 2026-05-20 as proposal #2 of the adoption batch.
