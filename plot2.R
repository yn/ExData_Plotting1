with(read.table("household_power_consumption_subset.txt", header = TRUE, sep=";"), {
  png(filename = "plot2.png", width = 480, height = 480, units = "px", bg="transparent")
  x <- as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S")
  plot(x, Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  dev.off()
})


