setwd("~/Desktop/ExData_Plotting1")
housedata <-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
mydata <-rbind(housedata[housedata$Date=="1/2/2007",],housedata[housedata$Date=="2/2/2007",])

mydata$Date <- as.Date(mydata$Date,format = "%d/%m/%Y")
mydata$DateTime <- as.POSIXct(paste(mydata$Date, mydata$Time))

png("plot4.png", width = 480, height = 480)

par(mfrow=c(2,2))
plot(mydata$Global_active_power ~ mydata$DateTime, type="l")
plot(mydata$Voltage ~ mydata$DateTime, type="l")

with(mydata, {plot(Sub_metering_1 ~ DateTime, type="l")})
lines(mydata$Sub_metering_2 ~ mydata$DateTime, col = 'Red')
lines(mydata$Sub_metering_3 ~ mydata$DateTime, col = 'Blue')

plot(mydata$Global_reactive_power ~ mydata$DateTime, type="l")

dev.off()