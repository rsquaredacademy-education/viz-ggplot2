#!/usr/bin/env bash
# Build sitemap.xml from staged HTML pages (Quarto's `sitemap: true`
# does not reliably emit one for books). Usage:
#   bash scripts/make-sitemap.sh [docs-dir] [site-url]
set -euo pipefail
DOCS_DIR="${1:-docs}"
SITE_URL="${2:-https://viz-ggplot2.rsquaredacademy.com}"
{
  echo '<?xml version="1.0" encoding="UTF-8"?>'
  echo '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">'
  for f in "$DOCS_DIR"/*.html; do
    page=$(basename "$f")
    [ "$page" = "404.html" ] && continue
    echo "  <url><loc>${SITE_URL}/${page}</loc></url>"
  done
  echo '</urlset>'
} > "$DOCS_DIR/sitemap.xml"
echo "Wrote $DOCS_DIR/sitemap.xml with $(grep -c '<url>' "$DOCS_DIR/sitemap.xml") URLs"
