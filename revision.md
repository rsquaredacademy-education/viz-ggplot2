# Revision Notes

**Date:** 2026-10-05
**Scope:** Structural and build-consistency review (wave 1 — correctness)
**Author:** automated review pass, render-verified with Quarto 1.6.40

Part of a workspace-wide standard for all six books, documented at
[`viz-base/AUTHOR-STANDARDS.md`](https://github.com/rsquaredacademy-publications/viz-base/blob/master/AUTHOR-STANDARDS.md). This file records only what changed in
**this** repository.

---

## Summary

Two changes:

1. A wrong answer key: the Quick Tour pointed at the scatter-plot solutions.
2. Ten "Putting it all together" headings reduced to one exact spelling.

Plus a `LICENSE` file. No URLs, slugs or redirects affected.

---

## 1. Wrong solutions pointer (the real bug)

`ggplot2-quicktour.qmd` ended its exercises with:

```markdown
Worked solutions in `solutions/scatter.md` (attempt first).
```

`solutions/scatter.md` is the answer key for `ggplot2-scatter-plot.qmd` — a
different chapter with three different questions. Meanwhile
`solutions/quicktour.md` **existed, was complete, and was referenced by
nothing**.

The result: Quick Tour readers were handed the wrong answers, and the correct
answer key was unreachable.

Verified before fixing — `solutions/quicktour.md` answers the Quick Tour
questions exactly (disp-vs-mpg scatter; color by cylinders plus `labs()` title;
`qplot()` deprecated in ggplot2 3.4.0), while `solutions/scatter.md` answers
the scatter-plot questions (color scale with a plain legend title;
`geom_smooth()` with `formula = y ~ x` and `se = FALSE`; message-first title
with `theme_minimal()`).

Corrected to `solutions/quicktour.md`, confirmed in rendered HTML.

Cross-book state after this change: **32 pointers, 0 broken, 0 orphaned.**

---

## 2. Heading spelling normalized

"Putting it all together" shipped in five variants across three heading levels
in this book. Text is now one exact string at all ten sites:

| File | Before | After |
|:--|:--|:--|
| `ggplot2-histogram.qmd` | `## Putting it all together...` | `## Putting it all together` |
| `ggplot2-labels.qmd` | `## Putting it all together...` | `## Putting it all together` |
| `ggplot2-text-annotations.qmd` | `## Putting it all together..` | `## Putting it all together` |
| `ggplot2-modify-axis.qmd` | `### Putting it all together..` | `### Putting it all together` |
| `ggplot2-modify-axis.qmd` | `## Putting it all together...` | `## Putting it all together` |
| `ggplot2-legend-color-fill.qmd` ×2 | `### Putting it all together... {.unnumbered}` | unchanged except ellipsis |
| `ggplot2-legend-shape-size-alpha.qmd` ×3 | `### Putting it all together... {.unnumbered}` | unchanged except ellipsis |
| `ggplot2-modify-legend.qmd` | `#### Putting it all together... {.unnumbered}` | unchanged except ellipsis |

**Heading levels were deliberately left alone.** The `###` and `####` variants
are intentional nesting inside larger sections, not drift — flattening them
would change the table of contents shape for no reader benefit. Only the
heading *text* was inconsistent.

Checked beforehand that nothing cross-references `#putting-it-all-together`, so
no anchor was broken. (`viz-base` had the same five-variant problem and was
fixed in the same pass.)

---

## 3. LICENSE added

`LICENSE` — verbatim CC BY-NC-SA 4.0 International legal code (438 lines),
fetched from `creativecommons.org`. License text is never reconstructed from
memory.

The README already declared CC BY-NC-SA 4.0 in prose; there was now a
machine-readable file to match.

---

## Verification

Rendered with Quarto **1.6.40**; no errors or warnings.

- 0 unresolved `??` cross-references.
- All 11 "Putting it all together" headings present in output.
- `ggplot2-quicktour.html` renders `solutions/quicktour.md`.

> Note: each heading appears twice in the output (once in the page, once in the
> in-page TOC), so a raw count of 21 is expected for 11 headings.

---

## Before committing

- Git reports `LF will be replaced by CRLF` for `ggplot2-legend-color-fill.qmd`,
  `ggplot2-legend-shape-size-alpha.qmd`, `ggplot2-modify-axis.qmd` and
  `ggplot2-modify-legend.qmd`. Pre-existing repo line-ending behaviour, not
  introduced here, but it may enlarge the diff on next checkout.
- Suggested message: `fix: point quick tour at its own solutions file`
  (the heading cleanups can ride along as `docs: unify heading spellings`, or
  be split into a second commit if you prefer them reviewable on their own).

---

## Not done here (tracked in the workspace checklist)

- **16 orphaned `code/ch-*.R` files** — no chapter, README or `_quarto.yml`
  references them. Candidates for wave 7.
- `cheatsheet.qmd` is an 8-line stub ("Coming in Phase 3") shipped as a live,
  numbered chapter.
- `_quarto.yml` declares `output-dir: _book` while CI assembles `docs/`. So a
  local `quarto render` writes to `_book/` (git-ignored, 0 tracked files) while
  CI publishes `docs/` (361 tracked files). Not a broken deploy — a local-vs-CI
  divergence.
- Quarto version is unpinned (`version: "release"`) — the largest remaining CI
  risk, scheduled for wave 2.
- PDF uses lualatex; house standard is Typst (wave 5, ~48 callout sites).
- Duplicate `_extensions/webr` alongside `_extensions/coatless/webr`; `.quarto/`
  listed twice in `.gitignore`.
- README labels the cheat sheet `A` though it renders as a numbered chapter.