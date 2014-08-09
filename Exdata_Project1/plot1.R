## Download data set directly from the internet. Files
## are downloaded to temp directory of R.

fileUrl = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
td = tempdir()
tf = tempfile(tmpdir=td, fileext=".zip")

## Method is set to "auto" under Windows. Data folder is
## created under the working directory to allow easy access.

download.file(fileUrl, tf, method="auto")
unzip(tf, exdir=".", overwrite=TRUE)

## Deletes the temporary files inside R.

unlink(td)
unlink(tf)

## Reads in the data for 2007/02/01 and 2007/02/02

data=read.table("household_power_consumption.txt", sep=";", 
                stringsAsFactors=FALSE, skip=66637, 
                nrow=2880)

colnames(data) = c("Date", "Time", "Global_active_power", "Global_reactive_power", 
                   "Voltage", "Global_intensity", "Sub_metering_1", 
                   "Sub_metering_2", "Sub_metering_3")

data$Global_active_power = as.numeric(data$Global_active_power)
data$Date = as.Date(data$Date, format="%d/%m/%Y")

## Plots a histogram for "plot1.png". The plot is saved to the
## default working directory of your computer.

hist(data$Global_active_power, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")

dev.copy(png, "plot1.png")
dev.off()
