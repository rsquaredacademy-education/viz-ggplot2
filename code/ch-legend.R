# Chapter exercises verification (run from repo root).
library(ggplot2)
p1 <- ggplot(mtcars) + geom_point(aes(disp, mpg, color = factor(cyl))) + scale_color_manual(values = c("red", "blue", "green"), guide = guide_legend(title = "Cylinders", title.hjust = 0.5))
p2 <- ggplot(mtcars) + geom_point(aes(disp, mpg, color = factor(cyl))) + scale_color_manual(values = c("red", "blue", "green"), guide = guide_legend(label.position = "right"))
p3 <- ggplot(mtcars) + geom_point(aes(disp, mpg, color = hp)) + scale_color_continuous(guide = guide_colorbar(barwidth = 10, barheight = 3))
invisible(lapply(list(p1, p2, p3), ggplot_build))
message("ch-legend OK")
