# Reading power consumption data
powerconsumption <- read.table("~/Downloads/Coursera/household_power_consumption.txt",skip=1,
                               sep=";")

#naming the powerconsumption data                               
names(powerconsumption) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")


#subsetting the powerconsumption data
subconsumption <- subset(powerconsumption,powerconsumption$Date=="1/2/2007" | 
                     powerconsumption$Date =="2/2/2007")

# Transforming the Date and Time vars from characters into objects of type Date and POSIXlt respectively
subconsumption$Date <- as.Date(subconsumption$Date, format="%d/%m/%Y")
subconsumption$Time <- strptime(subconsumption$Time, format="%H:%M:%S")
subconsumption[1:1440,"Time"] <- format(subconsumption[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subconsumption[1441:2880,"Time"] <- format(subconsumption[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

# calling the basic plot functions
plot(subconsumption$Time,subconsumption$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(subconsumption,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(subconsumption,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(subconsumption,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))


#adding legends
legend("topright", lty=1, lwd=2, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# annotating graph
title(main="Energy sub-metering")

