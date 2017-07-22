setwd("~/Desktop/ExData_Plotting1")
housedata <-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
mydata <-rbind(housedata[housedata$Date=="1/2/2007",],housedata[housedata$Date=="2/2/2007",])
png("plot1.png", width=480, height=480)
hist(as.numeric(mydata$Global_active_power), col="Red", main="Global Active Power",
     xlab="Global Active power (kilowatts)", ylab="Frequency")
dev.off()