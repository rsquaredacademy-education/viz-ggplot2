# Solutions — Histograms

1. **Mileage distribution:**
   ```r
   ggplot(mtcars) +
     geom_histogram(aes(mpg), bins = 10, fill = "steelblue",
       color = "white", linewidth = 0.5)
   ```
   Check: all 32 cars are counted (`sum(ggplot_build(p)$data[[1]]$count)` is 32).
2. **Density instead of counts:**
   ```r
   ggplot(mtcars) +
     geom_histogram(aes(mpg, y = after_stat(density)), bins = 10,
       fill = "steelblue", color = "white", linewidth = 0.5)
   ```
   `after_stat()` replaces the deprecated `..density..` syntax.
3. **Storytelling:** one acceptable answer —
   ```r
   ggplot(mtcars) +
     geom_histogram(aes(mpg), bins = 10, fill = "steelblue",
       color = "white", linewidth = 0.5) +
     labs(title = "Most cars cluster between 15 and 25 mpg",
       x = "Miles per gallon", y = "Number of cars") +
     theme_minimal()
   ```
   Check: bin width disclosed by intent (10 bins), title states the conclusion.
