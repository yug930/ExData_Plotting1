rawData <- read.table("~/Downloads/household_power_consumption.txt", header = T, sep =";", na.strings = "?")
drops <- c("1/2/2007","2/2/2007")
selectDate <- rawData[rawData$Date %in% drops, ]
dataSet <- paste(selectDate$Date, selectDate$Time)
tmpDataSet <- strptime(dataSet, format("%d/%m/%Y %H:%M:%S" ))
rawData2 <- cbind(tmpDataSet,selectDate)
drops <- c("Date","Time")
finalData <- rawData2[,!(names(rawData2) %in% drops)]

dev.copy(png, file="plot3.png", width=480, height=480)

plot(finalData$tmpDataSet, finalData$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")

lines(finalData$tmpDataSet, finalData$Sub_metering_2, col = "red")
lines(finalData$tmpDataSet, finalData$Sub_metering_3, col = "blue")
legend(
  "topright",
  col = c("black", "red", "blue"),
  legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
  lty = c(1,1),
  lwd = c(1,1),
  y.intersp = .5,
  xjust = .5,
  yjust = .5,
  cex = .8)
plot3()
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()
