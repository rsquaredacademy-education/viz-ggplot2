# Solutions — Modify Legend (Guides)

1. ```r
   ggplot(mtcars) +
     geom_point(aes(disp, mpg, color = factor(cyl))) +
     scale_color_manual(values = c("red", "blue", "green"),
       guide = guide_legend(title = "Cylinders", title.hjust = 0.5))
   ```
2. ```r
   ggplot(mtcars) +
     geom_point(aes(disp, mpg, color = factor(cyl))) +
     scale_color_manual(values = c("red", "blue", "green"),
       guide = guide_legend(label.position = "right"))
   ```
3. ```r
   ggplot(mtcars) +
     geom_point(aes(disp, mpg, color = hp)) +
     scale_color_continuous(guide = guide_colorbar(
       barwidth = 10, barheight = 3))
   ```
