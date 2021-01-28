library(dplyr)
library(DBI)
library(RMySQL)
library(ggplot2)

MyDataBase <- dbConnect(
    drv = RMySQL::MySQL(),
    dbname = "shinydemo",
    host = "shiny-demo.csa7qlmguqrf.us-east-1.rds.amazonaws.com",
    username = "guest",
    password = "guest")

dbListTables(MyDataBase)

dbListFields(MyDataBase, 'CountryLanguage')
dbGetQuery(MyDataBase, "select * from CountryLanguage Where Language='Spanish'")

DataDB_SP <- dbGetQuery(MyDataBase, "select * from CountryLanguage Where Language='Spanish'")

names(DataDB_SP)
class(DataDB_SP.df)

DataDB_SP.df <- as.data.frame(DataDB_SP) 


DataDB_SP.df %>% ggplot(aes( x = CountryCode, y=Percentage, fill = IsOfficial )) + 
    geom_bin2d() +
    coord_flip()
