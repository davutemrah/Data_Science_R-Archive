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
png(filename = "plot2.png",
    width = 480,
    height = 480) 

# 2. Create a plot
plot(x = df$Time,
     y = df$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)",
     col = "black",
     cex.axis = 0.7)

# Close the png file
dev.off() 