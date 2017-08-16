setwd("C:/Users/jiqian/Documents/RStudio")

Power <- read.table("./Data/household_power_consumption.txt", 
                    sep = ";", header = T, stringsAsFactors = F, na.strings = "?", 
                    colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
## Convert $date to Date Format
Power$Date  <- as.Date(Power$Date, "%d/%m/%Y")

## Filter data set from Feb. 1, 2007 to Feb. 2, 2007
PowerFeb <- subset(Power, Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))
str(PowerFeb)

## Check missing values
str(PowerFeb[complete.cases(PowerFeb), ])

## Add POSIXlt Date & Time variable
PowerFeb$DateTime <- strptime(paste(PowerFeb$Date, PowerFeb$Time), "%Y-%m-%d %H:%M:%S")

### PLOT 3
with(PowerFeb, {
    plot(DateTime, Sub_metering_1, type = "l", ylab ="Energy sub metering", xlab = "")
    lines(DateTime, Sub_metering_2, col = 'Red')
    lines(DateTime, Sub_metering_3, col = 'Blue')
    legend("topright", col = c("black", "red", "blue"), lwd = c(1,1,1), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})
dev.copy(png, "plot3.png", height = 480, width = 480)
dev.off()
