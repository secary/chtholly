library(tidyverse)
library(inspectdf)

data('msleep')
msleep

ggplot(msleep, aes(x = sleep_total, y = sleep_rem))+
  geom_point()+
  geom_smooth(method = 'lm')

data('diamonds')
diamonds

ggplot(diamonds, aes(color, price, colour  = color))+
  geom_boxplot()


data('midwest')
midwest

lm_percollege <- lm(percollege ~ log(poptotal), midwest)
summary(lm_percollege)
pred_value <- tibble(poptotal = 10000)
predict(lm_percollege, pred_value, interval = 'confidence', level = 0.99)

lm_state <- lm(percollege ~ log(poptotal) + state, midwest)
summary(lm_state)

as.numeric(lm_state$coefficients)

pred_value <- tibble(poptotal = 10000, state = 'OH')
predict(lm_state, pred_value, interval = 'confidence', level = 0.99)

predict(lm_state, pred_value, interval = 'confidence', level = 0.95)

mw_sep <- lm(percollege ~ log(poptotal)+state+log(poptotal):state, 
             data=midwest)
summary(mw_sep)
anova(mw_sep)
predict(mw_sep, pred_value, interval = 'prediction', level = 0.95)
