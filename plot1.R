data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?")
data[complete.cases(data),]
data2 <- data[data$Date=="1/2/2007",]
data3 <- data[data$Date=="2/2/2007",]
data4 <- rbind(data2, data3)
png(filename = "plot1.png",width = 480, height = 480)
hist(data4$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()