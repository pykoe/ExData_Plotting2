# plot 5
# 5. How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
motorSCCId <- SCC[grepl("*[M|m]otor*", SCC$Short.Name) , c("SCC", "Short.Name")]
baltimmore <- NEI[NEI$fips==24510,]
joined = merge(baltimmore, motorSCCId, by = "SCC")

baltimoreMotorEmissionByYear <- ddply(joined,~year, summarise, total=sum(Emissions))
plot(baltimoreMotorEmissionByYear, ylab = "total PM2.5 emission")

