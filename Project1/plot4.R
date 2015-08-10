#Plot 4
#Setting work directory
setwd("C:/Users/Maggie Kim/Documents/GitHub/Coursera/Exploratory_Data_Analysis")
path<-"./exdata-data-household_power_consumption/household_power_consumption.txt"

#Reading a file
project_data<-read.table(path, header = TRUE,sep = ";", dec=".", stringsAsFactors = FALSE)


#subsetting '2007/02/01 and 2007/02/02'
subData<-project_data[project_data$Date %in% c("1/2/2007","2/2/2007"),]

x<-strptime(paste(subData$Date,subData$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

#Generating png file
png("plot4.png")
par(mfrow=c(2,2))

#Global Active Power
subData$Global_active_power <- as.numeric(subData$Global_active_power)
plot(x,subData$Global_active_power, type = "l", xlab = " ", ylab = "Global Active Power")

#Voltage x datetime
subData$Voltage <- as.numeric(subData$Voltage)
plot(x,subData$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

#Energy Submetering

subData$Sub_metering_1<-as.numeric(subData$Sub_metering_1)
subData$Sub_metering_2<-as.numeric(subData$Sub_metering_2)
subData$Sub_metering_3<-as.numeric(subData$Sub_metering_3)

plot (x,subData$Sub_metering_1, type = "l", col = "black", xlab = " ", ylab = "Energy sub metering")
lines(x,subData$Sub_metering_2, type = "l", col = "red")
lines(x,subData$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col = c("black","red","blue"), lty = 1, lwd = 1)

#Global_reactive_power
subData$Global_reactive_power <- as.numeric(subData$Global_reactive_power)
plot(x,subData$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()
