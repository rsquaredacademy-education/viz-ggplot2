# Regression check: run every chapter script from the repo root.
files <- c("code/ch-scatter.R", "code/ch-line.R", "code/ch-bar.R",
  "code/ch-box.R", "code/ch-histogram.R")
for (f in files) {
  message("== ", f, " ==")
  source(f, chdir = FALSE)
}
message("verify OK: ", length(files), " scripts, R ", getRversion())
