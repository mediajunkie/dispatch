#!/usr/bin/env bash
# install-hooks.sh — install version-controlled git hooks into .git/hooks/.
#
# .git/hooks/ is not version-controlled, so each clone needs a one-time setup
# step to wire the canonical scripts in scripts/hooks/ to the git lifecycle.
# This script creates the symlinks. Idempotent — run as often as needed.
#
# Usage: ./scripts/install-hooks.sh
#
# Currently installed hooks:
#   pre-commit → scripts/hooks/pre-commit-broad-staging-warn.sh

set -e

REPO_ROOT=$(git rev-parse --show-toplevel 2>/dev/null)
if [ -z "$REPO_ROOT" ]; then
    echo "install-hooks: not in a git working tree" >&2
    exit 1
fi
cd "$REPO_ROOT"

HOOKS_DIR=".git/hooks"
mkdir -p "$HOOKS_DIR"

# pre-commit → broad-staging-warn
ln -sf ../../scripts/hooks/pre-commit-broad-staging-warn.sh "$HOOKS_DIR/pre-commit"
echo "✓ installed pre-commit → scripts/hooks/pre-commit-broad-staging-warn.sh"

# Verify executable bits on canonical scripts.
chmod +x scripts/hooks/*.sh 2>/dev/null || true

echo ""
echo "Hooks installed. Verify with: ls -la $HOOKS_DIR/pre-commit"
echo "Bypass on a specific commit with: git commit --no-verify"
