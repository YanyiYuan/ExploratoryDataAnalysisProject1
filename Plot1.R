#reading data
library(dplyr)
library(lubridate)

setwd("C:/Users/me/Documents/Coursera/Exploratory Data Analysis/Project 1")
data <- read.table("household_power_consumption.txt", skip=1, sep=";")

colnames(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
data$Date2 <- dmy(data$Date)

#.We will only be using data from the dates 2007-02-01 and 2007-02-02.
data_sub <- data[data$Date2 =="2007-02-01"|data$Date2=="2007-02-02",]


#plot 1
data_sub$GlobalActivePower = as.numeric(as.character(data_sub$Global_active_power))
par(mfrow=c(1,1))
png("plot1.png",width=480, height=480)
hist(data_sub$GlobalActivePower,col="red",main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
