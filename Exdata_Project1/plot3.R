## Continues from plot2.R. Code for downloading is removed.

png(filename="plot3.png", type = "cairo")

## Reads in the data for 2007/02/01 and 2007/02/02

data=read.table("household_power_consumption.txt", sep=";", 
                stringsAsFactors=FALSE, skip=66637, 
                nrow=2880)

colnames(data) = c("Date", "Time", "Global_active_power", "Global_reactive_power", 
                   "Voltage", "Global_intensity", "Sub_metering_1", 
                   "Sub_metering_2", "Sub_metering_3")

data$Global_active_power = as.numeric(data$Global_active_power)
times = strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S", tz="UTC")

## Plots a "stairs" graph for "plot3.png". The plot is saved to the
## default working directory of your computer.

plot(x = times, y = data$Sub_metering_1, type="s", xlab = "", lwd = 0.5, ylab = "Energy sub metering")
points(x = times, data$Sub_metering_2, type="s", lwd = 0.5, col = "red")
points(x = times, data$Sub_metering_3, type="s", lwd = 0.5, col = "blue")
legend("topright", lty=1, col = c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()