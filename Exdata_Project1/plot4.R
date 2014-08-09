## Continues from plot3.R. Code for downloading is removed.

png(filename="plot4.png", type = "cairo")

## Reads in the data for 2007/02/01 and 2007/02/02

data=read.table("household_power_consumption.txt", sep=";", 
                stringsAsFactors=FALSE, skip=66637, 
                nrow=2880)

colnames(data) = c("Date", "Time", "Global_active_power", "Global_reactive_power", 
                   "Voltage", "Global_intensity", "Sub_metering_1", 
                   "Sub_metering_2", "Sub_metering_3")

data$Global_active_power = as.numeric(data$Global_active_power)
times = strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S", tz="UTC")

## Plots a combo graph for "plot4.png". The plot is saved to the
## default working directory of your computer.

## Setting environment for 4 plots together

par(mfrow=c(2,2))

## Function calls for Plot 1

plot_1 = plot(x = times, y = data$Global_active_power, type="l", lwd = 0.5,
         xlab = "", ylab = "Global Active Power")

## Function calls for Plot 2

plot_2 = plot(x = times, y = data$Voltage, type="l", lwd = 0.5,
         xlab = "datetime", ylab = "Voltage")

## Function calls for Plot 3

plot_3 = c(plot(x = times, y = data$Sub_metering_1, type="s", xlab = "", ylab = "Energy sub metering"), points(x = times, data$Sub_metering_2, type="s", col = "red"),
           points(x = times, data$Sub_metering_3, type="s", col = "blue"), 
           legend("topright", lty=1, col = c("black", "red", "blue"), bty="n",
                  legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")))
  
## Function calls for Plot 4

plot_4 = plot(x = times, y = data$Global_reactive_power, type="l", lwd = 0.5, 
              xlab = "datetime", ylab = "Global_reactive_power", ylim=c(0,0.5))


dev.off()