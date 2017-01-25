#read allData, subset required dates into subData
allData <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", stringsAsFactors = FALSE, na.strings = "?")
subData <- allData[allData$Date %in% c("1/2/2007", "2/2/2007"),]

#deallocate allData from environment
rm(allData)

#prepare x- and y-axes vectors
dateNtime <- strptime(paste(subData$Date, subData$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
gap <- subData$Global_active_power

#set png driver and draw line chart
png("plot2.png", width = 480, height = 480, units = "px")
plot(dateNtime, gap, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)", lwd = 1)
dev.off()

#deallocate all variables from environment
rm(list = ls())
