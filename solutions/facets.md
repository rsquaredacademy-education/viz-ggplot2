# Solutions — Faceting

1. ```r
   ggplot(mtcars) +
     geom_point(aes(disp, mpg)) +
     facet_wrap(~cyl)
   ```
   Check: 3 panels (4, 6, 8 cylinders).
2. ```r
   ggplot(mtcars) +
     geom_point(aes(disp, mpg)) +
     facet_grid(gear ~ carb)
   ```
3. Facets when comparisons need shared scales but separated space
   (trends per group); color when overlaid patterns matter more than
   exact per-group reading.
