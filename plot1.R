plot1 <- function(){
  
  PowerData <- read.table("household_power_consumption.txt", sep=";", header = TRUE, na.strings = "?")
  PowerData$Date <- as.Date(PowerData$Date, format = '%d/%m/%Y')
  
  PlotData <- PowerData[(PowerData$Date == "2007-02-02" | PowerData$Date == "2007-02-01"),]
  PlotData$Time <- as.character(PlotData$Time)
  png(filename = "plot1.png")
  with(PlotData, hist(Global_active_power, xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red", main = "Global Active Power"))
  dev.off()
}