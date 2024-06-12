#Load the required packages
library(tidyverse)
library(inspectdf)
library(lubridate)
library(caret)
library(moments)
library(tidymodels)
library(ISLR)
library(car)

# Your student number goes here
ysn = 1942340
# Calculate your student number modulo 3
filenum <- ysn %% 3
filenum
filename <- paste0("./data/afl_",filenum,".csv")
filename

# Read in the data
afl<-read_csv("./data/afl_2.csv")
# Display the first 10 lines of the data
head(afl,10)

#Use dim to show the numbers of rows and columns
dim(afl)

# Set the random seed
set.seed(1942340)
# Use sample_n to get the random permutation of the rows
afl1<-sample_n(afl,18,replace = FALSE)
afl1

# Use mutate to add a column at the far right of the data set
afl1<-mutate(afl1,Rownumber=c(1:18))
# Then use relocate to move the new column to the far left
afl1<-relocate(afl1,"Rownumber", .before = Team)
afl1

# Use filter to extract the rows without text data.
afl1<-filter(afl1,Team!="testX1")
# Make sure the row numbers are updated
afl1<-mutate(afl1,Rownumber=c(1:17))
afl1

# Change Team name "Adelaide" to "Port Adelaide"
afl1[9,]$Team<-str_replace(afl1[9,]$Team,"Adelaide","Port Adelaide")
# Change Team name "Melbourne" to "North Melbourne"
afl1[14,]$Team<-str_replace(afl1[14,]$Team,"Melbourne","North Melbourne")
# Change State "Queensld" to "QLD"
afl1[4,]$State<-str_replace(afl1[4,]$State,"Queensld","QLD")
# Change State "New South Wales" to "SA"
afl1[9,]$State<-str_replace(afl1[9,]$State,"New South Wales","SA")
# Change State "bictoria" to "VIC"
afl1[15,]$State<-str_replace(afl1[15,]$State,"bictoria","VIC")
afl1

# Use arrange to sort the tibble by team name
afl1<-arrange(afl1,Team)
afl1

# Use gather to convert the data set to long form
afl1<- gather(afl1,key = "round",value = "details",'Round01':'Round22')
afl1

# Use sting replace to remove all the "Round" string in column round
afl1$round<-str_replace(afl1$round,"Round","")
afl1

afl1<-afl1 %>%
  mutate("home"=is.na(str_match(afl1$details,"away"))[,1])
afl1

afl1<-mutate(afl1,goals=str_match(afl1$details,"(\\d+) goals and (\\d+)")[,2])
afl1<-mutate(afl1,behinds=str_match(afl1$details,"(\\d+) goals and (\\d+)")[,3])
afl1

afl1<-mutate(afl1,details=NULL)
afl1

afl1<-mutate(afl1,TidyRowNum=(1:374), .after=RowNum)
afl1


