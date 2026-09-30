# Chapter exercises verification (run from repo root).
library(ggplot2)
p1 <- ggplot(mtcars) + geom_point(aes(disp, mpg)) + facet_wrap(~cyl)
p2 <- ggplot(mtcars) + geom_point(aes(disp, mpg)) + facet_grid(gear ~ carb)
stopifnot(length(unique(ggplot_build(p1)$data[[1]]$PANEL)) == 3)
invisible(ggplot_build(p2))
message("ch-facets OK")
