NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
library(ggplot2)

# Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

SCCCoal <- SCC[grepl("coal", SCC$EI.Sector, ignore.case=TRUE),]
NEICoal <- subset(NEI, SCC %in% SCCCoal$SCC)
NEICoalTotal <- aggregate(NEICoal$Emissions ~ NEICoal$year, FUN=sum)
colnames(NEICoalTotal) <- c("Year", "TotalEmissions")
png(filename="plot4.png", units="px")
plot(NEICoalTotal$Year, NEICoalTotal$TotalEmissions, type="l", xlab="Year", ylab="Total Emissions in tons", main="PM2.5 from coal combustion-related sources")
dev.off()
