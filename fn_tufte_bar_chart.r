tufte_bar_chart <- function(df
                            , ybreaks=0
                            , x_var, y_var
                            , theme_tufte_opts = list(base_size = 36, ticks = T)
                            , ...){
  df %>%
    ggplot(aes_string(x=x_var, y=y_var)) +
      do.call(theme_tufte, theme_tufte_opts) +
      geom_bar(fill = "#888888", stat = "identity", width=.25) +
      scale_y_continuous(breaks=ybreaks,...) +
      geom_hline(yintercept=ybreaks, col="white", lwd=1) +
      theme(axis.title = element_blank())
} 
