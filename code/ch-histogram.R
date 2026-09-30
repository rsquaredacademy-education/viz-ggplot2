# Chapter: Histograms — exercise verification (run from repo root).
library(ggplot2)
p1 <- ggplot(mtcars) +
  geom_histogram(aes(mpg), bins = 10, fill = "steelblue",
    color = "white", linewidth = 0.5)
p2 <- ggplot(mtcars) +
  geom_histogram(aes(mpg, y = after_stat(density)), bins = 10,
    fill = "steelblue", color = "white", linewidth = 0.5)
p3 <- ggplot(mtcars) +
  geom_histogram(aes(mpg), bins = 10, fill = "steelblue",
    color = "white", linewidth = 0.5) +
  labs(title = "Most cars cluster between 15 and 25 mpg",
    x = "Miles per gallon", y = "Number of cars") +
  theme_minimal()
stopifnot(sum(ggplot_build(p1)$data[[1]]$count) == 32)
invisible(lapply(list(p2, p3), ggplot_build))
message("ch-histogram OK")
