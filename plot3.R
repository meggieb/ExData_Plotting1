#read the data - assumes the unzipped file is in the working directory
householdPower<-read.table("household_power_consumption.txt", sep=";", header=TRUE)
housePwrDF<-as.data.frame(householdPower)
head(housePwrDF)

#convert columns to dates then subset the data
housePwrDF$Date<-as.Date(housePwrDF$Date, "%d/%m/%Y")
housePwrDFSubset<-subset(housePwrDF, Date=="2007-02-01" | Date=="2007-02-02")
housePwrDFSubset$DateTime <- as.POSIXct(paste(housePwrDFSubset$Date, housePwrDFSubset$Time), format="%Y-%m-%d %H:%M:%S")

#convert Global Active Power to numeric
housePwrDFSubset$Global_active_power<-as.numeric(as.character(housePwrDFSubset$Global_active_power))
housePwrDFSubset$Sub_metering_1<-as.numeric(as.character(housePwrDFSubset$Sub_metering_1))
housePwrDFSubset$Sub_metering_2<-as.numeric(as.character(housePwrDFSubset$Sub_metering_2))
housePwrDFSubset$Sub_metering_3<-as.numeric(as.character(housePwrDFSubset$Sub_metering_3))

#create pdf
png(file = "plot3.png", width=480, height=480, units = "px")
plot(housePwrDFSubset$DateTime,housePwrDFSubset$Sub_metering_1,type="l",col="black", ylab="Energy sub metering", xlab = "")
lines(housePwrDFSubset$DateTime,housePwrDFSubset$Sub_metering_2,col="red")
lines(housePwrDFSubset$DateTime,housePwrDFSubset$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1),lwd=c(2.5,2.5,2.5),col=c("black", "red", "blue"), cex=.75)
dev.off()
