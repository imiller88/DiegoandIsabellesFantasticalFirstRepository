#Data Exploration: Average Yearly Temperatures in New Haven, CT from 1912-1971#
#open piping package#
library(dplyr)
#explore nhtemp#
?nhtemp
#draw up nhtemp data#
data(nhtemp)
#summary statistics#
summary(nhtemp)
#histogram: frequency of average yearly temperatures#
hist(nhtemp, 
     main="Frequency of Average Yearly Temperatures", 
     xlab="temperature") ## ASK ABOUT THIS ERROR
#logged histogram#
log(nhtemp) %>% 
  hist(main="Logged Frequency of Average Yearly Temperatures (1912-1971)",
       xlab="temperature")
