
tufte_grouped_bar_chart <- function(df,
                            ybreaks=0,
                            x_var, y_var, group,
                            ...){
  df %>%
    ggplot(aes_string(x=x_var, y=y_var)) +
      theme_tufte(base_size = 36 
                  , ticks = F) +
      geom_bar(aes_string(fill = group), position = "dodge", stat = "identity", width=.25) +
      scale_fill_manual(
        values=c(
          #"#71bf44"
          "#1fbdd6"
          , "#888888"
          #, "#eeb21e"
          #, "#F90005"
      )) +
      labs(fill = "") +
      scale_y_continuous(breaks=ybreaks,...) +
      geom_hline(yintercept=ybreaks, col="white", lwd=1) +
      theme(axis.title = element_blank())
} 
