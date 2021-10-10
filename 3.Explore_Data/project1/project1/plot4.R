library(dplyr)
library(lubridate)

df <- 
    read.delim(file = "raw_data/household_power_consumption.txt", sep = ";") %>%
    mutate(Date = as.Date(Date, format = "%d/%m/%Y"),
           Time = ymd_hms(paste(Date, Time))) %>%
    filter(Date == "2007-02-01" | Date == "2007-02-02") %>%
    mutate(across(where(is.character), ~na_if(., "?")),
           Global_active_power = as.numeric(Global_active_power))

# Open a png file
png(filename = "plot4.png",
    width = 480,
    height = 480) 

# 2. Create a plot
# 2. Create a plot

par(mfrow = c(2, 2))

with(df, {
    plot(x= Time, 
         y = Global_active_power,
         type = "l", xlab = "",
         ylab = "Global Active Power",
         col = "black", cex.lab = 0.7)
    plot(x = Time,
         y = Voltage,
         ylab= "Voltage",
         xlab= "datetime",
         col = "black",
         type = "l", cex.lab = 0.7)
    plot(x = Time,
         y = Sub_metering_1,
         type = "l", xlab = "",
         ylab = "Energy sub metering",
         col = "black", cex.axis = 0.8,
         cex.lab = 0.7, cex = 1.5)
    lines(x=Time, y=Sub_metering_2 , col = "red")
    lines(x=Time, y=Sub_metering_3 , col = "blue")
    legend("topright", col = c("black", "red", "blue"),
           legend = c("Sub_metering_1", "Sub_metering_2",
                      "Sub_metering_3"),
           lty = 1, cex = 0.5, box.lty = 0, bg = "transparent")
    plot(x = Time,
         y = Global_reactive_power,
         xlab = "datetime",
         type = "l",
         col = "black", cex.lab = 0.7)
})
# Close the png file
dev.off() 