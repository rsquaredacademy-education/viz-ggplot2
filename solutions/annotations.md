# Solutions — Text Annotations

1. ```r
   top <- mtcars[which.max(mtcars$mpg), ]
   ggplot(mtcars) +
     geom_point(aes(disp, mpg)) +
     annotate("text", x = top$disp, y = top$mpg,
       label = "Toyota Corolla", hjust = -0.1)
   ```
   Check: the max-mpg car is the Toyota Corolla at 33.9 mpg.
2. ```r
   efficient <- mtcars[mtcars$mpg > 30, ]
   efficient$model <- rownames(efficient)
   ggplot(mtcars) +
     geom_point(aes(disp, mpg)) +
     geom_text(data = efficient, aes(disp, mpg, label = model),
       hjust = -0.1, size = 3)
   ```
   Check: 4 cars exceed 30 mpg (`sum(mtcars$mpg > 30)`).
3. Label only points that change the conclusion (extremes, surprises);
   every extra label taxes the reader for no new insight.
