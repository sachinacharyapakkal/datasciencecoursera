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
with(subdata,plot(NewDate,as.numeric(Global_active_power),main="Global Active Power v/s Time",type="l",xlab="",ylab="Global Active Power (in KW)"))

##Save as png
dev.copy(png,"plot2.png", width=480,height=480)
dev.off()