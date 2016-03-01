#R Source Code File 2#
#Exploratory Analysis of the USArrests dataset#
#First Pair Assignment by Isabelle and Diego#
#Collaborative Social Science Data Analysis#

#Opening dataset and understanding its structure
?USArrests
data("USArrests")
ls()
names(USArrests)

#Setting working directory
setwd("/Users/Diegotab/GitHub/DiegoandIsabellesFantasticalFirstRepository")

library(dplyr)
library(ggplot2)

#####Summary statistics#####
summary(USArrests$Murder)
#Number of arrests per 100,000 residents for murder across 50 US states
#Median=7.3 persons, Mean=7.8 persons
summary(USArrests$Assault)
#Number of arrests per 100,000 residents for assault across 50 US states
#Median=159 persons, Mean=170.8 persons
summary(USArrests$UrbanPop)
#Percent of the population living in urban areas across 50 US states
#Median=66.00%, Mean=65.54%
summary(USArrests$Rape)
#Number of arrests per 100,000 residents for rape across 50 US states
#Median=20.1 persons, Mean=21.2 persons

#The data cover the values for those variables 
#in each of the 50 US states in 1973

#####Another way of getting measures of central tendency: Looping for Mean and Median#####
for (i in 1:length(names(USArrests))) {
  USArrests[, i] %>%
    mean() %>%
    round(digits = 1) %>%
    paste(names(USArrests)[i], ., '\n') %>%  
    cat()
}
#Murder=7.8 Assault=170.8 UrbanPop=65.5 Rape=21.2
for (i in 1:length(names(USArrests))) {
  USArrests[, i] %>%
    median() %>%
    round(digits = 1) %>%
    paste(names(USArrests)[i], ., '\n') %>%  
    cat()
}
#Murder=7.2 Assault=159 UrbanPop=66 Rape=20.1

#####Histograms#####
hist(USArrests$Murder,
     main = "Arrests for Murder across US states",
     ylab = "Number of US states",
     xlab = "Arrests for Murder per 100k residents")
dev.print(png, "Murder.png", width = 1024, height = 720)
#8 US states have 10 arrests per 100,000 residents for murder
#12 US states have around 4 arrests per 100,000 residents for murder
hist(USArrests$Assault,
     main = "Arrests for Assault across US states",
     ylab = "Number of US states",
     xlab = "Arrests for Assault per 100k residents")
dev.print(png, "Assault.png", width = 1024, height = 720)
hist(USArrests$UrbanPop,
     main = "Share of Urban Population across US states",
     ylab = "Number of US states",
     xlab = "Share of Urban Population (in %)")
dev.print(png, "UrbanPop.png", width = 1024, height = 720)
hist(USArrests$Rape,
     main = "Arrests for Rape across US states",
     ylab = "Number of US states",
     xlab = "Arrests for Rape per 100k residents")
dev.print(png, "Rape.png", width = 1024, height = 720)

#####Measures of dispersion: standard deviation, range, IQR#####
for (i in 1:length(names(USArrests))) {
  USArrests[, i] %>%
    sd() %>%
    round(digits = 1) %>%
    paste(names(USArrests)[i], ., '\n') %>%  
    cat()
}
#Standard deviation Murder=4.4 Assault=83.3 UrbanPop=14.5 Rape=9.4
for (i in 1:length(names(USArrests))) {
  USArrests[, i] %>%
    var() %>%
    round(digits = 1) %>%
    paste(names(USArrests)[i], ., '\n') %>%  
    cat()
}
#Variation Murder=19 Assault=6945.2 UrbanPop=209.5 Rape=87.7
for (i in 1:length(names(USArrests))) {
  USArrests[, i] %>%
    range() %>%
    round(digits = 1) %>%
    paste(names(USArrests)[i], ., '\n') %>%  
    cat()
}
#Range Murder= 0.8 17.4 Assault= 45 337 UrbanPop= 32 91 Rape= 7.3 46
IQR(USArrests$Murder)
#IQR Murder= 7.175
IQR(USArrests$Assault)
#IQR Assault= 140
IQR(USArrests$UrbanPop)
#IQR UrbanPop= 23.25
IQR(USArrests$Rape)
#IQR Rape= 11.1

#####Boxplots for three crime variables#####
boxplot(USArrests$Murder,
        main = "Murder Arrests",
        ylab = "Arrests per 100k Inhabitants")
dev.print(png, "BoxplotMurder.png", width = 1024, height = 720)
boxplot(USArrests$Assault,
        main = "Assault Arrests",
        ylab = "Arrests per 100k Inhabitants")
dev.print(png, "BoxplotAssault.png", width = 1024, height = 720)
boxplot(USArrests$Rape,
        main = "Rape Arrests",
        ylab = "Arrests per 100k Inhabitants")
dev.print(png, "BoxplotRape.png", width = 1024, height = 720)

#####Scatter plots for three crime variables#####
plot(USArrests$Murder, USArrests$Assault,
     main = "Murder versus Assault",
     xlab = "Murder arrests per 100k Inhabitants",
     ylab = "Assault arrests per 100k Inhabitants")
dev.print(png, "PlotMurderAssault.png", width = 1024, height = 720)
plot(USArrests$Murder, USArrests$Rape,
     main = "Murder versus Rape",
     xlab = "Murder arrests per 100k Inhabitants",
     ylab = "Rape arrests per 100k Inhabitants")
dev.print(png, "PlotMurderRape.png", width = 1024, height = 720)
plot(USArrests$Assault, USArrests$Rape,
     main = "Assault versus Rape",
     xlab = "Assault arrests per 100k Inhabitants",
     ylab = "Rape arrests per 100k Inhabitants")
dev.print(png, "PlotAssaultRape.png", width = 1024, height = 720)

#####Correlation coefficients#####
cor.test(USArrests$Murder, USArrests$Assault)
#cor=0.8018733 
cor.test(USArrests$Murder, USArrests$Rape)
#cor=0.5635788 
cor.test(USArrests$Assault, USArrests$Rape)
#cor=0.6652412

#####Summarizing with LOESS#####
ggplot2::ggplot(USArrests, aes(Murder, Assault)) + geom_point() + geom_smooth() + theme_bw()
dev.print(png, "ggplotMurderAssault.png", width = 1024, height = 720)
ggplot2::ggplot(USArrests, aes(Murder, Rape)) + geom_point() + geom_smooth() + theme_bw()
dev.print(png, "ggplotMurderRape.png", width = 1024, height = 720)
ggplot2::ggplot(USArrests, aes(Assault, Rape)) + geom_point() + geom_smooth() + theme_bw()
dev.print(png, "ggplotAssaultRape.png", width = 1024, height = 720)

