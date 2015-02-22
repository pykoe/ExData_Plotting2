# data should be loaded (loadData file)

# 1 . Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
#     Using the base plotting system, make a plot showing the total PM2.5 emission from all
#     sources for each of the years 1999, 2002, 2005, and 2008.

library(plyr)
emissionByYear <- ddply(NEI,~year, summarise, total=sum(Emissions) / 1000)

if (!file.exists("figure")) {
  dir.create("figure")
}
png(filename = "figure/plot1.png", width = 480, height = 480, units = "px", bg = "transparent")
plot(emissionByYear, ylab = "total PM2.5 emission (kilo tones)", type = "b")

# show the linear regression
reg <- lm(data=emissionByYear, formula=total~year)
abline(reg, col="red", lwd=1)

dev.off()