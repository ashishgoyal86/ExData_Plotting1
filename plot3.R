data = read.table("household_power_consumption.txt", header=TRUE, sep=";", colClasses = "character", na.strings="?")
data = data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]
data$dateTime = as.POSIXct(paste(data$Date,":",data$Time, sep=""), format="%d/%m/%Y:%H:%M:%S")
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
png(file="plot3.png")
with(data, plot(dateTime, Sub_metering_1, type="n", xlab="", ylab="Energy sub metering",
                main=NULL))
with(data, lines(dateTime, Sub_metering_1, col="black"))
with(data, lines(dateTime, Sub_metering_2, col="red"))
with(data, lines(dateTime, Sub_metering_3, col="blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, col=c("black", "red", "blue"))
dev.off()