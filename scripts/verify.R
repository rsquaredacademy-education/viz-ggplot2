# Regression check: run every chapter script from the repo root.
files <- c("code/ch-quicktour.R", "code/ch-geoms.R", "code/ch-aesthetics.R",
  "code/ch-labels.R", "code/ch-annotations.R", "code/ch-scatter.R", "code/ch-line.R",
  "code/ch-bar.R", "code/ch-box.R", "code/ch-histogram.R", "code/ch-axis.R",
  "code/ch-legend.R", "code/ch-legend-color-fill.R", "code/ch-legend-shape-size-alpha.R",
  "code/ch-facets.R", "code/ch-themes.R")
for (f in files) {
  message("== ", f, " ==")
  source(f, chdir = FALSE)
}
message("verify OK: ", length(files), " scripts, R ", getRversion())
