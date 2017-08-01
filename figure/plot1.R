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

### PLOT 1   
hist(PowerFeb$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
# dev.copy(png, "plot1.png", width = 480, height = 480)
# dev.off()