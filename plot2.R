rm(list=ls(all=TRUE))
#setwd("C:/TInvention/DataScience/DS4-ExploratoryDataAnalisys/ExData_Plotting1")

#read only interesting data
data = read.csv("household_power_consumption.txt",
                skip = 66637,nrows = 2880,
                header = FALSE,sep=";",na.strings = "?")

colnames(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

data$DateTime <- strptime(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S")

png(file = "plot2.png", width=480, height=480)

par(mfrow = c(1, 1), mar = c(5, 5, 2, 2))
Sys.setlocale("LC_TIME", "English")

with(data,plot(DateTime,Global_active_power,ylab = "Global Active Power (kilowatts)", xlab="",type = "l"))

dev.off()
