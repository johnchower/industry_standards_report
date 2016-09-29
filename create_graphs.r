# DAU this week

DAU_this_week %>%
  tufte_bar_chart(x_var = "day"
                  , y_var = "active_user_count"
                  , ybreaks = seq(0, 1200, 200)
                  , theme_tufte_opts = list(base_size = 18
                                            , ticks = T)
  )

WAU_this_month %>%
  tufte_bar_chart(x_var = "week_beginning"
                  , y_var = "active_user_count"
                  , ybreaks = seq(0, 1200, 200)
                  , theme_tufte_opts = list(base_size = 18
                                            , ticks = T)
  )

MAU_this_year %>%
  tufte_bar_chart(x_var = "month_beginning"
                  , y_var = "active_user_count"
                  , ybreaks = seq(0, 1200, 200)
                  , theme_tufte_opts = list(base_size = 18
                                            , ticks = T)
  )
