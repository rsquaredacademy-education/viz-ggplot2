# Chapter exercises verification (run from repo root).
library(ggplot2)
p1 <- ggplot(mtcars) + geom_point(aes(disp, mpg))
p2 <- ggplot(mtcars) + geom_point(aes(disp, mpg, color = factor(cyl))) + labs(title = "Displacement vs mileage")
invisible(lapply(list(p1, p2), ggplot_build))
stopifnot(nrow(mtcars) == 32)
message("ch-quicktour OK")
