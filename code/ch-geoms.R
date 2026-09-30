# Chapter exercises verification (run from repo root).
library(ggplot2)
p1 <- ggplot(mtcars) + geom_point(aes(disp, mpg)) + geom_smooth(aes(disp, mpg), formula = y ~ x)
p2 <- ggplot(mtcars) + geom_histogram(aes(mpg), bins = 10)
stopifnot(sum(ggplot_build(p2)$data[[1]]$count) == 32)
invisible(ggplot_build(p1))
message("ch-geoms OK")
