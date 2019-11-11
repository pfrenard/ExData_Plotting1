library("readr")
library(lubridate)


if ( ! grepl("ExData_Plotting1", getwd() ) ) {setwd("./ExData_Plotting1")}

### this file was generated the following command: 
### cat household_power_consumption.txt | egrep "^[12]/2/2007|Date" > subset.txt
filename <- "subset.txt"  

cat("Loading file into memory \n")
dataset <- read_delim(filename, delim = ";" , col_names = TRUE, col_types = "ccddddddd")
## Converting strings  Date & Time to a new DateTime column using lubridate functions :)
dataset$DateTime <- dmy(dataset$Date)+hms(dataset$Time)


#Plot4
## 2x2
par(mfrow=c(2,2))
#plot 1x1
plot(dataset$DateTime, dataset$Global_active_power, xlab="", ylab = "Global Active Power", type="l")

#plot 1x2
plot(dataset$DateTime, dataset$Voltage, xlab="datetime", ylab = "Voltage", type="l")


#plot 2x1
plot(dataset$DateTime, dataset$Sub_metering_1, xlab="", ylab = "Energy sub metering", type="n")
lines(dataset$DateTime, dataset$Sub_metering_1, type="l")
lines(dataset$DateTime, dataset$Sub_metering_2, type="l", col="red")
lines(dataset$DateTime, dataset$Sub_metering_3, type="l", col="blue")
legend("topright",lty=c(1,1,1), col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), box.lty=0)

#plot 2x2
plot(dataset$DateTime, dataset$Global_reactive_power, xlab="datetime", ylab = "Global_reactive_power", type="l")

dev.copy(png,"plot4.png")
dev.off()
