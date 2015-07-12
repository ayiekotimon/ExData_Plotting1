## Reading the dataset
household_power_consumption <- read.table("D:/Projects/R Projects/Coursera/EDA/household_power_consumption.txt", sep=";", na.strings="?", header = TRUE)

## Convert the Date variable
household_power_consumption$Date <- with(household_power_consumption, as.Date(Date, format="%d/%m/%Y"))

## Subsetting the dataset to those with the only required dates
plotdata <- subset(household_power_consumption, household_power_consumption$Date == "2007-02-01" | household_power_consumption$Date =="2007-02-02")
## Combining the date and time variables and then converting it to the date-time format.
DateTime <- with(plotdata, paste(Date, Time, sep= " "))
DateTime <- strptime(DateTime, format= "%Y-%m-%d %H:%M:%S")
plotdata <- cbind(plotdata, DateTime)

## Start the png graphics device
png(filename = "plot4.png", height = 480, width = 480)
## Set parameters
par(mfrow = c(2,2))
 
## Plot and Annotate
## Plot 4.1
with(plotdata, plot(DateTime, Global_active_power,type = "l",ylab = "Global Active Power (kilowatts)", xlab = ""))
## Plot 4.2
with(plotdata, plot(DateTime, Voltage, type = "l", xlab = "datetime"))
## Plot 4.3
with(plotdata, plot(DateTime, Sub_metering_1,type = "l",ylab = "Energy sub metering", xlab = ""))
with(plotdata, lines(DateTime, Sub_metering_2, col = "red"))
with(plotdata, lines(DateTime, Sub_metering_3, col = "blue"))
legend("topright", lty = 1 , col= c("black", "red", "blue"),bty = "n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
## Plot 4.4
with(plotdata, plot(DateTime, Global_reactive_power, type = "l", xlab = "datetime"))
## Close the png graphics device
dev.off()
