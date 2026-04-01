#!/usr/bin/env bash
# Verifies that project-mentor/ and .claude/skills/project-mentor/ are identical.
# Run directly, or wire as a pre-commit hook via .githooks/pre-commit.

set -euo pipefail

REPO_ROOT="$(git rev-parse --show-toplevel)"
SRC="$REPO_ROOT/project-mentor"
DST="$REPO_ROOT/.claude/skills/project-mentor"

if diff -rq --exclude="evals" "$SRC" "$DST" > /dev/null 2>&1; then
    echo "OK: project-mentor/ and .claude/skills/project-mentor/ are in sync."
    exit 0
else
    echo "ERROR: project-mentor/ and .claude/skills/project-mentor/ have diverged."
    echo ""
    diff -r --exclude="evals" "$SRC" "$DST" || true
    echo ""
    echo "To fix: copy your changes from the canonical source into the runtime copy, or run:"
    echo "  cp -r project-mentor/. .claude/skills/project-mentor/"
    exit 1
fi
