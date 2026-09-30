# Data Visualization with ggplot2

*From First Plot to Publication-Ready Graphics: the zero-friction ggplot2 recipe book — every recipe copy-pasteable and runnable in the browser.*

📖 **Read the book:** https://viz-ggplot2.rsquaredacademy.com

Free to read, built with [Quarto](https://quarto.org/).

## Syllabus

| # | Chapter | You will learn |
|:--|:--------|:---------------|
| 1 | Quick Tour | First `ggplot() + geom_*()` plot in 5 minutes |
| 2 | Geoms | Marks: points, lines, bars, smooths |
| 3 | Aesthetics | Map variables to color, size, shape, linewidth |
| 4 | Labels | Axis labels and titles |
| 5 | Text Annotations | Direct labels and annotations |
| 6 | Scatter Plots | `geom_point()`, jitter, `geom_smooth()` |
| 7 | Line Graphs | Multi-series lines with `pivot_longer()` data |
| 8 | Bar Plots | Dodge, fill, `coord_flip()` |
| 9 | Box Plots | Single and grouped distributions |
| 10 | Histograms | Bins, density mapping with `after_stat()` |
| 11 | Modify Axis | Breaks, limits, `coord_cartesian()` zoom |
| 12 | Modify Legend | Guide titles, labels, colorbars |
| 13 | Legend: Color & Fill | `scale_*_manual()` for categorical color |
| 14 | Legend: Shape, Size & Alpha | Continuous vs discrete legend mapping |
| 15 | Faceting | Small multiples that share scales |
| 16 | Themes | Publication-ready `theme()` element by element |
| 17 | Position & Stats | `position_dodge()/jitter()/stack()`, `stat_summary()`, `after_stat()` |
| 18 | Scales & Accessibility | `scales::label_*()`, viridis, WCAG contrast |
| 19 | Reshaping | Wide vs long with `pivot_longer()` |
| 20 | Label Polish | `str_wrap()`, `label_wrap()` |
| 21 | Finale Polish | `patchwork`, `ggrepel`, `ggtext` case studies |
| 22 | Export & Communicate | `ggsave()` at 300 dpi + storytelling checklist |
| A | Cheat Sheet | Two-page quick reference *(Phase 3)* |

## Develop

```bash
quarto preview                     # live HTML preview
quarto render                      # full book (HTML + Typst PDF + ePub into _book/)
```

CI verifies slugs and multi-format outputs on render. `master` is the production branch.

## License

CC BY-NC-SA 4.0.
