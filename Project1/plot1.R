#Plot 1

#Setting work directory
setwd("C:/Users/Maggie Kim/Documents/GitHub/Coursera/Exploratory_Data_Analysis")
path<-"./exdata-data-household_power_consumption/household_power_consumption.txt"

#Reading a file
project_data<-read.table(path, header = TRUE,sep = ";", dec=".", stringsAsFactors = FALSE)
#str(project_data)

project_data$Global_active_power<-as.numeric(project_data$Global_active_power)

#subsetting '2007/02/01 and 2007/02/02'
subData<-project_data[project_data$Date %in% c("1/2/2007","2/2/2007"),]

png("plot1.png")
hist(subData$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)" )
dev.off()
