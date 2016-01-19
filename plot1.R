rm(list=ls(all=TRUE))
setwd("C:/TInvention/DataScience/DS4-ExploratoryDataAnalisys/ExData_Plotting1")

#read only interesting data
data = read.csv("household_power_consumption.txt",
                skip = 66637,nrows = 2880,
                header = FALSE,sep=";",na.strings = "?")

colnames(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

#str(data)
#head(data)
#tail(data)
#summary(data)

par(mfrow = c(1, 1), mar = c(5, 5, 2, 2))
hist(data$Global_active_power,
     main = "Global Active Power",xlab = "Global Active Power (kilowatts)",
     col = "red")
dev.copy(png, file = "plot1.png")
dev.off()
