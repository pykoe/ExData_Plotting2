# data should be loaded (loadData file)

# plot 5
# 5. How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
motorSCCId <- SCC[grepl("*[M|m]otor*", SCC$Short.Name) , c("SCC", "Short.Name")]
baltimmore <- NEI[NEI$fips==24510,]
joined = merge(baltimmore, motorSCCId, by = "SCC")

baltimoreMotorEmissionByYear <- ddply(joined,~year, summarise, total=sum(Emissions))

png(filename = "figure/plot5.png",
    width = 480, height = 480, units = "px", bg = "transparent")
plot(baltimoreMotorEmissionByYear, ylab = "emission", main="motor vehicle change in Baltimore", type="b")

# show the linear regression
reg5 <- lm(data=baltimoreMotorEmissionByYear, formula=total~year)
abline(reg5, col="red", lwd=1)

dev.off()
