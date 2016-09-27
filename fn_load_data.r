# Function: load_data
# Reads all csv files in looker.csvs and static.csvs
# Outputs a list of data frames for further manipulation.

load_data <- function(df.list=name_list,
                      looker.csvs=paste(find_root(has_file("README.md")),
                                          "looker_csvs",
                                          sep = "/"),
                      static.csvs=paste(find_root(has_file("README.md")),
                                          "static_csvs", 
                                          sep = "/")){
if(length(dir(looker.csvs)) > 0){
  x <- looker.csvs %>%
    {paste(., dir(.), sep = "/")} %>%
    lapply(FUN = function(path)read.csv(path, stringsAsFactors = F)) 
} else {x <- list()}

if(length(dir(static.csvs)) > 0){
  y <- static.csvs %>%
    {paste(., dir(.), sep = "/")} %>%
    lapply(FUN = function(path)read.csv(path, stringsAsFactors = F))
} else {y <- list()}

c(x,y)
}
