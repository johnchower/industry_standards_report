# Produce summary data for report

summary_data <- data.frame(n = c(1:4, 1, 1:7)
           , p = c(rep(7, times = 4), 28, rep(1, times = 7))) %>%
  group_by(n, p) %>%
  mutate(min_date = get_time_period_minus_n(n, p)[1]
         , max_date = get_time_period_minus_n(n, p)[2]) %>%
  ungroup %>%
  group_by(n, p, min_date, max_date) %>%
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
  ungroup %>%
  select(-n, -p) %>% 
  melt(id.vars = c("min_date", "max_date")) %>%
  mutate(variable = as.character(variable))

# DAU for this week

DAU_this_week <- summary_data %>%
  filter(max_date - min_date + 1 == 1
         , variable == "active_user_count") %>%
  select(min_date, variable, value) %>%
  dcast(min_date ~ variable, value.var = "value")

# WAU for this month

WAU_this_month <- summary_data %>%
  filter(max_date - min_date + 1 == 7
         , variable == "active_user_count") %>%
  select(min_date, variable, value) %>%
  dcast(min_date ~ variable, value.var = "value")
