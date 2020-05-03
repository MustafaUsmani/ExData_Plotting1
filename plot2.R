#data reading
file <- "./household_power_consumption.txt"
data <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#as we require the data for 2 days
days <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(days$Date, days$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#for global active power
globalActivePower <- as.numeric(days$Global_active_power)

#size def
png("plot2.png", width=480, height=480)

#plot
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
