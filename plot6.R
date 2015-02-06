# plot 6
# 6. Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle
# sources in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over
# time in motor vehicle emissions?
losAngeles <- NEI[NEI$fips=="06037",]
joined = merge(losAngeles, motorSCCId, by = "SCC")
losAngelesMotorEmissionByYear <- ddply(joined,~year, summarise, total=sum(Emissions))
plot(losAngelesMotorEmissionByYear, ylab = "total PM2.5 emission")

both <- NEI[NEI$fips=="06037" | NEI$fips=="24510",]
joined = merge(both, motorSCCId, by = "SCC")
bothMotorEmissionByYear <- ddply(joined,fips~year, summarise, total=sum(Emissions))
plot(bothMotorEmissionByYear, ylab = "total PM2.5 emission")

library(ggplot2)
require(ggplot2)
##The Year, total (emission), type are
##inherited by the geoms

ggplot(bothMotorEmissionByYear, aes(year, total, colour=fips)) + 
  geom_line() + 
  geom_point()