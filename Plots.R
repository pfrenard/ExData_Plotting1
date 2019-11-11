library("readr")

if ( ! grepl("ExData_Plotting1", getwd() ) ) {setwd("./ExData_Plotting1")}

### this file was generated the following command: 
### cat household_power_consumption.txt | egrep "^[12]/2/2007|Date" > subset.txt
filename <- "subset.txt"  

cat("Loading file into memory \n")
dataset <- read_delim(filename, delim = ";" , col_names = TRUE)
## Converting strings to Date 
dataset$Date <- as.Date(dataset$Date, "%d/%m/%Y")


