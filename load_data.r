# Download all user platform actions since Jan 1, 2016

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
         , FUN = function(df){assign_by_colnames_listversion(df, name_list)})
    
}
