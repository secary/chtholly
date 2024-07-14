install.packages("tidyverse")
library(tidyverse)
data("mpg")


pacman::p_load(nycflights13)
flights

filter(flights,month == 1,day == 1)
flights %>% filter(carrier == "AA",month == 12, day == 5) %>%select(year,flight,dep_delay)
my_flight <- flights %>% filter(carrier == "AA",month == 12, day == 5) %>%select(year,flight,dep_delay)
my_flight <- select(flights,contains("time"))
delay <- my_flight %>% mutate(delay = dep_time - sched_dep_time)
