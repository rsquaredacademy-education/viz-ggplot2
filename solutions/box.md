# Solutions — Box Plots

1. **Mileage by cylinders:**
   ```r
   ggplot(mtcars) +
     geom_boxplot(aes(factor(cyl), mpg))
   ```
   Check: median mpg for 4-cylinder cars is 26 (`median(mtcars$mpg[mtcars$cyl == 4])`).
2. **Single-variable boxplot (modern syntax):**
   ```r
   ggplot(mtcars) +
     geom_boxplot(aes(y = mpg))
   ```
   No `x = factor(1)` needed on modern ggplot2; the plot shows one box.
3. **Storytelling:** one acceptable answer —
   ```r
   ggplot(mtcars) +
     geom_boxplot(aes(factor(cyl), mpg, fill = factor(cyl))) +
     labs(title = "Four-cylinder cars deliver the highest mileage",
       x = "Cylinders", y = "Miles per gallon", fill = "Cylinders") +
     theme_minimal() +
     theme(legend.position = "none")
   ```
   Check: redundant legend removed, title states the conclusion.
