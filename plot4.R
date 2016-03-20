library(dplyr)
Sys.setlocale("LC_TIME", "English")
getwd()
setwd("C:/Users/tiago_000/Documents//GitHub")

#Data Set
data <-read.csv("./DataSets/household_power_consumption.txt" , sep = ";", header = TRUE, na.strings = c("?"), stringsAsFactors = FALSE)
data1 <- data
data1 <- mutate(data1, Date = as.Date(data1$Date,"%d/%m/%Y"))
data2 <- filter(data1, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02")) 



#plot 4
png(file = "./ExData_Plotting1/plot4.png", bg = "transparent",width = 480, height = 480)
par(mfrow = c(2,2), mar = c(4, 4, 4, 4), oma = c(0, 0, 0, 0))

plot(data2$Global_active_power~as.POSIXct(paste(data2$Date, data2$Time)),type="n", xlab = "", ylab = "Global Active Power" , cex.lab=0.8)
lines(data2$Global_active_power~as.POSIXct(paste(data2$Date, data2$Time))) 


plot(data2$Voltage~as.POSIXct(paste(data2$Date, data2$Time)),type="n", xlab = "datetime", ylab = "Voltage" , cex.lab=0.8)
lines(data2$Voltage~as.POSIXct(paste(data2$Date, data2$Time))) 

plot(data2$Sub_metering_1~as.POSIXct(paste(data2$Date, data2$Time)),type="n", xlab = "", ylab = "Energy sub metering" , cex.lab=0.8 )
lines(data2$Sub_metering_1~as.POSIXct(paste(data2$Date, data2$Time)), col = "black") 
lines(data2$Sub_metering_2~as.POSIXct(paste(data2$Date, data2$Time)), col = "red") 
lines(data2$Sub_metering_3~as.POSIXct(paste(data2$Date, data2$Time)), col = "blue") 
legend("topright", legend =  names(data2)[grep("^Sub_metering_", names(data2))], col = c("black", "red", "blue"), lty = 1, cex = 0.8, bty = "n")

plot(data2$Global_reactive_power~as.POSIXct(paste(data2$Date, data2$Time)),type="n", xlab = "datetime", ylab = "Global_reactive_power" , cex.lab=0.8)
lines(data2$Global_reactive_power~as.POSIXct(paste(data2$Date, data2$Time))) 
dev.off()