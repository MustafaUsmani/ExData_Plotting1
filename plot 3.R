#data reading
file <- "./household_power_consumption.txt"
data <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#as we require the data for 2 days
days <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(days$Date, days$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#for global active power
globalActivePower <- as.numeric(days$Global_active_power)
subMetering1 <- as.numeric(days$Sub_metering_1)
subMetering2 <- as.numeric(days$Sub_metering_2)
subMetering3 <- as.numeric(days$Sub_metering_3)

#size def
png("plot3.png", width=480, height=480)

#plot

plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
