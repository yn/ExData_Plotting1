library(functional)
initial <- read.table("household_power_consumption_subset.txt", header = TRUE, sep=";")
png(filename = "plot3.png", width = 480, height = 480, units = "px", bg="transparent")
x <- as.POSIXct(paste(initial$Date, initial$Time), format="%d/%m/%Y %H:%M:%S")
selectors <- Filter(Curry(grepl, "^Sub_metering"), colnames(initial))
colors <- c("black","red","blue")

l1 = initial$Sub_metering_1
c1 = colors[1]
plot(x, l1, type="n", ylab="Energy sub metering", xlab="")
lines(x, l1, col = c1)

l1 = initial$Sub_metering_2
c1 = colors[2]
lines(x, l1, col = c1)

l1 = initial$Sub_metering_3
c1 = colors[3]
lines(x, l1, col = c1)

legend("topright", lwd=2, col = colors, legend = selectors)
dev.off()
