#Reading the files

data <- readRDS(choose.files())
SCC <- readRDS(choose.files())

dataSCC <- merge(data, SCC, by = "SCC")

#Checking the Col Names and the type of variables in the data frame 

colnames(data)
str(data)

#Subset 
match <- grepl("Highway", SCC$Short.Name, ignore.case = T )
dataMatch <- dataSCC[match,]

#data
aggData <- aggregate(Emissions ~ year, dataMatch, sum)

png("Course5.png")
plot5 <- ggplot(aggData, aes(factor(year), Emissions))
plot5 <- plot5 + geom_bar(stat = "identity") + xlab("Year") + ylab("Emissions based on Highway Vehicles")
print(plot5)
dev.off()