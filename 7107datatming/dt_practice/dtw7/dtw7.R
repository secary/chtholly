library(tidyverse)
library(car)
library(inspectdf)

pop0 <- read_csv('./data/population.csv')
inspect_na(pop0)
pop0

ggplot(pop0,aes(y = pop_growth_2015_20,x = med_age_all))+
  geom_point()+
  geom_smooth(method = 'lm')

ggplot(pop0,aes(y = pop_growth_2015_20,x = med_age_male))+
  geom_point()+
  geom_smooth(method = 'lm')

ggplot(pop0,aes(y = pop_growth_2015_20,x = med_age_female))+
  geom_point()+
  geom_smooth(method = 'lm')

ggplot(pop0,aes(y = pop_growth_2015_20,x = ed_index_2015))+
  geom_point()+
  geom_smooth(method = 'lm')

ggplot(pop0,aes(y = pop_growth_2015_20,x = continent))+
  geom_boxplot()

ggplot(pop0,aes(y = pop_growth_2015_20,x = inequality))+
  geom_point()+
  geom_smooth(method = 'lm')

ggplot(pop0,aes(y = pop_growth_2015_20,x = per_urban))+
  geom_point()+
  geom_smooth(method = 'lm')

med_age_all_lm <- lm(pop_growth_2015_20 ~ med_age_all,data = pop0)

med_age_male_lm <- lm(pop_growth_2015_20 ~ med_age_male,data = pop0)

med_age_female_lm <- lm(pop_growth_2015_20 ~ med_age_female,data = pop0)

ed_index_2015_lm <- lm(pop_growth_2015_20 ~ ed_index_2015,data = pop0)

inequality_lm <- lm(pop_growth_2015_20 ~ inequality,data = pop0)

per_urban_lm <- lm(pop_growth_2015_20 ~ per_urban,data = pop0)

summary(inequality_lm)

lm_pop <- lm(pop_growth_2015_20 ~ 
               med_age_all+
               med_age_male+
               med_age_female+
               ed_index_2015+
               inequality+
               continent+
               per_urban,data = pop0)

lm_pop               

summary(lm_pop)

Anova(lm_pop)  
  