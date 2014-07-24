NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable,
# which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
# Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.

NEI <- NEI[NEI$fip == '24510',]
NEIByYear <- aggregate(NEI$Emissions ~ NEI$year * NEI$type, FUN=sum)
colnames(NEIByYear)=c("Year", "Type", "TotalEmissions")
png(filename="plot3.png", units="px")
qplot(Year,TotalEmissions,data=NEIByYear, col=Type, geom="line", facets=Type~.,main="PM 2.5 by Type for Baltimore City",xlab="Year",ylab="Total Emissions in tons")
dev.off()


