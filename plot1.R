#read allData, subset required dates into subData
allData <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", stringsAsFactors = FALSE, na.strings = "?")
subData <- allData[allData$Date %in% c("1/2/2007", "2/2/2007"),]

#deallocate allData from environment
rm(allData)

#set png driver and draw histogram
png("plot1.png", width = 480, height = 480, units = "px")
hist(subData$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()

#deallocate all variables from environment
rm(list = ls())
