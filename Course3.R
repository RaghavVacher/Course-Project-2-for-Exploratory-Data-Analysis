#Reading the files

data <- readRDS(choose.files())
SCC <- readRDS(choose.files())

#Checking the Col Names and the type of variables in the data frame 

colnames(data)
str(data)

#subsets of data
data <- subset(data, data$fips == "24510")
aggdata <- aggregate(Emissions ~ year + type, data, sum)

#Plot
png("Course3.png")
plot <- ggplot(aggdata, aes(year, Emissions, color = type))
plot <- plot + geom_line() + xlab("year") + ylab("Emissions in Baltimore City over the years")
print(plot)
dev.off()
