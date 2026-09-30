# Solutions — Labels

1. ```r
   ggplot(mtcars) +
     geom_point(aes(disp, mpg)) +
     labs(x = "Displacement (cu. in.)", y = "Miles per gallon",
       title = "Displacement vs mileage")
   ```
2. ```r
   ggplot(mtcars) +
     geom_point(aes(disp, mpg, color = factor(cyl))) +
     scale_color_manual(name = "Cylinders",
       values = c("red", "blue", "green"))
   ```
3. One acceptable answer: `labs(title = "Heavier engines get fewer
   miles per gallon")` — the title states the conclusion, not the topic.
