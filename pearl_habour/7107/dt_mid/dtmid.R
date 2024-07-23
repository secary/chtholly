library('tidyverse')
library('inspectdf')
library('car')

data('msleep')
msleep

data('mpg')
mpg

x <- c(3:5, 11:8, 8 + 0:5)
(ux <- unique(x))
(u2 <- unique(x, fromLast = TRUE)) # different order
stopifnot(identical(sort(ux), sort(u2)))

str_match("I have 120 watermelons, which weigh 501.35kgs", "(\\d+)kgs")

msleep
mean(msleep$sleep_total)
carnivora <- tibble(filter(msleep, order == 'Carnivora'))
mean(carnivora$sleep_total)
summary(msleep$bodywt)
summary(msleep$awake)
41.750-0.174

ggplot(msleep,aes(vore, sleep_total))+
  geom_boxplot()

summary(msleep$sleep_total)
median <- tibble(filter(msleep, sleep_total == 10.10))


lm_m <- lm(cty ~ displ+drv,mpg)
summary(lm_m)
pred_value <- tibble(displ = 1.9,drv = 'f')
predict(lm_m,pred_value,interval = 'confidence', 0.9)

anova(lm_m)
displ <- tibble(filter(mpg,displ == 1.8))
mean(displ$cty)
ggplot(mpg,aes(x = displ, cty, col = drv))+
  geom_point()+
  geom_smooth(method = "lm")

