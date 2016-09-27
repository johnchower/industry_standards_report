parameters <- read.csv(file = "./parameters.csv",
                       stringsAsFactors = F)

assign_parameters <- function(value, type){
  char_value <- as.vector(value)

  if(type == 'logical'){
    out <- as.logical(char_value)
  } else if(type == 'numeric'){
    out <- as.numeric(char_value)
  } else if(type == 'integer'){
    out <- as.integer(char_value)
  } else if(type == 'character'){
    out <- as.character(char_value)
  } else if(type == 'date'){
    out <- convert_date_id_to_date(char_value)
  } else {
    out <- char_value
  }

  return(out)
}

apply(X = parameters,
      MARGIN = 1, 
      FUN = function(df){
    assign(df['name'],
           assign_parameters(df['value'], df['type']),
           envir = .GlobalEnv)
  })         

rm(assign_parameters)
