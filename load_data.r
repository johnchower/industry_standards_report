# Download all user platform actions since Jan 1, 2016

user_platformaction_date <- 
  run_inline_query(
    model = "gloo"
    , view = "user_platform_action_facts"
    , fields = c(
      "user_platform_action_facts.id"
      ,
      "user_dimensions.id"
      ,
      "date_dim.date"
      ,
      "platform_action_fact.date_id"
      )
    , filters = list(c("user_platform_action_facts.id", "2233701"))    
  )

user_platformaction_date %>% nrow

head(user_platformaction_date)

