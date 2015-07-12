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
png(filename = "plot2.png", height = 480, width = 480)
## Plot
with(plotdata, plot(DateTime, Global_active_power,type = "l",ylab = "Global Active Power (kilowatts)", xlab = ""))
## Close the png graphics device
dev.off()

