# Chapter: Scatter Plots — exercise verification (run from repo root).
library(ggplot2)
p1 <- ggplot(mtcars) +
  geom_point(aes(disp, mpg, color = factor(cyl))) +
  scale_color_manual(name = "Cylinders", values = c("red", "blue", "green"))
p2 <- ggplot(mtcars) +
  geom_point(aes(disp, mpg)) +
  geom_smooth(aes(disp, mpg), formula = y ~ x, se = FALSE)
p3 <- ggplot(mtcars) +
  geom_point(aes(disp, mpg, color = factor(cyl)), size = 2.5) +
  labs(title = "Heavier engines get fewer miles per gallon",
    x = "Displacement (cu. in.)", y = "Miles per gallon",
    color = "Cylinders") +
  theme_minimal()
invisible(lapply(list(p1, p2, p3), ggplot_build))
stopifnot(nrow(mtcars) == 32)
message("ch-scatter OK")
