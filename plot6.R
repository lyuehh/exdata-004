NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). 
# Which city has seen greater changes over time in motor vehicle emissions?

SCCMotor <- SCC[grepl("On-Road", SCC$EI.Sector, ignore.case=FALSE), ]

NEIBalCity <- NEI[NEI$fips=="24510", ]
NEILA <- NEI[NEI$fips=="06037", ]

NEIMotorBalCity <- subset(NEIBalCity, SCC %in% SCCMotor$SCC)
NEIMotorBalCityTotal <- aggregate(NEIMotorBalCity$Emissions ~ NEIMotorBalCity$year, FUN=sum)

NEIMotorLA <- subset(NEILA, SCC %in% SCCMotor$SCC)
NEIMotorLATotal <- aggregate(NEIMotorLA$Emissions ~ NEIMotorLA$year, FUN=sum)

NEIMotorCombined <- NEIMotorBalCityTotal
NEIMotorCombined[,3] <- NEIMotorLATotal[2]

colnames(NEIMotorCombined) <- c("Year","TotalEmissionsBC","TotalEmissionsLA")

png(filename="plot6.png", units="px")
par(mfrow=c(1,2))
plot(NEIMotorCombined$Year, NEIMotorCombined$TotalEmissionsBC, type="l", xlab="Year", ylab="Total Emissions in tons", main="Baltimore City")
plot(NEIMotorCombined$Year, NEIMotorCombined$TotalEmissionsLA, type="l", xlab="Year", ylab="Total Emissions in tons", main="Los Angeles")
dev.off()
