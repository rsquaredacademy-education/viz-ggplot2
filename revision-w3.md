# Revision Notes — Wave 3 (CI convergence)

**Date:** 2026-10-05
**Scope:** One workflow shape per book; gates that cannot drift
**Author:** automated review pass

Part of a workspace-wide standard for all six books, documented at
[`viz-base/AUTHOR-STANDARDS.md`](https://github.com/rsquaredacademy-publications/viz-base/blob/master/AUTHOR-STANDARDS.md).
This file records only what changed in **this** repository.

---

## Summary

- Rename `deploy.yml` to `render.yml`.
- Replace the 25-entry hand-maintained slug list with `scripts/verify-slugs.sh`.
- Add `scripts/verify-sitemap.sh`.
- Upgrade `scripts/make-sitemap.sh` to recurse and to sort.
- Add a cross-reference gate.
- Add a weekly `linkcheck.yml`.

---

## 1. The slug gate was 25 hand-written slugs

Accurate today, but a 25-line list that must be edited by hand stops covering
new chapters the day someone forgets — and there is no signal when it does.
`scripts/verify-slugs.sh` derives it from `_quarto.yml` instead.

---

## 2. The sitemap generator was non-recursive and unsorted

This book has no subdirectory pages, so the existing flat generator was fine for
it. Two changes make it safe to share with the books that do:

**Recurse.** A flat listing emits `/foo.html` for a page served at
`/appendices/foo.html`, which is a 404 for a crawler. data-wrangling has three
such pages.

**Sort.** The original relied on filesystem glob order, so regenerating produced
arbitrary output and spurious diffs.

---

## 3. Two new gates

`scripts/verify-sitemap.sh` asserts the generated sitemap covers exactly the
pages that were built. Set comparison, not counts: viz-base had 17 entries for
17 pages while omitting `privacy.html`, because a bare `/` root entry offset the
missing page.

The cross-reference gate passes trivially here — this book carries no `@sec-`
references — but it will not stay that way silently.

---

## Verification

- Slug gate: all 25 chapters pass against committed `docs/`.
- Sitemap gate: all 25 pages covered.
- Negative controls: removing `ggplot2-themes` makes the sitemap gate exit 1.
- Workflow parses as valid YAML; 16 steps.
- CI green (9m26s, deployed to Netlify).

---

## Commits

| SHA | Message |
|:--|:--|
| `17d7a83` | ci: derive the slug gate from _quarto.yml, add sitemap and cross-ref gates |

---

## Not done here

- **Still uses lualatex** for the PDF. House standard is Typst, but callouts are
  unavailable there — `viz-base/AUTHORING.md:64-66` documents `:::{.callout-tip}`
  failing with `error: unknown variable: callout`. Migrating means converting
  **48 callout sites**, the most of any book. Wave 5.
- **`output-dir: _book` while CI assembles `docs/`.** A local `quarto render`
  writes to `_book/` (git-ignored, 0 tracked files) while CI publishes `docs/`
  (361 tracked files). Verified not a broken deploy, but a local-vs-CI
  divergence worth fixing so both produce the same layout.
- **`cheatsheet.qmd` is an 8-line stub** ("Coming in Phase 3") shipped as a live,
  numbered chapter. Wave 7.
- **16 orphaned `code/ch-*.R` files** — referenced by no chapter, README or
  `_quarto.yml`. Candidates for wave 7.
- **README labels the cheat sheet `A`** though it renders as a numbered
  chapter. Wave 8.
- Duplicate `_extensions/webr` alongside `_extensions/coatless/webr`;
  `.quarto/` listed twice in `.gitignore`. Wave 9.
- `AGENTS.md` is still the shared 300-byte boilerplate.