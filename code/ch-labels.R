# Chapter exercises verification (run from repo root).
library(ggplot2)
p1 <- ggplot(mtcars) + geom_point(aes(disp, mpg)) + labs(x = "Displacement (cu. in.)", y = "Miles per gallon", title = "Displacement vs mileage")
p2 <- ggplot(mtcars) + geom_point(aes(disp, mpg, color = factor(cyl))) + scale_color_manual(name = "Cylinders", values = c("red", "blue", "green"))
invisible(lapply(list(p1, p2), ggplot_build))
stopifnot(p2$labels$colour == "Cylinders")
message("ch-labels OK")
