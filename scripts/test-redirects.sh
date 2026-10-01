#!/usr/bin/env bash
# Verify all netlify.toml redirect destinations exist in staged docs/.
# Usage: bash scripts/test-redirects.sh [docs-dir]
set -euo pipefail
DOCS_DIR="${1:-docs}"
TOML="netlify.toml"
fail=0
count=0
while IFS= read -r line; do
  # match: to = ".../page.html" or to = "/page.html"
  dest=$(printf '%s' "$line" | sed -n 's/.*to *= *"\([^"]*\)".*/\1/p')
  [ -z "$dest" ] && continue
  page="${dest##*/}"
  count=$((count + 1))
  if [ ! -f "$DOCS_DIR/$page" ]; then
    echo "MISSING: $dest (expected $DOCS_DIR/$page)"
    fail=$((fail + 1))
  fi
done < "$TOML"
echo "Checked $count redirects against $DOCS_DIR/, missing: $fail"
[ "$count" -eq 16 ] || { echo "Expected 16 redirect rules, found $count"; exit 1; }
exit "$fail"
