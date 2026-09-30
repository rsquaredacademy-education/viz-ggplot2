# Solutions — Geoms

1. ```r
   ggplot(mtcars) +
     geom_point(aes(disp, mpg)) +
     geom_smooth(aes(disp, mpg), formula = y ~ x)
   ```
   Check: the smooth fits 32 points (`nrow(mtcars)`).
2. ```r
   ggplot(mtcars) +
     geom_histogram(aes(mpg), bins = 10, fill = "steelblue",
       color = "white", linewidth = 0.5)
   ```
   Check: bin counts sum to 32.
3. `stat_summary(aes(factor(cyl), mpg), fun = median, geom = "bar")` —
   one mark per group computed on the fly, no pre-aggregation needed.
