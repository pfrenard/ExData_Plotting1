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




#Plot1
hist(dataset$Global_active_power, col="red", main="Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png,"plot1.png")
dev.off()


