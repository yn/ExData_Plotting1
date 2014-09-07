library(functional)
initial <- read.table("household_power_consumption_subset.txt", header = TRUE, sep=";")
png(filename = "plot3.png", width = 480, height = 480, units = "px", bg="transparent")
x <- as.POSIXct(paste(initial$Date, initial$Time), format="%d/%m/%Y %H:%M:%S")
selectors <- Filter(Curry(grepl, "^Sub_metering"), colnames(initial))
colors <- c("black", "blue", "red")
m <- cbind(selectors, colors)
first <- TRUE
apply(m, 1, function(sel_col) {
  sel <- sel_col[[1]]
  col <- sel_col[[2]]
  y <- initial[[sel]]
  if(first) {
    plot(x, y, type="n", ylab="Energy sub metering", xlab="")
  }
  first <- FALSE
  lines(x, y, col=col)
})

#legend("topright", lwd=2, col = , legend = )
dev.off()
