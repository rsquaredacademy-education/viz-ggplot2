# Solutions — Legend: Color & Fill

1. ```r
   ggplot(mtcars) +
     geom_point(aes(disp, mpg, color = factor(cyl))) +
     scale_color_manual(values = c("red", "blue", "green"))
   ```
2. ```r
   ggplot(mtcars) +
     geom_point(aes(disp, mpg, color = factor(cyl))) +
     scale_color_manual(values = c("red", "blue", "green"),
       labels = c("Four", "Six", "Eight"))
   ```
3. ```r
   ggplot(mtcars) +
     geom_point(aes(disp, mpg, color = factor(cyl))) +
     scale_color_manual(values = c("red", "blue", "green"),
       breaks = c(4, 8))
   ```
   `breaks` hides the 6-cylinder key but keeps its points;
   `limits` would drop those rows with a warning.
