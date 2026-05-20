#!/usr/bin/env bash
# pre-commit-broad-staging-warn.sh — pre-commit hook for the dispatch repo.
#
# Detects cross-agent sweeps in the staged set. When a commit would touch
# multiple agent-authored files simultaneously, that's almost always evidence
# that the shared git index captured neighboring agents' unstaged work via the
# staging race (precedent: the 5/04 stash-sweep incident referenced in this
# repo's CLAUDE.md operational-hygiene section).
#
# Trigger thresholds (calibrated for dispatch repo — small, 2 primary agents):
#   - Staged set in mail/ touches >= 2 distinct agent-author prefixes
#     (e.g., "dispatch-kind" + "dispatch-dinp" in one commit)
#   - Staged set has >= 15 total files
#
# Exit 2 = warn (stderr surfaces; commit not blocked)
# Exit 0 = pass
#
# Source: PM .claude/hooks/pre-commit-broad-staging-warn.sh (2026-05-15)
# Adaptation: 2026-05-20 by Dispatch-Kind — dispatch repo lacks PM's
# `mailboxes/<role>/` structure; role is encoded in filename prefixes
# in mail/ instead. Adjusted detection accordingly.

REPO_ROOT=$(git rev-parse --show-toplevel 2>/dev/null)
if [ -z "$REPO_ROOT" ]; then
    exit 0
fi
cd "$REPO_ROOT" || exit 0

# Index state: list staged file paths.
STAGED=$(git diff --cached --name-only 2>/dev/null)

# Empty index → nothing to check.
if [ -z "$STAGED" ]; then
    exit 0
fi

# Total file count.
TOTAL_COUNT=$(printf '%s\n' "$STAGED" | grep -c '.')

# Distinct agent-author prefixes in mail/ filenames.
# Pattern: mail/memo-dispatch-<role>-to-... or mail/signal-dispatch-<role>-to-...
# Extract the <role> after "dispatch-". Using awk for portability across BSD/GNU
# (BSD sed's -E alternation is unreliable with capture groups).
MAIL_AUTHORS=$(printf '%s\n' "$STAGED" \
    | awk -F- '/^mail\/memo-dispatch-/ || /^mail\/signal-dispatch-/ {print $3}' \
    | sort -u)
MAIL_AUTHOR_COUNT=$(printf '%s\n' "$MAIL_AUTHORS" | grep -c '.' || true)
[ -z "$MAIL_AUTHORS" ] && MAIL_AUTHOR_COUNT=0

# Threshold checks.
SWEEP_AUTHORS=$([ "$MAIL_AUTHOR_COUNT" -ge 2 ] && echo 1 || echo 0)
SWEEP_MASS=$([ "$TOTAL_COUNT" -ge 15 ] && echo 1 || echo 0)

if [ "$SWEEP_AUTHORS" = "0" ] && [ "$SWEEP_MASS" = "0" ]; then
    exit 0  # All clear.
fi

# Build the warning message.
{
    echo "⚠️  BROAD-STAGING WARNING (pre-commit) — sweep signal in staged set"
    echo ""
    echo "Your staged commit may have captured another agent's work via the shared"
    echo "git index. Reference: 5/04 stash-sweep incident in CLAUDE.md operational-hygiene."
    echo ""
    echo "Signals triggered:"
    if [ "$SWEEP_AUTHORS" = "1" ]; then
        echo "  • Touches mail/ files from $MAIL_AUTHOR_COUNT distinct dispatch authors:"
        printf '%s\n' "$MAIL_AUTHORS" | sed 's/^/      - dispatch-/'
    fi
    if [ "$SWEEP_MASS" = "1" ]; then
        echo "  • Staged set has $TOTAL_COUNT total files (mass-staging signal)"
    fi
    echo ""
    echo "Before proceeding:"
    echo "  1. Inspect: git diff --cached --name-only"
    echo "  2. If foreign files are present: git restore --staged <path>"
    echo "  3. Re-stage only your own files with explicit paths"
    echo "  4. Verify with: git diff --cached --name-only | head -20"
    echo ""
    echo "If the staged set is intentional (e.g., a deliberate multi-agent backfill),"
    echo "proceed. The warning is informational; commit is not blocked."
    echo "Use --no-verify to skip the hook on a specific commit if you've verified."
} >&2

exit 2
