# Chapter: Line Graphs — exercise verification (run from repo root).
library(ggplot2)
p1 <- ggplot(economics) +
  geom_line(aes(date, unemploy), linewidth = 1)
long <- tidyr::pivot_longer(economics, cols = c(unemploy, uempmed),
  names_to = "series", values_to = "value")
p2 <- ggplot(long) +
  geom_line(aes(date, value, color = series), linewidth = 1)
p3 <- ggplot(economics) +
  geom_line(aes(date, unemploy), linewidth = 1, color = "steelblue") +
  labs(title = "US unemployment peaked after the 2008 crisis",
    x = "Year", y = "Unemployed (thousands)") +
  theme_minimal()
invisible(lapply(list(p1, p2, p3), ggplot_build))
stopifnot(max(economics$unemploy) == 15352, nrow(long) == 2 * nrow(economics))
message("ch-line OK")
