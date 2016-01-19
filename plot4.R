rm(list=ls(all=TRUE))
#setwd("C:/TInvention/DataScience/DS4-ExploratoryDataAnalisys/ExData_Plotting1")

#read only interesting data
data = read.csv("household_power_consumption.txt",
                skip = 66637,nrows = 2880,
                header = FALSE,sep=";",na.strings = "?")

colnames(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

data$DateTime <- strptime(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S")

png(file = "plot4.png", width=480, height=480)


par(mfrow = c(2, 2), mar = c(5, 5, 2, 2))
Sys.setlocale("LC_TIME", "English")

#1
with(data,plot(DateTime,Global_active_power,ylab = "Global Active Power", xlab="",type = "l"))

#2
with(data,plot(DateTime,Voltage,ylab = "Voltage", xlab="datetime",type = "l"))

#3
with(data, plot(DateTime,Sub_metering_1,ylab = "Energy sub metering", xlab="",type = "n"))
with(data, points(DateTime, Sub_metering_1, col = "black",type = "l"))
with(data, points(DateTime, Sub_metering_2, col = "red",type = "l"))
with(data, points(DateTime, Sub_metering_3, col = "blue",type = "l"))

legend("topright",
       col = c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       bty = "n",
       lty = 1, lwd=1)

#4
with(data,plot(DateTime,Global_reactive_power, xlab="datetime",type = "l"))


dev.off()
