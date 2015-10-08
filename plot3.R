plot3<-function(){
	file <- read.table("household_power_consumption.txt", header=TRUE, sep= ";", na.strings = c("?",""))
	file$Date <- as.Date(file$Date, format = "%d/%m/%Y")
	file$timetemp <- paste(file$Date, file$Time)
	file$Time <- strptime(file$timetemp, format = "%Y-%m-%d %H:%M:%S")
	x<-subset(file,file$Date>=as.Date("2007-02-01") & file$Date<=as.Date("2007-02-02"))
	with(x, plot(Time, Sub_metering_1,ylab="Energy sub metering",type="l",))
	points(x$Time,x$Sub_metering_2,type="l",col="red")
	points(x$Time,x$Sub_metering_3,type="l",col="blue")
	legend("topright", lty=c(1,1,1), col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
	dev.copy(png, file = "plot3.png")
	dev.off()


}