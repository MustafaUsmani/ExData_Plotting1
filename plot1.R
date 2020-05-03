#data reading
file <- "./household_power_consumption.txt"
data <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#as we require the data for 2 days
days <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#for global active power
globalActivePower <- as.numeric(days$Global_active_power)

#size def
png("plot1.png", width=480, height=480)

#hist
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()