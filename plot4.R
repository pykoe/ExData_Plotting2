

# plot 4
# Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?
coalSCCId <- SCC[grepl("Coal", SCC$Short.Name) , c("SCC", "Short.Name")]

joined = merge(NEI, coalSCCId, by = "SCC")
coalEmissionByYear <- ddply(joined,~year, summarise, total=sum(Emissions))
plot(coalEmissionByYear, ylab = "total PM2.5 emission")

