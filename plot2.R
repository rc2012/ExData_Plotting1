plot2<-function(){
	file <- read.table("household_power_consumption.txt", header=TRUE, sep= ";", na.strings = c("?",""))
	file$Date <- as.Date(file$Date, format = "%d/%m/%Y")
	file$timetemp <- paste(file$Date, file$Time)
	file$Time <- strptime(file$timetemp, format = "%Y-%m-%d %H:%M:%S")
	x<-subset(file,file$Date>=as.Date("2007-02-01") & file$Date<=as.Date("2007-02-02"))
	plot(x$Time,x$Global_active_power,"l",xlab="",ylab="Global Active Power (kilowatts)")
	dev.copy(png, file = "plot2.png")
	dev.off()


}