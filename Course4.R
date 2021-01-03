#Reading the files

data <- readRDS(choose.files())
SCC <- readRDS(choose.files())

dataSCC <- merge(data, SCC, by = "SCC")

#Checking the Col Names and the type of variables in the data frame 

colnames(data)
str(data)

#Subset
match <- grepl("coal", dataSCC$Short.Name, ignore.case = T)
dataMatch <- dataSCC[match,]

#data
aggData <- aggregate(Emissions ~ year, dataMatch, sum)

png("Course4.png")
plot4 <- ggplot(aggData, aes(factor(year), Emissions))
plot4 <- plot4 + geom_bar(stat = "identity") + xlab("Year") + ylab("Emissions based on Coal in US")
print(plot4)
dev.off()