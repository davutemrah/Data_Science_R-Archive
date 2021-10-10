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
png(filename = "plot3.png",
    width = 480,
    height = 480) 

# 2. Create a plot
with(df, plot(x = Time,
              y = Sub_metering_1,
              type = "l",
              xlab = "",
              ylab = "Energy sub metering",
              col = "black",
              cex.axis = 0.8,
              cex.lab = 0.8,
              cex = 1.5))

with(df, lines(x=Time, y=Sub_metering_2 , col = "red"))
with(df, lines(x=Time, y=Sub_metering_3 , col = "blue"))
legend("topright", col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1,
       cex = 0.7)

# Close the png file
dev.off() 