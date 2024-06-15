#Load the required packages
library(tidyverse)
library(inspectdf)

# Q1. Loading the data
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

# Q2. The dimensions of the data set
#Use dim to show the numbers of rows and columns
dim(afl)

# Q3. Random permutation of the rows
# Set the random seed
set.seed(1942340)
# Use sample_n to get the random permutation of the rows
afl1<-sample_n(afl,18,replace = FALSE)
afl1

# Q4. Adding an extra column of row numbers
# Use mutate to add a column at the far right of the data set
afl1<-mutate(afl1,Rownumber=c(1:18))
# Then use relocate to move the new column to the far left
afl1<-relocate(afl1,"Rownumber", .before = Team)
afl1

# Q5 Data cleaning
# Q5(a)
# Use filter to extract the rows without text data.
afl1<-filter(afl1,Team!="testX1")
# Make sure the row numbers are updated
afl1<-mutate(afl1,Rownumber=c(1:17))
afl1
# Q5(b)
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
# Q5(c)
# Use arrange to sort the tibble by team name
afl1<-arrange(afl1,Team)
afl1

# Q6
# Q6(a)
# Use gather to convert the data set to long form
afl1<- gather(afl1,key = "round",value = "details",'Round01':'Round22')
afl1

# Q6(b)
# Use sting replace to remove all the "Round" string in column round
afl1$round<-str_replace(afl1$round,"Round","")
afl1

# Q6(c)
# Judge is away in details column, and rename the result column 1 into home
afl1<-afl1 %>%
  mutate("home"=is.na(str_match(afl1$details,"away"))[,1])
afl1
# Q6(d)
# Dig the numbers by str_match and put the result into column goals and column behinds
afl1<-mutate(afl1,goals=str_match(afl1$details,"(\\d+) goals and (\\d+)")[,2])
afl1<-mutate(afl1,behinds=str_match(afl1$details,"(\\d+) goals and (\\d+)")[,3])
afl1
# Q6(e)
# Delete the details column
afl1<-mutate(afl1,details=NULL)
afl1
# Q6(f)
# Add the TidyRowNum column right next to the origin RowNum
afl1<-mutate(afl1,TidyRowNum=(1:374), .after=RowNum)
afl1

# Q8. Taming the data
# Change the blank spaces in Team into "_"
afl1$Team<-str_replace(afl1$Team," ","_")
afl1
# Change the number characters into integers
afl1$round<-as.integer(afl1$round)
afl1$goals<-as.integer(afl1$goals)
afl1$behinds<-as.integer(afl1$behinds)
# Check if there is any NA
inspect_na(afl1)

# Q9 Set the new data set
set.seed(1942340)
afl2<-sample_n(afl1,200)
afl2

# Q10(a) Insert two new columns
# Calculate the score and accuracy and insert the new columns
afl2<-mutate(afl2,score=goals*6+behinds)
afl2<-mutate(afl2,accuracy=goals/(goals+behinds))
afl2
afl2$score<-as.integer(afl2$score)
afl2
# Q10(b)
summarise(group_by(afl2,Team),mean_score=mean(score))
summarise(group_by(afl2,Team),mean_accuracy=mean(accuracy))

# Q11(a)
ggplot(afl2,aes(home,score,fill=home))+
  geom_boxplot()
# Q11(b)
ggplot(afl2,aes(home,accuracy,fill=home))+
  geom_boxplot()

# Q12
afl_home<-filter(afl2,home==TRUE)
afl_away<-filter(afl2,home==FALSE)
afl_home
afl_away

# Q13
inspect_num(afl_home)
inspect_num(afl_away)

# Q14
ggplot(afl_home, aes(x = accuracy, y = score)) + 
  geom_point() + 
  geom_smooth(method="lm")
ggplot(afl_away, aes(x = accuracy, y = score)) + 
  geom_point() + 
  geom_smooth(method="lm")
