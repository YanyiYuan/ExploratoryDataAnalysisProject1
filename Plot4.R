#reading data
library(dplyr)
library(lubridate)

setwd("C:/Users/me/Documents/Coursera/Exploratory Data Analysis/Project 1")
data <- read.table("household_power_consumption.txt", skip=1, sep=";")

colnames(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
data$Date2 <- dmy(data$Date)

#.We will only be using data from the dates 2007-02-01 and 2007-02-02.
data_sub <- data[data$Date2 =="2007-02-01"|data$Date2=="2007-02-02",]


#plot 4

png("plot4.png",width=480, height=480)
par(mfrow=c(2,2))
#plot_sub1
data_sub$GlobalActivePower = as.numeric(as.character(data_sub$Global_active_power))
data_sub$Time2 <- strptime(paste(data_sub$Date2, data_sub$Time, sep=" "), "%Y-%m-%d %H:%M:%S") 

plot(data_sub$Time2,data_sub$GlobalActivePower,type="n",xlab ="",ylab="Global Active Power")
lines(data_sub$Time2,data_sub$GlobalActivePower)

#plot_sub2
data_sub$Voltage2 <-as.numeric(as.character(data_sub$Voltage),options(digits=8))

plot(data_sub$Time2,data_sub$Voltage2,type="n",xlab="datetime", ylab="Voltage")
lines(data_sub$Time2,data_sub$Voltage2)

#plot_sub3
plot(data_sub$Time2,data_sub$Sub_metering_1,type="n",xlab="", ylab="Energy sub metering",ylim=c(-1,40))
lines(data_sub$Time2,data_sub$SubMetering1)
lines(data_sub$Time2,data_sub$SubMetering2,col="red")
lines(data_sub$Time2,data_sub$SubMetering3,col="blue")
legend("topright",bty="n",lty=c(1,1,1),col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#plot_sub4
data_sub$GlobalReactivePower <-as.numeric(as.character(data_sub$Global_reactive_power ),options(digits=8))
plot(data_sub$Time2,data_sub$GlobalReactivePower,type="n",xlab="datetime", ylab="Global_reactive_power")
lines(data_sub$Time2,data_sub$GlobalReactivePower)
dev.off()