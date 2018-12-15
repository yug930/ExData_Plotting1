rawData <- read.table("~/Downloads/household_power_consumption.txt", header = T, sep =";", na.strings = "?")
drops <- c("1/2/2007","2/2/2007")
selectDate <- rawData[rawData$Date %in% drops, ]
dataSet <- paste(selectDate$Date, selectDate$Time)
tmpDataSet <- strptime(dataSet, format("%d/%m/%Y %H:%M:%S" ))
rawData2 <- cbind(tmpDataSet,selectDate)
drops <- c("Date","Time")
finalData <- rawData2[,!(names(rawData2) %in% drops)]
hist(finalData$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()


plot(finalData$Global_active_power~finalData$tmpDataSet, type="l", ylab="Global Active Power (kilowatts)", xlab="")