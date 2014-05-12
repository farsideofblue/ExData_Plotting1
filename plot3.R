plot3 <- function(){
  
  PowerData <- read.table("household_power_consumption.txt", sep=";", header = TRUE, na.strings = "?")
  PowerData$Date <- as.Date(PowerData$Date, format = '%d/%m/%Y')
  
  PlotData <- PowerData[(PowerData$Date == "2007-02-02" | PowerData$Date == "2007-02-01"),]
  PlotData$Time <- as.character(PlotData$Time)
  PlotData[,10] <- paste(PlotData$Date, PlotData$Time)
  names(PlotData)[10] <- "DateTime"
  PlotData[[10]] <- strptime(PlotData[[10]], format = "%Y-%m-%d %H:%M:%S")
  
  png(filename = "plot3.png")
  with(PlotData, plot(DateTime, Sub_metering_1, type = "l", xlab = NA, ylab = "Energy sub metering"))
  with(PlotData, lines(DateTime, Sub_metering_2, col = "red"))
  with(PlotData, lines(DateTime, Sub_metering_3, col = "blue"))
  legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1))
  dev.off()
  
}