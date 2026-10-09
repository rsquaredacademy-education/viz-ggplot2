# Revision Notes — Wave 2 (toolchain pinning)

**Date:** 2026-10-05
**Scope:** Pin the build toolchain; make PDF/ePub failures fatal
**Author:** automated review pass

Part of a workspace-wide standard for all six books, documented at
[`viz-base/AUTHOR-STANDARDS.md`](https://github.com/rsquaredacademy-publications/viz-base/blob/master/AUTHOR-STANDARDS.md). This file records only what changed in
**this** repository.

---

## Summary

- Replace `version: "release"` with an exact Quarto pin.
- Make PDF and ePub renders fatal; remove the `PDF_FAILED` plumbing.
- Add a gate asserting both artifacts exist before assembly.

No content or `_quarto.yml` changes in this book.

---

## 1. Unpinned Quarto

```yaml
- uses: quarto-dev/quarto-actions/setup@v2
  with:
    version: "release"          # floating
```

This book broke with no commit to bisect whenever Quarto shipped anything,
and the **lualatex** PDF path is the most sensitive to upstream change — it
depends on TinyTeX and on callout/tcolorbox support that Quarto's templates
own. Now pinned to `1.10.18`, matching data-wrangling, which shares this
toolchain and PDF engine.

## 2. PDF/ePub failures were being swallowed

```yaml
run: quarto render --to pdf --output-dir /tmp/stage-pdf || echo "PDF_FAILED=1" >> $GITHUB_ENV
```

That form **always exits 0**. A failed render left a green build, and the
assemble step logged *"No PDF staged"* and continued — while the landing
page still advertised a download that was not there. This matters because
`downloads: [pdf, epub]` is set in `_quarto.yml`.

Removed the `||` from both render steps, removed the `PDF_FAILED`/
`EPUB_FAILED` handling from the assemble step (bare `cp` now), and added:

```yaml
- name: Verify downloads are present
  run: |
    ls /tmp/stage-pdf/*.pdf  || { echo "PDF MISSING";  exit 1; }
    ls /tmp/stage-epub/*.epub || { echo "EPUB MISSING"; exit 1; }
```

viz-base was already doing exactly this, with a comment recording that a
silent non-fatal render had previously shipped a green build with no PDF at
all. This aligns the two lualatex books with it.

---

## Verification

- PDF renders on the pinned Quarto 1.10.18 via lualatex.
- Workflow parses as valid YAML.
- CI ran green (7m35s) and deployed to Netlify.
- PDF confirmed live:
  `https://viz-ggplot2.rsquaredacademy.com/Data-Visualization-with-ggplot2.pdf`
  → HTTP 200, 15352 KB, valid `%PDF` header.
- The lualatex path was verified *before* committing the pin, not after —
  pinning to a version the book cannot build on would have been worse than
  the floating version.

---

## Commits

| SHA | Message |
|:--|:--|
| `e736775` | ci: pin Quarto and make PDF/epub failures fatal |

---

## Not done here

- **Still uses lualatex** for the PDF. House standard is Typst, but callouts
  are unavailable there: `viz-base/AUTHORING.md:64-66` documents
  `:::{.callout-tip}` failing with `error: unknown variable: callout`.
  Migrating means converting **48 callout sites** — the most of any book —
  into blockquote signposts. Wave 5.
- **`output-dir: _book` while CI assembles `docs/`.** So a local
  `quarto render` writes to `_book/` (git-ignored, 0 tracked files) while
  CI publishes `docs/` (361 tracked files). Verified: not a broken deploy,
  but a local-vs-CI divergence. Worth fixing so a local render and a CI
  render produce the same layout.
- **The `webr` HTML filter** is what makes the interactive cells work, and
  it breaks the Typst template's callout definitions — the same reason the
  book must stay on lualatex today.
- **`_quarto.yml` still has no `website.title`** and the description differs
  in wording from the README pitch. Cosmetic; wave 8.
- **`cheatsheet.qmd` is an 8-line stub** ("Coming in Phase 3") shipped as a
  live, numbered chapter. Wave 7.
- **16 orphaned `code/ch-*.R` files** — no chapter, README or `_quarto.yml`
  references them. Candidates for wave 7.
- **README labels the cheat sheet `A`** though it renders as a numbered
  chapter. Wave 8.
- Duplicate `_extensions/webr` alongside `_extensions/coatless/webr`;
  `.quarto/` listed twice in `.gitignore`. Wave 9.
- `AGENTS.md` is still the shared 300-byte boilerplate.