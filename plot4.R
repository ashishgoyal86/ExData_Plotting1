data = read.table("household_power_consumption.txt", header=TRUE, sep=";", 
                  colClasses = c(rep("character", 2), rep("numeric", 7)), na.strings="?")
data = data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]
data$dateTime = as.POSIXct(paste(data$Date,":",data$Time, sep=""), format="%d/%m/%Y:%H:%M:%S")

png(file="plot4.png")
par(mfcol=c(2,2), mar=c(5,4,4,2))
#Chart 1
with(data, plot(dateTime, Global_active_power, type="n", xlab="", ylab="Global Active Power",
                main=NULL))
with(data, lines(dateTime, Global_active_power))

#chart 2
with(data, plot(dateTime, Sub_metering_1, type="n", xlab="", ylab="Energy sub metering",
                main=NULL))
with(data, lines(dateTime, Sub_metering_1, col="black"))
with(data, lines(dateTime, Sub_metering_2, col="red"))
with(data, lines(dateTime, Sub_metering_3, col="blue"))

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, col=c("black", "red", "blue"), bty="n")

#chart 3
with(data, plot(dateTime, Voltage, type="n", xlab="datetime",
                main=NULL))
with(data, lines(dateTime, Voltage))

# chart 4
with(data, plot(dateTime, Global_reactive_power, type="n", xlab="datetime",
                main=NULL))
with(data, lines(dateTime, Global_reactive_power))

dev.off()
