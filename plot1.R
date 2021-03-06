library(dplyr)
Sys.setlocale("LC_TIME", "English")
getwd()
setwd("C:/Users/tiago_000/Documents//GitHub")

#Data Set
data <-read.csv("./DataSets/household_power_consumption.txt" , sep = ";", header = TRUE, na.strings = c("?"), stringsAsFactors = FALSE)
data1 <- data
data1 <- mutate(data1, Date = as.Date(data1$Date,"%d/%m/%Y"))
data2 <- filter(data1, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02")) 


#plot 1

png(file = "./ExData_Plotting1/plot1.png", bg = "transparent",width = 480, height = 480)
hist(data2$Global_active_power, col = "red" , main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()