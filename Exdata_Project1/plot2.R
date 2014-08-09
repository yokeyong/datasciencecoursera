## Continues from plot1.R. Code for downloading is removed.

png(filename="plot2.png", type = "cairo")

## Reads in the data for 2007/02/01 and 2007/02/02

data=read.table("household_power_consumption.txt", sep=";", 
                stringsAsFactors = FALSE, skip=66637, nrow=2880)

colnames(data) = c("Date", "Time", "Global_active_power", "Global_reactive_power", 
                   "Voltage", "Global_intensity", "Sub_metering_1", 
                   "Sub_metering_2", "Sub_metering_3")

data$Global_active_power = as.numeric(data$Global_active_power)
times = strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S", tz="UTC")

## Plots a line graph for "plot2.png". The plot is saved to the
## default working directory of your computer.

plot(x = times, y = data$Global_active_power, type="l", lwd = 0.9,
     xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()