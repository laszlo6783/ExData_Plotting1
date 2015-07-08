# read the file
myData<-read.csv("household_power_consumption.txt", header = TRUE,sep = ";",
                 na.strings="?",
                 colClasses = c("character","character","numeric","numeric","numeric",
                              "numeric","numeric","numeric","numeric"))

#myData<-read.csv("household_power_consumption.txt", header = TRUE,sep = ";")

#read the first day data
myD1<-subset(myData,Date=="1/2/2007")

#read the second day data
myD2<-subset(myData,Date=="2/2/2007")

#change the data format for both
myD1$Date<-"2007-02-01"
myD2$Date<-"2007-02-02"

#delete the BIG data
rm("myData")

#put the two days in one dataframe
myData<-rbind(myD1,myD2)

#delete the dataframes not used
rm("myD1")
rm("myD2")

# transform the date in date format
myData$Date<-strptime(paste(myData$Date,myData$Time),"%Y-%m-%d %H:%M:%S")

png('plot4.png',width=480, height=480)
par(mfcol=c(2,2))
plot(myData$Date,myData$Global_active_power,ylab="Global Active Power",
     xlab="",type="l")
plot(myData$Date,myData$Sub_metering_1,type="l",col="gray",ylab="Energy sub metering",
     xlab="")
points(myData$Date,myData$Sub_metering_2,col="red",type="l")
points(myData$Date,myData$Sub_metering_3,col="blue",type="l")
legend("topright",pch=c("-","-","-"),col=c("gray","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(myData$Date,myData$Voltage,ylab="Voltage",
     xlab="datetime",type="l")

plot(myData$Date,myData$Global_reactive_power,ylab="Global Reactive Power",
     xlab="datetime",type="l")

dev.off()
