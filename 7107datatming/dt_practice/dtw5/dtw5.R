library(tidyverse)
library(inspectdf)
library(caret)
library(moments)
library(sp) 

pop0<-read_csv("./data/population.csv")
inspect_na(pop0)
popz <- (pop0$population-mean(pop0$population,na.rm=TRUE))/sd(pop0$population,na.rm=TRUE)

popmaxtomin<-(pop0$population-min(pop0$population,na.rm=TRUE))/(max(pop0$population,na.rm=TRUE)-min(pop0$population,na.rm=TRUE))

pop0<-mutate(pop0,pop_z=popz)
pop0<-mutate(pop0,pop_max_min=popmaxtomin)
pop0

sd(pop0$pop_z,na.rm = TRUE)-1
mean(pop0$pop_z,na.rm = TRUE)

words<-read_tsv('./data/wordrecall.txt')
ggplot(words,aes(x=time,y=prop))+
  geom_point()+
  geom_smooth()

ggplot(words,aes(x=log(time),y=log(prop)))+
         geom_point()

ggplot(words,aes(x=time,y=log(prop)))+
  geom_point()

ggplot(words,aes(x=log(time),y=prop))+
  geom_point()
  geom_smooth()
  