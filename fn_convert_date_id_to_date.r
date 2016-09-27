convert_date_id_to_date <- function(date_id){

    year <- substr(x = date_id
                  , start = 1
                  , stop = 4)
    month <- substr(x = date_id
                   , start = 5
                   , stop = 6)
    day <- substr(x = date_id
                 , start = 7
                 , stop = 8)
    as.Date(paste(year, month, day, sep = "-"))
}
