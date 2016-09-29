# Find out which month it is.

run_month <- as.numeric(format(run_date, '%m'))
month_sequence <- 0:(run_month -1)

# Create (summary) data for graphs
summary_data <-
  data.frame(n = c(1:4,
                   1:7,
                   month_sequence
                  )
             , p = c(rep(7, times = 4),
                     rep(1, times = 7),
                     rep("month", times = run_month)
                    )
             , stringsAsFactors = F
  ) %>%
  group_by(n, p) %>%
  mutate(min_date = get_time_period_minus_n(n, p)[1]
         , max_date = get_time_period_minus_n(n, p)[2]) %>%
  ungroup %>%
  group_by(min_date, max_date) %>%
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
  melt(id.vars = c("min_date", "max_date")) %>%
  mutate(variable = as.character(variable))

rm(run_month
   , month_sequence)

# DAU for this week
DAU_this_week <- summary_data %>%
  filter(max_date - min_date + 1 == 1
         , variable %in% c("active_user_count", "active_user_pct")) %>%
  select(min_date, max_date, variable, value) %>%
  dcast(min_date + max_date ~ variable, value.var = "value") %>%
  rename(day = min_date)

# WAU for this month
WAU_this_month <- summary_data %>%
  filter(max_date - min_date + 1 == 7
         , variable %in% c("active_user_count", "active_user_pct")) %>%
  select(min_date, max_date, variable, value) %>%
  dcast(min_date + max_date ~ variable, value.var = "value") %>%
  rename(week_beginning = min_date)

# MAU each month this year
MAU_this_year <- summary_data %>%
  filter(max_date - min_date + 1 >= 28, max_date - min_date + 1 <= 31  
         , variable %in% c("active_user_count"
                           , "active_user_pct"
                           , "existing_user_count")
  ) %>%
  select(min_date, max_date, variable, value) %>%
  dcast(min_date + max_date ~ variable, value.var = "value") %>%
  rename(month_beginning = min_date)

 
