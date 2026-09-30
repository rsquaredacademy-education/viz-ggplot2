# Chapter exercises verification (run from repo root).
library(ggplot2)
top <- mtcars[which.max(mtcars$mpg), ]
p1 <- ggplot(mtcars) + geom_point(aes(disp, mpg)) + annotate("text", x = top$disp, y = top$mpg, label = "Toyota Corolla", hjust = -0.1)
efficient <- mtcars[mtcars$mpg > 30, ]; efficient$model <- rownames(efficient)
p2 <- ggplot(mtcars) + geom_point(aes(disp, mpg)) + geom_text(data = efficient, aes(disp, mpg, label = model), hjust = -0.1, size = 3)
invisible(lapply(list(p1, p2), ggplot_build))
stopifnot(rownames(top) == "Toyota Corolla", sum(mtcars$mpg > 30) == 4)
message("ch-annotations OK")
