setwd("~/Desktop/ExData_Plotting1")
housedata <-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
mydata <-rbind(housedata[housedata$Date=="1/2/2007",],housedata[housedata$Date=="2/2/2007",])

mydata$Date <- as.Date(mydata$Date,format = "%d/%m/%Y")
mydata$DateTime <- as.POSIXct(paste(mydata$Date, mydata$Time))

png("plot3.png", width = 480, height = 480)

with(mydata, {plot(Sub_metering_1 ~ DateTime, type="l", xlab= "", ylab="Energy Sub Metering")})
lines(mydata$Sub_metering_2 ~ mydata$DateTime, col = 'Red')
lines(mydata$Sub_metering_3 ~ mydata$DateTime, col = 'Blue')
legend("topright", lty=1, lwd =3, col=c("black","red","blue") ,
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()