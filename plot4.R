initial <- read.table("household_power_consumption_subset.txt", header = TRUE, sep=";")
png(filename = "plot4.png", width = 480, height = 480, units = "px", bg="transparent")
par(mfrow=c(2,2))
datetime <- with(initial, as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))
#top left
with(initial, plot(datetime, Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=""))
#top right
with(initial, plot(datetime, Voltage, type="l"))
#bottom left
library(functional)
selectors <- Filter(Curry(grepl, "^Sub_metering"), colnames(initial))
colors <- c("black","red","blue")
matplot(datetime, initial[selectors], type="lll", lty = 1, lwd=1, col=colors,
        ylab="Energy sub metering", xlab="", xaxt="n")
axis.POSIXct(1,datetime, format="%a")
legend("topright", lwd=1, bty="n", col = colors, legend = selectors)
#bottom right
with(initial, plot(datetime, Global_reactive_power, type="l"))
dev.off()
