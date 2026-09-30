# Chapter: Bar Plots — exercise verification (run from repo root).
library(ggplot2)
p1 <- ggplot(mtcars) +
  geom_bar(aes(factor(cyl)), fill = "steelblue")
p2 <- ggplot(mtcars) +
  geom_bar(aes(factor(cyl), fill = factor(gear)),
    position = position_dodge(width = 0.8))
p3 <- ggplot(mtcars) +
  geom_bar(aes(factor(cyl), fill = factor(gear)),
    position = position_dodge(width = 0.8)) +
  labs(title = "Eight-cylinder cars dominate the sample",
    x = "Cylinders", y = "Number of cars", fill = "Gears") +
  theme_minimal()
invisible(lapply(list(p1, p2, p3), ggplot_build))
stopifnot(identical(as.vector(table(mtcars$cyl)), c(11L, 7L, 14L)),
  sum(mtcars$cyl == 4 & mtcars$gear == 4) == 8)
message("ch-bar OK")
