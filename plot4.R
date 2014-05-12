plot4 <- function(){
  
  PowerData <- read.table("household_power_consumption.txt", sep=";", header = TRUE, na.strings = "?")
  PowerData$Date <- as.Date(PowerData$Date, format = '%d/%m/%Y')
  
  PlotData <- PowerData[(PowerData$Date == "2007-02-02" | PowerData$Date == "2007-02-01"),]
  PlotData$Time <- as.character(PlotData$Time)
  PlotData[,10] <- paste(PlotData$Date, PlotData$Time)
  names(PlotData)[10] <- "DateTime"
  PlotData[[10]] <- strptime(PlotData[[10]], format = "%Y-%m-%d %H:%M:%S")
  
  png(filename = "plot4.png")
  par(mfrow = c(2,2))
  ##1st plot
  with(PlotData, plot(DateTime, Global_active_power, type = "l", xlab = NA, ylab = "Global Active Power (kilowatts)"))
  ##2nd plot
  with(PlotData, plot(DateTime, Voltage, xlab = "datetime", ylab = "Voltage", type = "l"))
  ##3rd plot
  with(PlotData, plot(DateTime, Sub_metering_1, type = "l", xlab = NA, ylab = "Energy sub metering"))
  with(PlotData, lines(DateTime, Sub_metering_2, col = "red"))
  with(PlotData, lines(DateTime, Sub_metering_3, col = "blue"))
  legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1))
  ##4th plot
  par(lwd = .5)
  with(PlotData, plot(DateTime, Global_reactive_power, xlab = "datetime", type = "l"))
  
  dev.off()
  
}