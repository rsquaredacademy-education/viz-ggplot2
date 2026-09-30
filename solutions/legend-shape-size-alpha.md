# Solutions — Legend: Shape, Size & Alpha

1. ```r
   ggplot(mtcars) +
     geom_point(aes(disp, mpg, shape = factor(cyl))) +
     scale_shape_manual(values = c(4, 12, 24))
   ```
2. ```r
   ggplot(mtcars) +
     geom_point(aes(disp, mpg, size = hp)) +
     scale_size_continuous(range = c(3, 6))
   ```
3. Discrete size/alpha steps imply equal jumps between categories that
   do not exist; reserves `size`/`alpha` for continuous variables and
   use `shape` for categories.
