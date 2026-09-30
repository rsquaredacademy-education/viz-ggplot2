# Chapter: Box Plots — exercise verification (run from repo root).
library(ggplot2)
p1 <- ggplot(mtcars) +
  geom_boxplot(aes(factor(cyl), mpg))
p2 <- ggplot(mtcars) +
  geom_boxplot(aes(y = mpg))
p3 <- ggplot(mtcars) +
  geom_boxplot(aes(factor(cyl), mpg, fill = factor(cyl))) +
  labs(title = "Four-cylinder cars deliver the highest mileage",
    x = "Cylinders", y = "Miles per gallon", fill = "Cylinders") +
  theme_minimal() +
  theme(legend.position = "none")
invisible(lapply(list(p1, p2, p3), ggplot_build))
stopifnot(median(mtcars$mpg[mtcars$cyl == 4]) == 26)
message("ch-box OK")
