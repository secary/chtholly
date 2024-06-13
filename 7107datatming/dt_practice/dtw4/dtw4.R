# library packages
library(readxl)
library(inspectdf)
library(tidyverse)

# read the data in xlsx and add it into a new tibble 
rbc<-read_excel("./data/rbc2024_clean.xlsx",na=c("NA","XX"))
rbc

# count na in the data
inspect_na(rbc)

rbc<-filter(rbc,!(is.na(fitness)|is.na(RBC)))
rbc

# remove the name column
rbc<-
  rbc %>%
  select(-name)
rbc

# count sex types
rbc %>%
  count(sex)

# convert male to m
rbc<-
  rbc %>%
  mutate(
    sex = fct_recode(sex,"M" = "male")
  )
rbc %>% count(sex)

# if you want to convert the variable to factor manually
rbc$sex<-rbc$sex %>%
  as.factor()
rbc

# filter the rows which are over 100
rbc %>%
  filter(!between(fitness,0,100))
