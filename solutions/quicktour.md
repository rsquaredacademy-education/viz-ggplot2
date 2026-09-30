# Solutions — Quick Tour

1. ```r
   ggplot(mtcars) +
     geom_point(aes(disp, mpg))
   ```
2. ```r
   ggplot(mtcars) +
     geom_point(aes(disp, mpg, color = factor(cyl))) +
     labs(title = "Displacement vs mileage")
   ```
3. `qplot()` was deprecated in ggplot2 3.4.0; new code uses
   `ggplot() + geom_*()`, while `qplot()` survives only in old
   StackOverflow answers.
