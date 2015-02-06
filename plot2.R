# data should be loaded (loadData file)

# 2. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510")
#     from 1999 to 2008? Use the base plotting system to make a plot answering this question.

# plot 2
# Baltimore City, Maryland
baltimmore <- NEI[NEI$fips==24510,]
baltimmoreEmissionByYear <- ddply(baltimmore,~year, summarise, total=sum(Emissions) )

png(filename = "figure/plot2.png",
    width = 480, height = 480, units = "px", bg = "transparent")
plot(baltimmoreEmissionByYear, ylab = "total PM2.5 emission", main="Baltimore PM2.5 Emissions")
dev.off()