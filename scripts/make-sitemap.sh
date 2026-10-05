#!/usr/bin/env bash
# Build sitemap.xml from rendered HTML pages.
#
# Generated rather than hand-maintained. The hand-maintained copy this replaced
# had drifted out of order against _quarto.yml, and a set-comparison gate
# (scripts/verify-sitemap.sh) found pages it had dropped entirely.
#
# Recurses into subdirectories so appendices rendered as appendices/<slug>.html
# get their full path in the <loc>. A flat listing produced URLs like
# /arrow-duckdb.html for a page actually served at /appendices/arrow-duckdb.html,
# which is a 404 for a crawler following the sitemap.
#
# Usage: bash scripts/make-sitemap.sh [html-dir] [site-url]
set -euo pipefail
DOCS_DIR="${1:-docs}"
SITE_URL="${2:-https://example.com}"

{
  echo '<?xml version="1.0" encoding="UTF-8"?>'
  echo '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">'
  # find + sort so subdirectory paths are included in a stable order.
  ( cd "$DOCS_DIR" && find . -name '*.html' -type f \
      | sed 's|^\./||' \
      | grep -v '^404\.html$' \
      | grep -v '^google.*\.html$' \
      | sort ) \
  | while read -r page; do
      echo "  <url><loc>${SITE_URL}/${page}</loc></url>"
    done
  echo '</urlset>'
} > "$DOCS_DIR/sitemap.xml"

echo "Wrote $DOCS_DIR/sitemap.xml with $(grep -c '<url>' "$DOCS_DIR/sitemap.xml") URLs"