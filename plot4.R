plot4<-function(){
	file <- read.table("household_power_consumption.txt", header=TRUE, sep= ";", na.strings = c("?",""))
	file$Date <- as.Date(file$Date, format = "%d/%m/%Y")
	file$timetemp <- paste(file$Date, file$Time)
	file$Time <- strptime(file$timetemp, format = "%Y-%m-%d %H:%M:%S")
	x<-subset(file,file$Date>=as.Date("2007-02-01") & file$Date<=as.Date("2007-02-02"))
	par(mfrow=c(2,2))
	with(x, {
	plot(Time,Global_active_power,"l",xlab="",ylab="Global Active Power")
 	plot(Time,Voltage,"l",xlab="datetime",ylab="Voltage")
	plot(Time, Sub_metering_1,ylab="Energy sub metering",type="l",)
	points(Time,Sub_metering_2,type="l",col="red")
	points(Time,Sub_metering_3,type="l",col="blue")
	legend("topright", lty=c(1,1,1), col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
	plot(Time,Global_reactive_power,"l",xlab="datetime")
	})
	
	dev.copy(png, file = "plot4.png")
	dev.off()


}