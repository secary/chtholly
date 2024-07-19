library(tidyverse)
pop<-read_csv('./data/population.csv')

ggplot(pop,aes(x=pop_growth_2015_20,y=mean_years_school_2015))+
  geom_point()+
  geom_smooth(method='lm')

lm_pop<-lm(pop_growth_2015_20 ~ mean_years_school_2015, 
           data = pop)
summary(lm_pop)

new_data<-tibble(mean_years_school_2015=c(5,12))
predict(lm_pop,newdata = new_data)

predict(lm_pop,newdata = new_data,interval = 'prediction',level = 0.95)
predict(lm_pop,newdata = new_data,interval = 'confidence',level = 0.99)

plot(lm_pop,which = 1)

plot(lm_pop,which = 2)

plot(lm_pop,which = 3)

plot(lm_pop)

