library(tidyverse)
library(inspectdf)
library(caret)
library(moments)

# q1 load csv and set data
ysn = 1942340
filenum <- (ysn+1) %% 3
arch0 <- read.csv('./data/archery_0.csv')
head(arch0,10)

# q2 tidy up data
# q2(a)
# add row numbers and store the new tibble for comparison
arch1 <- mutate(arch0,Archer = (1:555))
arch1 <- rename(arch1,id = Archer)

# q2(b)
# calculate the xp days
arch1 <- mutate(arch1,xp = dmy('15-06-2024') - dmy(Commenced))
arch1 <- relocate(arch1,"xp",.before = Commenced)

# q2(c)
# extract targets numbers and arrows numbers
arch1 <- mutate(arch1,targets = str_match(arch1$RES, 'hit (\\d+) times from (\\d+) shots')[,2])
arch1 <- mutate(arch1,arrows = str_match(arch1$RES, 'hit (\\d+) times from (\\d+) shots')[,3])
arch1 <- mutate(arch1,RES = NULL)
arch1 <- relocate(arch1,"arrows",.before = targets)
head(arch1,10)

# q4 taming data
# change column titles in lower case
arch1 <- rename(arch1,commenced = Commenced)
# change xp days to integers
arch1$xp <- as.integer(arch1$xp)
# change commenced dates into year-month-day format
arch1$commenced <- dmy(arch1$commenced)
# change id to factor type
arch1$id <- as.factor(arch1$id)
# change arrows and targets into integers
arch1$arrows <- as.integer(arch1$arrows)
arch1$targets <- as.integer(arch1$targets)
# check is there any impossible data in shots and targets
is.na(arch1$arrows)
is.na(arch1$targets)
# check the whole tibble
inspect_num(arch1)
# delete the wrong date
arch1 <- filter(arch1,xp < 45456)
inspect_num(arch1)
head(arch1,10)

# q5 take the random sample
set.seed(1942340)
arch_sample <- sample_n(arch1,450,replace = FALSE)
head(arch_sample,10)

# q6 calculate the accuracy of archers
arch_sample <- mutate(arch_sample,acc = targets/arrows)

# q7 summarize the sample
inspect_num(arch_sample)

# q8 predict data
# preprocess the sample data
arch_preprocess <- preProcess(arch_sample)
# predict with the preprocess data
arch_predict <- predict(arch_preprocess,arch_sample)                      
head(arch_predict,10)

# q9
# q9(d)
# plot the histograms of each variable
# xp
ggplot(arch_predict,aes(xp)) + 
  geom_histogram()
skewness(arch_predict$xp)
# commenced date
ggplot(arch_predict,aes(commenced)) + 
  geom_histogram()
skewness(arch_predict$commenced)
# arrows
ggplot(arch_predict,aes(arrows)) + 
  geom_histogram()
skewness(arch_predict$arrows)
# targets
ggplot(arch_predict,aes(targets)) + 
  geom_histogram()
skewness(arch_predict$targets)
#accuracy
ggplot(arch_predict,aes(acc)) + 
  geom_histogram()
skewness(arch_predict$acc)

# q10 get the scatter plot of acc against xp
ggplot(arch_sample,aes(x = xp,y = acc))+
  geom_point()+
  geom_smooth()

# q11 box-cox transform the data
# q11(a)
# use box-cox 
arch_sample_bc <- BoxCoxTrans(y = arch_sample$acc, x = arch_sample$xp, lambda = seq(-10,10,0.1))
arch_sample_bc$lambda
# q11(b)
# predict transformation and add it into a new column
arch_sample<- mutate(arch_sample,acc_bc = predict(arch_sample_bc,arch_sample$acc))
arch_sample

# q12 plots with the box-cox transformed data
# plot the scatter plot of transformed data against xp
ggplot(arch_sample,aes(x = xp,y = acc_bc))+
  geom_point()+
  geom_smooth()
# plot the histogram and get skewness
ggplot(arch_sample,aes(acc_bc))+
  geom_histogram()
skewness(arch_sample$acc_bc)

# q13
# q13(c) build the linear model 
arch_lm <- lm(acc_bc ~ xp,arch_sample)
summary(arch_lm)
as.numeric(arch_lm$coefficients)

# q15 predict with the linear model
pred_values <- tibble(xp = c(2*365,5*365,10*365,15*365,20*365,25*365))
pred_values <- mutate(pred_values, fit = predict(arch_lm,pred_values,interval = 'confidence',level = 0.99)[,1])
pred_values <- mutate(pred_values,lower = predict(arch_lm,pred_values,interval = 'confidence',level = 0.99)[,2])
pred_values <- mutate(pred_values,upper = predict(arch_lm,pred_values,interval = 'confidence',level = 0.99)[,3])
# inverse the box-cox transformed data 
pred_values <- mutate(pred_values, fit = (fit + 1) * arch_sample_bc$lambda * ( 1 / arch_sample_bc$lambda))
pred_values <- mutate(pred_values, lower = (lower + 1) * arch_sample_bc$lambda * ( 1 / arch_sample_bc$lambda))
pred_values <- mutate(pred_values, upper = (upper + 1) * arch_sample_bc$lambda * ( 1 / arch_sample_bc$lambda))