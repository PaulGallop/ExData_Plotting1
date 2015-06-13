## Exploratory Data Analysis Week 1 Project

## Data source is: 
## https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

## Read in data from the file in the working directory. Note supressing of strings
## from becoming factors
data <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings="?", 
                   stringsAsFactor = FALSE) ## nrows = 10000 for testing

## Convert date character to date class
data$Date <- as.Date(data$Date, "%d/%m/%Y")

## Convert time character to date class
## data$Time <- strptime(data$Time, format = "%H:%M:%S")
## Above not used as it inserts todays date in the Y-m--d fields in the resulting list

## Instead create a 10yh column date_time and then reconvert this to date class object
data$date_time <- paste(data$Date, data$Time)
data$date_time <- strptime(data$date_time, format = "%Y-%m-%d %H:%M:%S")

## Subset the data for the required period
extract <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02") 
row.names(extract)<-NULL ## Removes the row names column that appear in the new extract df

## extract has th following variables:

## Date: Date in format yyyy-mm-dd
## Time: time in format hh:mm:ss
## Global_active_power: household global minute-averaged active power (in kilowatt)
## Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
## Voltage: minute-averaged voltage (in volt)
## Global_intensity: household global minute-averaged current intensity (in ampere)
## Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). 
##      It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).
## Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). 
##      It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
## Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). 
##      It corresponds to an electric water-heater and an air-conditioner

## Plot 2: Global Active Power over Time (line graph)
## Saved to a PNG file with a width of 480 pixels and a height of 480 pixels (the default size)

png(file = "plot2.png")
with(extract, plot(date_time, Global_active_power, type = "l", 
                   ylab ="Global Active Power (Kilowatts)", xlab = ""))
dev.off()