# Solutions — Line Graphs

1. **Unemployment over time:**
   ```r
   ggplot(economics) +
     geom_line(aes(date, unemploy), linewidth = 1)
   ```
   Check: `max(economics$unemploy)` is 15352 (thousands, Oct 2009).
2. **Two series in one plot (long data):**
   ```r
   long <- tidyr::pivot_longer(economics, cols = c(unemploy, uempmed),
     names_to = "series", values_to = "value")
   ggplot(long) +
     geom_line(aes(date, value, color = series), linewidth = 1)
   ```
   Check: `long` has 2 * 574 = 1148 rows.
3. **Storytelling:** one acceptable answer —
   ```r
   ggplot(economics) +
     geom_line(aes(date, unemploy), linewidth = 1, color = "steelblue") +
     labs(title = "US unemployment peaked after the 2008 crisis",
       x = "Year", y = "Unemployed (thousands)") +
     theme_minimal()
   ```
   Check: title states the conclusion, y axis carries units.
