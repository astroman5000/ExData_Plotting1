data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?")
data[complete.cases(data),]
data2 <- data[data$Date=="1/2/2007",]
data3 <- data[data$Date=="2/2/2007",]
data4 <- rbind(data2, data3)
data4$datetime <- as.POSIXct(strptime(paste(data4$Date,data4$Time), "%d/%m/%Y %H:%M:%S"))
png(filename = "plot2.png",width = 480, height = 480)
plot(data4$datetime,data4$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()