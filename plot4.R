# data should be loaded (loadData file)

# plot 4
# Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?
coalSCCId <- SCC[grepl("Coal", SCC$Short.Name) , c("SCC", "Short.Name")]

joined = merge(NEI, coalSCCId, by = "SCC")
coalEmissionByYear <- ddply(joined,~year, summarise, total=sum(Emissions))

png(filename = "figure/plot4.png",
    width = 480, height = 480, units = "px", bg = "transparent")
plot(coalEmissionByYear, ylab = "total PM2.5 emission")
dev.off()
