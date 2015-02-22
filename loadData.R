
# data will be store in a specific directory (./data)
if (!file.exists("data")) {
  dir.create("data")
}

# download data - if data has been already download skip
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
targetPath <- "data/FNEI_data.zip"
if (!file.exists(targetPath)) {
  download.file(fileUrl, targetPath, method = "curl")
}


unzipedPath <- "data/FNEI_data"
# unzip data - if unzip already skip
if (!file.exists(unzipedPath)) {
  unzip(targetPath, exdir = unzipedPath)
}

# The zip file contains two files:
# PM2.5 Emissions Data (summarySCC_PM25.rds): This file contains a data frame with all of
# the PM2.5 emissions data for 1999, 2002, 2005, and 2008. For each year, the table contains
# number of tons of PM2.5 emitted from a specific type of source for the entire year. Here are the first few rows.

# fips      SCC Pollutant Emissions  type year
# 4  09001 10100401  PM25-PRI    15.714 POINT 1999
# 8  09001 10100404  PM25-PRI   234.178 POINT 1999
# 12 09001 10100501  PM25-PRI     0.128 POINT 1999
# 16 09001 10200401  PM25-PRI     2.036 POINT 1999
# 20 09001 10200504  PM25-PRI     0.388 POINT 1999
# 24 09001 10200602  PM25-PRI     1.490 POINT 1999

# fips: A five-digit number (represented as a string) indicating the U.S. county
# SCC: The name of the source as indicated by a digit string (see source code classification table)
# Pollutant: A string indicating the pollutant
# Emissions: Amount of PM2.5 emitted, in tons
# type: The type of source (point, non-point, on-road, or non-road)
# year: The year of emissions recorded


## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("data/FNEI_data/summarySCC_PM25.rds")
SCC <- readRDS("data/FNEI_data/Source_Classification_Code.rds")

# 1 . Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
#     Using the base plotting system, make a plot showing the total PM2.5 emission from all
#     sources for each of the years 1999, 2002, 2005, and 2008.
t <- tapply(NEI$Emissions, NEI$year, sum)

if (!file.exists("figure")) {
  dir.create("figure")
}