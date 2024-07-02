library(tidyverse)
library(inspectdf)

#q1
ysn = 1942340
filenum <- (ysn+1) %% 3
arch0 <- read.csv('./data/archery_0.csv')
head(arch0,10)

#q2
#q2(a)
arch0<-mutate(arch0,Archer = (1:555))
arch0<-rename(arch0,ID = Archer)

#q2(b)
arch0<-mutate(arch0,XP = dmy('15-06-2024') - dmy(Commenced))
arch0<-relocate(arch0,"XP",.before = Commenced)

#q2(c)
arch0<-mutate(arch0,Arrows = str_match(arch0$RES, 'hit (\\d+) times from (\\d+) shots')[,2])
arch0<-mutate(arch0,Targets = str_match(arch0$RES, 'hit (\\d+) times from (\\d+) shots')[,3])
arch0<-mutate(arch0,RES = NULL)
head(arch0,10)

