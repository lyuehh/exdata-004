NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

NEIBalCity <- NEI[NEI$fips=="24510", ]
SCCMotor <- SCC[grepl("On-Road", SCC$EI.Sector, ignore.case=FALSE),]
NEIMotorBalCity <- subset(NEIBalCity, SCC %in% SCCMotor$SCC)
NEIMotorBalCityTotal <- aggregate(NEIMotorBalCity$Emissions ~ NEIMotorBalCity$year,FUN=sum)
colnames(NEIMotorBalCityTotal) <- c("Year","TotalEmissions")
png(filename="plot5.png", units="px")
plot(NEIMotorBalCityTotal$Year, NEIMotorBalCityTotal$TotalEmissions, type="l", xlab="Year", ylab="Total Emissions in tons", main="PM2.5 from motor vehicle sources in Baltimore City")
dev.off()
