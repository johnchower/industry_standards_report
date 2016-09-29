get_time_period_minus_n <- function(n = 1
                                    , p = 7
                                    , rd = run_date){
  p_num <- as.numeric(p)
  if(!is.na(p_num)){
    min <- rd - p_num*n
    max <- min + p_num - 1
  } else if(p == "month"){
    rd_month <- as.Date(format(rd, '%Y-%m-01'))
    min <- rd_month - months(n)
    max <- rd_month - months(n-1) - days(1)
  } 
  c(min, max)
}

