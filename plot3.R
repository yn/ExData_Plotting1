library(functional)
initial <- read.table("household_power_consumption_subset.txt", header = TRUE, sep=";")
png(filename = "plot3.png", width = 480, height = 480, units = "px", bg="transparent")
x <- as.POSIXct(paste(initial$Date, initial$Time), format="%d/%m/%Y %H:%M:%S")
selectors <- Filter(Curry(grepl, "^Sub_metering"), colnames(initial))
colors <- c("black","red","blue")
m = cbind(selectors, colors)
plot(x, initial$Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")  
apply(m, 1, function(sel_col) {
  sel <- sel_col[[1]]
  l1 <- initial[[sel]]
  c1 <- sel_col[[2]]
  lines(x, l1, col = c1)
})

legend("topright", lwd=2, col = colors, legend = selectors)
dev.off()
