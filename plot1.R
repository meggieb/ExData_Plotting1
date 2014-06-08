#read the data
householdPower<-read.table("household_power_consumption.txt", sep=";", header=TRUE)
housePwrDF<-as.data.frame(householdPower)

#convert columns to dates then subset the data
housePwrDF$Date<-as.Date(housePwrDF$Date, "%d/%m/%Y")
housePwrDFSubset<-subset(housePwrDF, Date=="2007-02-01" | Date=="2007-02-02")

#convert Global Active Power to numeric
housePwrDFSubset$Global_active_power<-as.numeric(as.character(housePwrDFSubset$Global_active_power))

#create pdf
png(file = "plot1.png", width=480, height=480, units = "px")
hist(housePwrDFSubset$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()
