#
#  I like those simple tricks

# download file
fileurl = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zip_file = "power_consumption.zip"
download.file(fileurl, destfile = zip_file)
unzip(zip_file)

# read data to data table (na.string is good)
power <- read.table("household_power_consumption.txt", header=TRUE, sep=";",
                    na.string="?", colClasses = c("character","character",
                                                  rep("numeric", 7)))

# create list type PosixLt date time
powerpart <- mutate(powerpart, 
                    datetime=strptime(paste(powerpart$Date, powerpart$Time), 
                                      "%e/%m/%Y %H:%M:%S"))

days <- filter(data, Date %in% c("1/2/2007", "2/2/2007"))

days <- mutate(
    days,Global_active_power = gsub("\\.", "", days$Global_active_power)) %>% 
    mutate(Global_active_power = as.numeric(Global_active_power))


library(lubridate)
days$Date  <- dmy(days$Date)
days$Time  <- hms(days$Time)
days <- mutate(days, date_time = Date + Time)




%in%
    
What does the code a %in% b produce, if a and b are both character vectors?
    
A logical vector of length equal to the length of a indicating which 
elements of a are in b.
