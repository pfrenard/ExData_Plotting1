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




#Plot2
plot(dataset$DateTime, dataset$Global_active_power, xlab="", ylab = "Global Active Power (kilowatts)", type="l")
dev.copy(png,"plot2.png")
dev.off()


