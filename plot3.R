#read allData, subset required dates into subData
allData <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", stringsAsFactors = FALSE, na.strings = "?")
subData <- allData[allData$Date %in% c("1/2/2007", "2/2/2007"),]

#deallocate allData from environment
rm(allData)

#prepare x- and y-axes vectors
dateNtime <- strptime(paste(subData$Date, subData$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
smeter1 <- subData$Sub_metering_1
smeter2 <- subData$Sub_metering_2
smeter3 <- subData$Sub_metering_3

#set png driver, plot chart, add lines
png("plot3.png", width = 480, height = 480, units = "px")
plot(dateNtime, smeter1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(dateNtime, smeter2, type = "l", col = "red")
lines(dateNtime, smeter3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1, lwd = 1, col = c("black","red","blue"))
dev.off()

#deallocate all variables from environment
rm(list = ls())
