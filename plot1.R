data = read.table("household_power_consumption.txt", header=TRUE, sep=";", colClasses = "character", na.strings="?")
data$Date = as.Date(data$Date, format="%d/%m/%Y")
data = data[data$Date==as.Date("2007-02-01") | data$Date==as.Date("2007-02-02"),]
data$Global_active_power <- as.numeric(data$Global_active_power)
png(file="plot1.png")
hist(data$Global_active_power, col = "red",xlab="Global Active Power (kilowatts)",
     main="Global Active Power")
dev.off()