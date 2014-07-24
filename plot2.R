NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Have total emissions from PM2.5 decreased in the Baltimore City,
# Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.

NEI <- NEI[NEI$fip == '24510',]
NEIByYear <- aggregate(NEI$Emissions ~ NEI$year,FUN=sum)
colnames(NEIByYear)=c("Year", "TotalEmissions")
png(filename="plot2.png", units="px")
plot(NEIByYear$Year, NEIByYear$TotalEmissions, type="l", xlab="Year", ylab="Total Emissions in tons", main="PM2.5")
dev.off()

