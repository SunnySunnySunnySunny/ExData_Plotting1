setwd("~/Desktop/ExData_Plotting1")
housedata <-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
mydata <-rbind(housedata[housedata$Date=="1/2/2007",],housedata[housedata$Date=="2/2/2007",])
mydata$Date <- as.Date(mydata$Date,format = "%d/%m/%Y")
mydata$DateTime <- as.POSIXct(paste(mydata$Date, mydata$Time))
png("plot2.png", width = 480, height = 480)
plot(mydata$Global_active_power ~ mydata$DateTime, type="l", xlab= "", 
     ylab="Global Active power (kilowatts)")
dev.off()
