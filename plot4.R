##Reading the data
data<-read.table("household_power_consumption.txt",sep=";",header = TRUE)
str(data)

##Extracting the data
subdata<-subset(data,data$Date=="1/2/2007" | data$Date == "2/2/2007")
str(subdata)
head(subdata)

##Date formatting
subdata$Date<-as.Date(subdata$Date, format="%d/%m/%Y")
subdata$NewDate<-paste(subdata$Date,subdata$Time)
subdata$NewDate<-as.POSIXct(subdata$NewDate)

##Plot

par(mfrow=c(2,2),mar=c(4,4,2,1),oma=c(0,0,2,0))

with(subdata,plot(NewDate,as.numeric(Global_active_power),main="Global Active Power v/s Time",type="l",xlab="",ylab="Global Active Power (in KW)"))

with(subdata,plot(NewDate,Voltage,main="Voltage v/s Time",type="l",xlab="Date_Time",ylab="Voltage"))

with(subdata,plot(NewDate,Sub_metering_1,main="Energy Submetering v/s Time",type="l",xlab="",ylab="Energy Submetering"))
lines(subdata$NewDate,as.numeric(subdata$Sub_metering_2),col="red")
lines(subdata$NewDate,as.numeric(subdata$Sub_metering_3),col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1, col=c("black","red","blue"))

with(subdata,plot(NewDate,as.numeric(Global_reactive_power),main="Global Reactive Power v/s Time",type="l",xlab="",ylab="Global Reactive Power (in KW)"))


##Save as png
dev.copy(png,"plot4.png", width=480,height=480)
dev.off()