source("USArrests.R")
#####Summarizing with LOESS#####
library(ggplot2)
ggplot2::ggplot(USArrests, aes(Murder, Assault)) + geom_point() + geom_smooth() + theme_bw()
dev.print(png, "ggplotMurderAssault.png", width = 1024, height = 720)
ggplot2::ggplot(USArrests, aes(Murder, Rape)) + geom_point() + geom_smooth() + theme_bw()
dev.print(png, "ggplotMurderRape.png", width = 1024, height = 720)
ggplot2::ggplot(USArrests, aes(Assault, Rape)) + geom_point() + geom_smooth() + theme_bw()
dev.print(png, "ggplotAssaultRape.png", width = 1024, height = 720)