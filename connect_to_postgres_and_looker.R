library(RPostgreSQL)

drv <- dbDriver("PostgreSQL")

pass <- readline(prompt = "Enter password: ")

con <- 
  dbConnect(
    drv
    , dbname="polymer_production"
    , host="localhost"
    , port=5442
    , user="jhower"
    , password=pass
)

looker_setup(id = readLines("authenticate")[1],
             secret = readLines("authenticate")[2],
             api_path = "https://api-looker.gloo.us/api/3.0")
