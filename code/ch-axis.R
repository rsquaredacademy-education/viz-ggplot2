# Chapter exercises verification (run from repo root).
library(ggplot2)
p1 <- ggplot(mtcars) + geom_point(aes(disp, mpg)) + scale_x_continuous(breaks = c(100, 200, 300, 400))
p2 <- ggplot(mtcars) + geom_point(aes(disp, mpg)) + coord_cartesian(ylim = c(20, 35))
stopifnot(nrow(ggplot_build(p2)$data[[1]]) == 32)
message("ch-axis OK")
