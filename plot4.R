#read allData, subset required dates into subData
allData <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", stringsAsFactors = FALSE, na.strings = "?")
subData <- allData[allData$Date %in% c("1/2/2007", "2/2/2007"),]

#deallocate allData from environment
rm(allData)

#prepare x-axes vectors
dateNtime <- strptime(paste(subData$Date, subData$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

#set layout
png("plot4.png", width = 480, height = 480, units = "px")
par(mfrow = c(2,2))

#plot topleft - Global Active Power
gap <- subData$Global_active_power
plot(dateNtime, gap, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)", lwd = 1)

#plot topright - Voltage
plot(dateNtime, subData$Voltage, type = "l", xlab = "datetime", ylab = "Voltage", lwd = 1)

#plot bottomleft - Energy sub metering
smeter1 <- subData$Sub_metering_1
smeter2 <- subData$Sub_metering_2
smeter3 <- subData$Sub_metering_3
plot(dateNtime, smeter1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(dateNtime, smeter2, type = "l", col = "red")
lines(dateNtime, smeter3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1, lwd = 1, bty = "n", col = c("black","red","blue"))

#plot bottomright - Global Reactive Power
plot(dateNtime, subData$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global Reactive Power", lwd = 1)

#close png, deallocate memory
dev.off()
rm(list = ls())