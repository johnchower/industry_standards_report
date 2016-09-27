get_time_period_minus_n <- function(n = 1
                                    , p = 7
                                    , rd = run_date){
  min <- rd - p*n
  max <- min + p -1
  c(min, max)
}

