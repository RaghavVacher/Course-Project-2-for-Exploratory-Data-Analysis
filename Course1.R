#Reading the files

data <- readRDS(choose.files())
SCC <- readRDS(choose.files())

#Checking the Col Names and the type of variables in the data frame 

colnames(data)
str(data)

#subsets of data
data2008 <- subset(data, data$year == 2008)
data1999 <- subset(data, data$year == 1999)
data2002 <- subset(data, data$year == 2002)
data2005 <- subset(data, data$year == 2005)

#Values
pmtotal1999 <- sum(data1999$Emissions)
pmtotal2002 <- sum(data2002$Emissions)
pmtotal2005 <- sum(data2005$Emissions)
pmtotal2008 <- sum(data2008$Emissions)

#Totaling of Values
pmtotal <- list(pmtotal1999, pmtotal2002, pmtotal2005, pmtotal2008)
pmyear <- c("1999", "2002", "2005", "2008")

#Plot 
png("Course1.png")
#Log the values for better understanding 
plot(pmyear, log(as.numeric(pmtotal)), xlab = "Year", ylab = "Emmisions")
dev.off()

# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Yes, to a considerable level


