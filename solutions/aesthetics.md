# Solutions — Aesthetics

1. ```r
   ggplot(mtcars) +
     geom_point(aes(disp, mpg, color = factor(cyl)), size = 3)
   ```
   `size` sits outside `aes()` so it is a constant, not a mapping.
2. ```r
   ggplot(economics) +
     geom_line(aes(date, unemploy), linewidth = 1)
   ```
   Since ggplot2 3.4.0, line/border widths use `linewidth`; `size`
   now controls points and text only.
3. ```r
   wide <- data.frame(q = c("Q1", "Q2"), a = c(1, 2), b = c(3, 4))
   long <- tidyr::pivot_longer(wide, cols = c(a, b),
     names_to = "series", values_to = "value")
   ggplot(long) +
     geom_line(aes(q, value, color = series, group = series))
   ```
