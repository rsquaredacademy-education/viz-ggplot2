# Solutions — Bar Plots

1. **Counts per cylinder class:**
   ```r
   ggplot(mtcars) +
     geom_bar(aes(factor(cyl)), fill = "steelblue")
   ```
   Check: `table(mtcars$cyl)` gives 4→11, 6→7, 8→14 cars.
2. **Grouped bars with controlled gap:**
   ```r
   ggplot(mtcars) +
     geom_bar(aes(factor(cyl), fill = factor(gear)),
       position = position_dodge(width = 0.8))
   ```
   Check: the 4-cylinder/4-gear group has 8 cars
   (`sum(mtcars$cyl == 4 & mtcars$gear == 4)`).
3. **Storytelling:** one acceptable answer —
   ```r
   ggplot(mtcars) +
     geom_bar(aes(factor(cyl), fill = factor(gear)),
       position = position_dodge(width = 0.8)) +
     labs(title = "Eight-cylinder cars dominate the sample",
       x = "Cylinders", y = "Number of cars", fill = "Gears") +
     theme_minimal()
   ```
   Check: bars start at zero, title states the conclusion.
