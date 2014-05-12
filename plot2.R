plot2 <- function(){
  
  PowerData <- read.table("household_power_consumption.txt", sep=";", header = TRUE, na.strings = "?")
  PowerData$Date <- as.Date(PowerData$Date, format = '%d/%m/%Y')
  
  PlotData <- PowerData[(PowerData$Date == "2007-02-02" | PowerData$Date == "2007-02-01"),]
  PlotData$Time <- as.character(PlotData$Time)
  PlotData[,10] <- paste(PlotData$Date, PlotData$Time)
  names(PlotData)[10] <- "DateTime"
  PlotData[[10]] <- strptime(PlotData[[10]], format = "%Y-%m-%d %H:%M:%S")
  
  png(filename = "plot2.png")
  with(PlotData, plot(DateTime, Global_active_power, type = "l", xlab = NA, ylab = "Global Active Power (kilowatts)"))
  dev.off()
  
}