# Chapter exercises verification (run from repo root).
library(ggplot2)
p1 <- ggplot(mtcars) + geom_point(aes(disp, mpg)) + theme_minimal()
theme_rsquared <- function() { theme_minimal() + theme(text = element_text(size = 13), plot.title = element_text(face = "bold"), legend.position = "bottom") }
p2 <- ggplot(mtcars) + geom_point(aes(disp, mpg)) + theme_rsquared()
invisible(lapply(list(p1, p2), ggplot_build))
message("ch-themes OK")
