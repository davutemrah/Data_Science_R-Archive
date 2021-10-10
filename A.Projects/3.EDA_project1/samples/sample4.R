#Plot 1

#Library
library(readr)

#Download file 
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, destfile = "./dataset.zip")

#unzip file
unzip(zipfile = "./dataset.zip", exdir = getwd())

#Load and format the data
dataFull <- read_csv2(file = "./household_power_consumption.txt", col_names = TRUE)
dataset <- dataFull[dataFull$Date %in% c("1/2/2007", "2/2/2007"), ]
dataset$Global_active_power <- as.numeric(dataset$Global_active_power)

#plot and saving on a png file

png(filename = "plot1.png", width = 480, height = 480)

hist(dataset$Global_active_power, freq = TRUE, col = "red",
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.off()

=======
    #Course Project 1
    
    #Library
    library(readr)

#Download file 
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, destfile = "./dataset.zip")

#unzip file
unzip(zipfile = "./dataset.zip", exdir = getwd())

#Load and format the data
dataFull <- read_csv2(file = "./household_power_consumption.txt", col_names = TRUE)
dataset <- dataFull[dataFull$Date %in% c("1/2/2007", "2/2/2007"), ]
dataset$Global_active_power <- as.numeric(dataset$Global_active_power)

#plot and saving on a png file

png(filename = "plot1.png", width = 480, height = 480)

hist(dataset$Global_active_power, freq = TRUE, col = "red",
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.off()




#Plot 2

#Library
library(readr)

#Download file 
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, destfile = "./dataset.zip")

#unzip file
unzip(zipfile = "./dataset.zip", exdir = getwd())

#Load and format the data
dataFull <- read_csv2(file = "./household_power_consumption.txt", col_names = TRUE)
dataset <- dataFull[dataFull$Date %in% c("1/2/2007", "2/2/2007"), ]
dataset$Global_active_power <- as.numeric(dataset$Global_active_power)

date <- strptime(paste(dataset$Date, dataset$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

#Plot and saving on a png file
png(filename = "plot2.png", width = 480, height = 480)

plot(x = date, y = dataset$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)")

dev.off()

#Plot 3 

#Library
library(readr)

#Download file 
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, destfile = "./dataset.zip")

#unzip file
unzip(zipfile = "./dataset.zip", exdir = getwd())

#Load and format the data
dataFull <- read_csv2(file = "./household_power_consumption.txt", col_names = TRUE)
dataset <- dataFull[dataFull$Date %in% c("1/2/2007", "2/2/2007"), ]

date <- strptime(paste(dataset$Date, dataset$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

#Plot and saving on a png file

png(filename = "plot3.png", width = 480, height = 480)

with(dataset, plot(date, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(dataset, lines(date, Sub_metering_2, col = "red"))
with(dataset, lines(date, Sub_metering_3, col = "blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 1)

dev.off()

#Plot 4

#Library
library(readr)

#Download file 
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, destfile = "./dataset.zip")

#unzip file
unzip(zipfile = "./dataset.zip", exdir = getwd())

#Load and format the data
dataFull <- read_csv2(file = "./household_power_consumption.txt", col_names = TRUE)
dataset <- dataFull[dataFull$Date %in% c("1/2/2007", "2/2/2007"), ]
date <- strptime(paste(dataset$Date, dataset$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

#Plot and saving on a png file

png(filename = "plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))

#plot1
with(dataset, plot(date, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power"))

#plot2
with(dataset, plot(date, Voltage, type = "l"), xlab = "datetime", ylab = "Voltage")

#plot3
with(dataset, plot(date, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(dataset, lines(date, Sub_metering_2, col = "red"))
with(dataset, lines(date, Sub_metering_3, col = "blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.8)

#plot4
with(dataset, plot(date, Global_reactive_power, type = "l",
                   xlab = "datetime", ylab = "Global_reactive_power"))

dev.off()







