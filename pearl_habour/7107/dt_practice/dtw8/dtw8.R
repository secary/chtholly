library(tidyverse)
library(readxl)
library(car)
library(modelr)

movies0 <- read_excel('./data/movies.xlsx')
movies0

movies0 %>%
  ggplot(aes(x = runtime, y = score))+
  geom_point()+
  geom_smooth(method = 'lm')

m1<- lm(score ~ runtime, movies0)
summary(m1)

movies0$genre <- as.factor(movies0$genre) 
movies0

movies0 %>%
  ggplot(aes(x = genre, y = score, fill = genre))+
  geom_boxplot()

genre_lm <- lm(score ~ genre, movies0)

model_matrix(movies0, ~ genre)

summary(genre_lm)

m2 <- lm(score ~ runtime + genre, movies0)
summary(m2)

movies0 %>%
  ggplot(aes(x = runtime, y = score, colour = genre))+
  geom_point()+
  geom_smooth(method = 'lm',se = FALSE)

model_matrix(movies0, ~ runtime + genre)

Anova(m2)
