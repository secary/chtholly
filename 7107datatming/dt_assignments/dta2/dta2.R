library(tidyverse)
library(inspectdf)

ysn = 1942340
filenum <- (ysn+1) %% 3
arch0 <- read.csv('./data/archery_0.csv')
