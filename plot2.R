#Plot 2

#Setting work directory
setwd("C:/Users/Maggie Kim/Documents/GitHub/Coursera/Exploratory_Data_Analysis")
path<-"./exdata-data-household_power_consumption/household_power_consumption.txt"

#Reading a file
project_data<-read.table(path, header = TRUE,sep = ";", dec=".", stringsAsFactors = FALSE)

#subsetting '2007/02/01 and 2007/02/02'
subData<-project_data[project_data$Date %in% c("1/2/2007","2/2/2007"),]

x<-strptime(paste(subData$Date,subData$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

y<-as.numeric(subData$Global_active_power)

png("plot2.png")
plot(x, y, type = "l", xlab = "",ylab = "Global Active Power (kilowatts)")
dev.off()
