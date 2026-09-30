# Chapter exercises verification (run from repo root).
library(ggplot2)
p1 <- ggplot(mtcars) + geom_point(aes(disp, mpg, shape = factor(cyl))) + scale_shape_manual(values = c(4, 12, 24))
p2 <- ggplot(mtcars) + geom_point(aes(disp, mpg, size = hp)) + scale_size_continuous(range = c(3, 6))
invisible(lapply(list(p1, p2), ggplot_build))
message("ch-legend-shape-size-alpha OK")
