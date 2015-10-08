plot1<-function(){
	file <- read.table("household_power_consumption.txt", header=TRUE, sep= ";", na.strings = c("?",""))
	file$Date <- as.Date(file$Date, format = "%d/%m/%Y")
	file$timetemp <- paste(file$Date, file$Time)
	file$Time <- strptime(file$timetemp, format = "%Y-%m-%d %H:%M:%S")
	x<-subset(file,file$Date>=as.Date("2007-02-01") & file$Date<=as.Date("2007-02-02"))
	hist(x$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")
	dev.copy(png, file = "plot1.png")
	dev.off()


}