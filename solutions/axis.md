# Solutions — Modify Axis

1. ```r
   ggplot(mtcars) +
     geom_point(aes(disp, mpg)) +
     scale_x_continuous(breaks = c(100, 200, 300, 400))
   ```
2. ```r
   ggplot(mtcars) +
     geom_point(aes(disp, mpg)) +
     coord_cartesian(ylim = c(20, 35))
   ```
   Check: all 32 points are still drawn (only the view zoomed).
3. `limits` drops out-of-range rows (with a warning); `coord_cartesian()`
   zooms the viewport while keeping every row for stats and smooths.
