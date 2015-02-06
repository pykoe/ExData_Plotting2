# data should be loaded (loadData file)

# plot 2
# Baltimore City, Maryland
baltimmore <- NEI[NEI$fips==24510,]
baltimmoreEmissionByYear <- ddply(baltimmore,~year, summarise, total=sum(Emissions) )

png(filename = "figure/plot2.png",
    width = 480, height = 480, units = "px", bg = "transparent")
plot(baltimmoreEmissionByYear, ylab = "total PM2.5 emission", main="Baltimore PM2.5 Emissions")
dev.off()