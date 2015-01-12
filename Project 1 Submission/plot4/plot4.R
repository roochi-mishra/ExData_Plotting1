rm(list=ls())
setwd("C:/Users//#######/Desktop/exdata_data_household_power_consumption/")#<-Replace

###### Load data #####
elec <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
elec$Date <- as.Date(format(strptime(as.character(elec$Date), "%d/%m/%Y"), "%Y-%m-%d"), origin = "1970-01-01")
elec$DateTime <- as.POSIXct(strptime(as.character(paste(elec$Date, elec$Time)), "%Y-%m-%d %H:%M:%S"), tz="CST6CDT")
elec <- elec[complete.cases(elec),]
elec <- elec[elec$Date >= "2007-02-01" & elec$Date <= "2007-02-02",  ]
elec$Sub_metering_1 <- as.numeric(as.character(elec$Sub_metering_1))
elec$Sub_metering_2 <- as.numeric(as.character(elec$Sub_metering_2))
elec$Sub_metering_3 <- as.numeric(as.character(elec$Sub_metering_3))
elec$Voltage <- as.numeric(as.character(elec$Voltage))
elec$Global_reactive_power <- as.numeric(as.character(elec$Global_reactive_power))

png("plot4/plot4.png", width = 480, height = 480, units = "px")
par(mfrow=c(2,2))
#Plot1
plot(x = elec$DateTime, y = elec$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
#Plot2
plot(x = elec$DateTime, y = elec$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
#Plot3
plot(x = elec$DateTime, y = elec$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(x= elec$DateTime, y = elec$Sub_metering_2, type = "l", col  = "red")
lines(x= elec$DateTime, y = elec$Sub_metering_3, type = "l", col  = "blue")
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1,1),
       lwd=c(2.5,2.5,2.5),
       col = c("black", "blue", "red"),
       cex = 0.75)
#Plot4
plot(x = elec$DateTime, y = elec$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global Reactive Power")
dev.off()
