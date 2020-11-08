##Reading the data
data<-read.table("household_power_consumption.txt",sep=";",header = TRUE)
str(data)

##Extracting the data
subdata<-subset(data,data$Date=="1/2/2007" | data$Date == "2/2/2007")
str(subdata)
head(subdata)


##Histogram of Global Active Power
hist(as.numeric(subdata$Global_active_power),col="red",main="Global Active Power",xlab="Global Active Power")

##save as png
dev.copy(png,"plot1.png", width=480,height=480)
dev.off()
