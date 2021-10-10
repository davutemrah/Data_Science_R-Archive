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
png(filename = "plot1.png",
    width = 480,
    height = 480) 

# 2. Create a plot
hist(df$Global_active_power,
     xlab = "Global Active Power (kilowatts)",
     col = "red",
     main = "Global Active Power",
     freq = TRUE,
     ylim = c(0, 1200), 
     cex.axis = 0.7)

# Close the png file
dev.off() 