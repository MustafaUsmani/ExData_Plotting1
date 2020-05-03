#data reading
file <- "./household_power_consumption.txt"
data <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#as we require the data for 2 days
days <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(days$Date, days$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#for global active power
globalReactivePower <- as.numeric(days$Global_reactive_power)
voltage <- as.numeric(days$Voltage)
globalActivePower <- as.numeric(days$Global_active_power)
subMetering1 <- as.numeric(days$Sub_metering_1)
subMetering2 <- as.numeric(days$Sub_metering_2)
subMetering3 <- as.numeric(days$Sub_metering_3)

#size def
png("plot4.png", width=480, height=480)

#row placement
par(mfrow = c(2, 2)) 

#plot

#1
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

#2
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

#3
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

#4
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()

