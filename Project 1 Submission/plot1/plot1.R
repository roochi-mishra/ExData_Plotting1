rm(list=ls())

setwd("C:/Users//######/Desktop/exdata_data_household_power_consumption/")#<-Replace

###### Load data #####
elec <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
elec$Date <- as.Date(strptime(as.character(elec$Date), "%d/%m/%Y"), tz = "CST6CDT")
elec <- elec[complete.cases(elec),]
elec <- elec[elec$Date >= "2007-02-01" & elec$Date <= "2007-02-02",  ]

elec$Time <- as.Date(strptime(as.character(elec$Time), "%H:%M"), tz="CST6CDT")
elec$Global_active_power <- as.numeric(as.character(elec$Global_active_power))
png("plot1/plot1.png", width = 480, height = 480, units = "px")
hist(elec$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()
