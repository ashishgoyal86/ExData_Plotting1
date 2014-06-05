data = read.table("household_power_consumption.txt", header=TRUE, sep=";", colClasses = "character", na.strings="?")
data = data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]
data$dateTime = as.POSIXct(paste(data$Date,":",data$Time, sep=""), format="%d/%m/%Y:%H:%M:%S")
data$Global_active_power <- as.numeric(data$Global_active_power)
png(file="plot2.png")
with(data, plot(dateTime, Global_active_power, type="n", xlab="", ylab="Global Active Power (kilowatts)",
                main=NULL))
with(data, lines(dateTime, Global_active_power))
dev.off()