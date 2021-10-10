library(dplyr)


data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

days <- filter(data, Date %in% c("1/2/2007", "2/2/2007"))

days <- mutate(
    days,Global_active_power = gsub("\\.", "", days$Global_active_power)) %>% 
    mutate(Global_active_power = as.numeric(Global_active_power))

hist(days$Global_active_power, ylab = "Frequency", xlab = "Global Active Power (kilowatts)",main = "Global Active Power", col = "red")

dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()



library(dplyr)
library(lubridate)
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
days <- filter(data, Date %in% c("1/2/2007", "2/2/2007"))
days <- mutate(
    days,Global_active_power = gsub("\\.", "", days$Global_active_power)) %>% 
    mutate(Global_active_power = as.numeric(Global_active_power))

days$Date  <- dmy(days$Date)

days$Time  <- hms(days$Time)

days <- mutate(days, date_time = Date + Time)

plot(days$date_time, days$Global_active_power, type ="l", xlab = "", ylab = "Global Active Power (kiowatts)")

dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()



library(dplyr)
library(lubridate)


data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

days <- filter(data, Date %in% c("1/2/2007", "2/2/2007"))

days <- mutate(
    days,Global_active_power = gsub("\\.", "", days$Global_active_power)) %>% 
    mutate(Global_active_power = as.numeric(Global_active_power))

days$Date  <- dmy(days$Date)

days$Time  <- hms(days$Time)

days <- mutate(days, date_time = Date + Time)

plot(days$date_time, days$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")

lines(days$date_time, days$Sub_metering_2, type = "l", col = "red")

lines(days$date_time, days$Sub_metering_3, type = "l", col = "blue")

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = "solid")

dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()







library(dplyr)
library(lubridate)


data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

days <- filter(data, Date %in% c("1/2/2007", "2/2/2007"))

days <- mutate(
    days,Global_active_power = gsub("\\.", "", days$Global_active_power)) %>% 
    mutate(Global_active_power = as.numeric(Global_active_power))

days <- mutate(
    days,Global_reactive_power = gsub("\\.", "", days$Global_reactive_power)) %>% 
    mutate(Global_reactive_power = as.numeric(Global_reactive_power))

days <- mutate(
    days,Voltage = gsub("\\.", "", days$Voltage)) %>% 
    mutate(Voltage = as.numeric(Voltage))

days$Date  <- dmy(days$Date)

days$Time  <- hms(days$Time)

days <- mutate(days, date_time = Date + Time)

par(mfcol = c(2, 2))

plot(days$date_time, days$Global_active_power, type ="l", xlab = "", ylab = "Global Active Power (kiowatts)")

plot(days$date_time, days$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(days$date_time, days$Sub_metering_2, type = "l", col = "red")
lines(days$date_time, days$Sub_metering_3, type = "l", col = "blue")

plot( days$date_time, days$Voltage, ylab = "Voltage", xlab = "datetime", type = "l")

plot(days$date_time, days$Global_reactive_power, ylab = "Global_reactive_power", xlab = "datetime", type = "l")

dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()
