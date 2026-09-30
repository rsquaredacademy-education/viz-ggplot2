# Solutions — Scatter Plots

1. **Color by cylinders with a plain title:**
   ```r
   ggplot(mtcars) +
     geom_point(aes(disp, mpg, color = factor(cyl))) +
     scale_color_manual(name = "Cylinders",
       values = c("red", "blue", "green"))
   ```
   The legend title reads `Cylinders` instead of `factor(cyl)`.
2. **Trend line without the confidence band:**
   ```r
   ggplot(mtcars) +
     geom_point(aes(disp, mpg)) +
     geom_smooth(aes(disp, mpg), formula = y ~ x, se = FALSE)
   ```
   `formula = y ~ x` silences the console message; `se = FALSE` drops the band.
3. **Storytelling:** one acceptable answer —
   ```r
   ggplot(mtcars) +
     geom_point(aes(disp, mpg, color = factor(cyl)), size = 2.5) +
     labs(title = "Heavier engines get fewer miles per gallon",
       x = "Displacement (cu. in.)", y = "Miles per gallon",
       color = "Cylinders") +
     theme_minimal()
   ```
   Check: title states the conclusion, axes carry units, theme is restrained.
