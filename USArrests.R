#R Source Code File 2#
#Exploratory Analysis of the USArrests dataset#
#Isabelle and Diego??s First Pair Assignment#
#Collaborative Social Science Data Analysis#

#Let??s approach the dataset 
?USArrests
data("USArrests")
ls()
names(USArrests)

#####Summary statistics#####
summary(USArrests$Murder)
#Number of arrests per 100,000 residents for murder
#Median=7.250, Mean=7.788
summary(USArrests$Assault)
#Number of arrests per 100,000 residents for assault
#Median=159.0, Mean=170.8
summary(USArrests$UrbanPop)
#Percent of the population living in urban areas
#Median=66.00, Mean=65.54
summary(USArrests$Rape)
#Number of arrests per 100,000 residents for rape
#Median=20.10, Mean=21.23

#The data cover the values for those variables 
#in each of the 50 US states in 1973

#####Histograms#####
hist(USArrests$Murder)
#8 US states have 10 arrests per 100,000 residents for murder
#12 US states have around 4 arrests per 100,000 residents for murder
hist(USArrests$Assault)
hist(USArrests$UrbanPop)
hist(USArrests$Rape)
#variable rape is skewed

#using the package dplyr for piping
library(dplyr)
#we log the variable rape since its distribution is skewed
log(USArrests$Rape) %>% hist
