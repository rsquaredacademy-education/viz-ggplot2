# Solutions — Themes

1. ```r
   ggplot(mtcars) +
     geom_point(aes(disp, mpg)) +
     theme_minimal()
   ```
2. ```r
   ggplot(mtcars) +
     geom_point(aes(disp, mpg)) +
     theme_minimal() +
     theme(text = element_text(size = 14))
   ```
3. One acceptable answer:
   ```r
   theme_rsquared <- function() {
     theme_minimal() +
       theme(text = element_text(size = 13),
         plot.title = element_text(face = "bold"),
         legend.position = "bottom")
   }
   ```
   It standardizes fonts, title emphasis and legend placement so every
   figure ships with the same look.
