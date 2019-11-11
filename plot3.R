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



#Plot3
plot(dataset$DateTime, dataset$Sub_metering_1, xlab="", ylab = "Energy sub metering", type="n")
lines(dataset$DateTime, dataset$Sub_metering_1, type="l")
lines(dataset$DateTime, dataset$Sub_metering_2, type="l", col="red")
lines(dataset$DateTime, dataset$Sub_metering_3, type="l", col="blue")
legend("topright",
       lty=c(1,1,1), 
       col=c("black","red","blue"), 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       text.width= strwidth(" Sub_metering_1 _____________"))
### I was forced to add text.width  to control the legend into the PNG file 
### it was OK on the screen, but not into PNG ??!

dev.copy(png,"plot3.png")
dev.off()

