NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?
# Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.


NEIByYear <- aggregate(NEI$Emissions ~ NEI$year,FUN=sum)
colnames(NEIByYear)=c("Year", "TotalEmissions")
png(filename="plot1.png", units="px")
plot(NEIByYear$Year, NEIByYear$TotalEmissions, type="l", xlab="Year", ylab="Total Emissions in tons", main="PM2.5")
dev.off()

