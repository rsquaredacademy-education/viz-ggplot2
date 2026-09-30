# Chapter exercises verification (run from repo root).
library(ggplot2)
p1 <- ggplot(mtcars) + geom_point(aes(disp, mpg, color = factor(cyl))) + scale_color_manual(values = c("red", "blue", "green"))
p2 <- ggplot(mtcars) + geom_point(aes(disp, mpg, color = factor(cyl))) + scale_color_manual(values = c("red", "blue", "green"), labels = c("Four", "Six", "Eight"))
p3 <- ggplot(mtcars) + geom_point(aes(disp, mpg, color = factor(cyl))) + scale_color_manual(values = c("red", "blue", "green"), breaks = c(4, 8))
invisible(lapply(list(p1, p2, p3), ggplot_build))
message("ch-legend-color-fill OK")
