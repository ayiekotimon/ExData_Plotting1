## Reading the dataset
household_power_consumption <- read.table("D:/Projects/R Projects/Coursera/EDA/household_power_consumption.txt", sep=";", na.strings="?", header = TRUE)
## Convert the Date variable
household_power_consumption$Date <- with(household_power_consumption, as.Date(Date, format="%d/%m/%Y"))
## Subsetting the dataset to those with the only required dates
plotdata <- subset(household_power_consumption, household_power_consumption$Date == "2007-02-01" | household_power_consumption$Date =="2007-02-02")
with(plotdata, head(Date))
## Start the png graphics device
png(filename = "plot1.png", height = 480, width = 480)
## Plot
with(plotdata, hist(Global_active_power, col = 'red', main = "Global Active Power", xlab = "Global Active Power (kilowatts)"))
## Close the png graphics device
dev.off()
