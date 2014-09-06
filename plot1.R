initial <- read.table("household_power_consumption_subset.txt", header = TRUE, sep=";")
png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(initial$Global_active_power, col='red', main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
