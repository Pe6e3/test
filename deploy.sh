#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
MSG="${1:-chore: update site}"

git add -A
if git diff --staged --quiet; then
	echo "Nothing to commit."
	exit 0
fi

git commit -m "$MSG"
git push origin main
echo "OK: pushed to origin. Static site is served from this directory (nginx)."
