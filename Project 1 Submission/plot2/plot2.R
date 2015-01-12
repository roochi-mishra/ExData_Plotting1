rm(list=ls())
setwd("C:/Users//######/Desktop/exdata_data_household_power_consumption/")#<-Replace

###### Load data #####
elec <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
elec$Date <- as.Date(format(strptime(as.character(elec$Date), "%d/%m/%Y"), "%Y-%m-%d"), origin = "1970-01-01")
elec$DateTime <- as.POSIXct(strptime(as.character(paste(elec$Date, elec$Time)), "%Y-%m-%d %H:%M:%S"), tz="CST6CDT")
elec <- elec[complete.cases(elec),]
elec <- elec[elec$Date >= "2007-02-01" & elec$Date <= "2007-02-02",  ]
elec$Global_active_power <- as.numeric(as.character(elec$Global_active_power))



png("plot2/plot2.png", width = 480, height = 480, units = "px")
plot(x = elec$DateTime, y = elec$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
dev.off()
