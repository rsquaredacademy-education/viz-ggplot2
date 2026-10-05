#!/bin/sh
# verify-sitemap.sh - assert sitemap.xml lists exactly the pages that were built.
#
# Compares the SET of rendered pages against the SET of URLs in the sitemap, not
# the counts. Counting is not enough: viz-base's hand-maintained sitemap had 17
# entries for 17 pages while omitting privacy.html entirely, because a bare "/"
# root entry that is not a page offset the missing one. A count-based gate passes
# that. A set comparison does not.
#
# Recurses into subdirectories, so appendices rendered as appendices/<slug>.html
# are matched by their full path.
#
# Usage: sh scripts/verify-sitemap.sh <rendered-html-dir> <sitemap-file>
#   e.g. sh scripts/verify-sitemap.sh /tmp/stage-html /tmp/stage-html/sitemap.xml
#
# NO `set -e` HERE, deliberately — see the note in verify-slugs.sh. Exit status
# is set explicitly.

DIR="${1:?usage: verify-sitemap.sh <rendered-html-dir> <sitemap-file>}"
MAP="${2:?usage: verify-sitemap.sh <rendered-html-dir> <sitemap-file>}"

if [ ! -d "$DIR" ]; then
  echo "FAIL: $DIR is not a directory"
  exit 1
fi
if [ ! -f "$MAP" ]; then
  echo "FAIL: $MAP not found"
  exit 1
fi

# Pages that exist as real content, as repo-relative paths.
pages=$(cd "$DIR" && find . -name '*.html' -type f \
        | sed 's|^\./||' \
        | grep -v '^404\.html$' \
        | grep -v '^google.*\.html$' \
        | sort -u)

if [ -z "$pages" ]; then
  echo "FAIL: no rendered pages found in $DIR"
  exit 1
fi

# URLs in the sitemap, reduced to paths relative to the site root so they
# compare directly. A bare root URL maps to nothing here and is ignored: it
# duplicates index.html rather than naming a page of its own.
# The pattern keeps any subdirectory prefix (appendices/foo.html), so it must
# strip only the scheme and host, not everything after the last slash.
# NOTE: | is the sed delimiter because the pattern contains //.
urls=$(sed -n 's|.*<loc>https\{0,1\}://[^/]*/\(.*\.html\)</loc>.*|\1|p' "$MAP" \
       | sort -u)

extra=$(printf '%s\n' "$urls"   | grep -vxF "$pages")
missing=$(printf '%s\n' "$pages" | grep -vxF "$urls")

status=0
if [ -n "$extra" ]; then
  echo "SITEMAP lists pages that were not built:"
  printf '%s\n' "$extra" | sed 's/^/  /'
  status=1
fi
if [ -n "$missing" ]; then
  echo "SITEMAP is missing rendered pages:"
  printf '%s\n' "$missing" | sed 's/^/  /'
  status=1
fi

if [ "$status" -ne 0 ]; then
  echo "FAIL: sitemap does not match the rendered pages"
  exit 1
fi

echo "OK: sitemap covers all $(printf '%s\n' "$pages" | wc -l | tr -d ' ') rendered pages"