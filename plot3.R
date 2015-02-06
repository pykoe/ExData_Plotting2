# data should be loaded (loadData file)

# 3. Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable,
#     which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City?
#     Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make
#     a plot answer this question.

# plot 3
library(ggplot2)
baltimoreEmissionsByYearAndType <- ddply(baltimmore,type~year, summarise, total=sum(Emissions) )

require(ggplot2)
##The Year, total (emission), type are
##inherited by the geoms

png(filename = "figure/plot3.png",
    width = 480, height = 480, units = "px", bg = "transparent")
ggplot(baltimoreEmissionsByYearAndType, aes(year, total, colour=type)) + 
  geom_line() + 
  geom_point()
dev.off()