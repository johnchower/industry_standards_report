# Produce summary data for report

data.frame(n = c(1:4, 1, 1:7)
           , p = c(rep(7, times = 4), 28, rep(1, times = 7))) %>%
  group_by(n, p) %>%
  mutate(min_date = get_time_period_minus_n(n, p)[1]
         , max_date = get_time_period_minus_n(n, p)[2]) %>%
  do({
    active_user_count0 <- 
      filter(user_platform_action_date 
             , date >= .$min_date
             , date <= .$max_date) %>%
      select(user_id) %>%
      unique %>%
      nrow 
    existing_user_count0 <- 
      filter(user_platform_action_date 
             , date >= existing_user_cutoff_date
             , date <= .$max_date) %>%
      select(user_id) %>%
      unique %>%
      nrow 
    data.frame(active_user_count = active_user_count0
               , existing_user_count = existing_user_count0) %>%
      mutate(active_user_pct = active_user_count/existing_user_count)
  }) %>%
  arrange(p, n) %>%
  mutate(periods_back = n
         , period_size = ifelse(p == 1
                                , "day"
                                , ifelse(p == 7
                                         , "week"
                                         , ifelse(p == 28
                                                  , "month"
                                                  , NA)))
  ) %>%
  ungroup %>%
  select(-n, -p) %>%
  melt(id.vars = c("periods_back", "period_size")) %>% .view
         
