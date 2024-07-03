library(tidyverse)
library(inspectdf)
library(caret)

# q1
# load csv and set data
ysn = 1942340
filenum <- (ysn+1) %% 3
arch0 <- read.csv('./data/archery_0.csv')
head(arch0,10)

# q2
# q2(a)
# add row numbers and store the new tibble for comparison
arch1 <- mutate(arch0,Archer = (1:555))
arch1 <- rename(arch1,ID = Archer)

# q2(b)
# calculate the xp days
arch1 <- mutate(arch1,XP = dmy('15-06-2024') - dmy(Commenced))
arch1 <- relocate(arch1,"XP",.before = Commenced)

# q2(c)
# extract targets numbers and arrows numbers
arch1 <- mutate(arch1,Targets = str_match(arch1$RES, 'hit (\\d+) times from (\\d+) shots')[,2])
arch1 <- mutate(arch1,Arrows = str_match(arch1$RES, 'hit (\\d+) times from (\\d+) shots')[,3])
arch1 <- mutate(arch1,RES = NULL)
arch1 <- relocate(arch1,"Arrows",.before = Targets)
head(arch1,10)

# q4
# change xp days to integers
arch1$XP <- as.integer(arch1$XP)
# change commenced dates into year-month-day format
arch1$Commenced <- dmy(arch1$Commenced)
# change id to factor type
arch1$ID <- as.factor(arch1$ID)
# change arrows and targets into integers
arch1$Arrows <- as.integer(arch1$Arrows)
arch1$Targets <- as.integer(arch1$Targets)
# check is there any impossible data in shots and targets
is.na(arch1$Arrows)
is.na(arch1$Targets)
# check the whole tibble
inspect_na(arch1)
head(arch1,10)

# q5
# take the random sample
set.seed(1942340)
arch_sample <- sample_n(arch1,450,replace = FALSE)
head(arch_sample,10)

# q6
# calculate the accuracy of archers
arch_sample <- mutate(arch_sample,acc = Targets/Arrows)

# q7
# summarize the sample
inspect_num(arch_sample)

# q8
arch_preprocess <- preProcess(arch_sample)
arch_predict <- predict(arch_preprocess,arch_sample)                      
head(arch_predict,10)

# q9(d)
ggplot(arch_predict,aes(XP))+
  geom_histogram()

