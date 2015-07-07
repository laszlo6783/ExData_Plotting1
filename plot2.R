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

png('plot2.png',width=480, height=480)
plot(myData$Date,myData$Global_active_power,ylab="Global Active Power (kilowatts)",
     xlab="",pch="|")
dev.off()
