data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?")
data[complete.cases(data),]
data2 <- data[data$Date=="1/2/2007",]
data3 <- data[data$Date=="2/2/2007",]
data4 <- rbind(data2, data3)
data4$datetime <- as.POSIXct(strptime(paste(data4$Date,data4$Time), "%d/%m/%Y %H:%M:%S"))
png(filename = "plot3.png",width = 480, height = 480)
plot_colors <- c("black","red","blue")
plot(data4$datetime,data4$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(data4$datetime,data4$Sub_metering_2, col="red", type="l", xlab="", ylab="Energy sub metering")
lines(data4$datetime,data4$Sub_metering_3, col="blue", type="l", xlab="", ylab="Energy sub metering")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=plot_colors, lty=1:1, lwd=1)
dev.off()