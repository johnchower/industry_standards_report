if(use_lookr_to_get_data){

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

} else {

  name_list <- fromJSON('./name_list.JSON')

  base.df.list <- load_data() 
  lapply(base.df.list
         , FUN = function(df){
            assign_by_colnames_listversion(df, name_list)
  })
    
}

rm(assign_by_colnames
   , assign_by_colnames_listversion
   , base.df.list
   , name_list)

# Format the date column of user_platform_action_date
did <- user_platform_action_date$date_id
year <- substr(did, 1, 4)
month <- substr(did, 5, 6)
day <- substr(did, 7, 8)
date <- as.Date(paste(year, month, day, sep="-"))

user_platform_action_date <- 
  cbind(user_platform_action_date
        , data.frame(date)) %>%
    select(-date_id)

rm(did, year, month, day, date)
