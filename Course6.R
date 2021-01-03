#Reading the files

data <- readRDS(choose.files())
SCC <- readRDS(choose.files())

#Checking the Col Names and the type of variables in the data frame 

colnames(data)
str(data)

#subsets of data
data <- subset(data, data$fips == "24510" | data$fips ==  "06037")
aggdata <- aggregate(Emissions ~ year + fips, data, sum)

#Plot
png("Course6.png")
plot <- ggplot(aggdata, aes(factor(year), Emissions, color = fips))
plot <- plot + geom_bar(stat = "identity") + xlab("year") + ylab("Emissions in Baltimore City and Los Angeles") + scale_color_manual(name="Cities",labels=c("Los Angeles", "Baltimore"), values =c("red", "blue")) + facet_grid(. ~ fips)
                                                                                                                
print(plot)
dev.off()
