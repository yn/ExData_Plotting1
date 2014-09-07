initial <- read.table("household_power_consumption_subset.txt", header = TRUE, sep=";")
png(filename = "plot2.png", width = 480, height = 480, units = "px", bg="transparent")
x <- as.POSIXct(paste(initial$Date, initial$Time), format="%d/%m/%Y %H:%M:%S")
y <- initial$Global_active_power
plot(x, y, type="n", ylab="Global Active Power (kilowatts)", xlab="")
lines(x, y)
dev.off()
