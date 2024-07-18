library(tidyverse)
library(tidymodels)
library(car)

test_runs <- read_csv('./data/test_runs_original.csv')

test_runs <- test_runs %>%
  mutate(test_runs, country = str_match(test_runs$Player,'\\((.+)\\)')[,2])

test_runs[3,]$country

str_replace(test_runs[3,]$country,'(.+)/','')

test_runs <- test_runs %>%
  mutate(test_runs, country = str_replace(test_runs$country,'(.+)/',''))

head(test_runs)

test_runs <- test_runs %>%
  mutate(test_runs, Player = str_replace(test_runs$Player,'\\((.+)\\)',''))

head(test_runs)

test_runs <- test_runs %>%
  mutate(test_runs, HS = str_match(test_runs$HS,'(\\d)+')[,2])

head(test_runs)

span_df <- str_match(test_runs$Span,'(\\d+)-(\\d+)')
start_year <- as.integer(span_df[,2])
end_year <- as.integer(span_df[,3])

test_runs <- test_runs %>%
  mutate(test_runs, Years = end_year - start_year)

test_runs <-  
  relocate(test_runs,'Years', .after = Span)

head(test_runs)

test_runs <-
  rename(test_runs, rownum = ...1, Centuries = `100`, Fifties = `50`, Zeros = `0`)

head(test_runs)

test_runs$rownum <- 
  as.factor(test_runs$rownum)

test_runs$Player <-
  as.factor(test_runs$Player)

test_runs$Span <-
  as.factor(test_runs$Span)
  
head(test_runs)

