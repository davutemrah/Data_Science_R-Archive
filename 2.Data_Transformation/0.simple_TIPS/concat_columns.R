

dataf$MY <- paste(dataf$Month, dataf$Year)
dataf$MY <- paste(dataf$Month, "-", dataf$Year)
dataf$MY <- paste(dataf$Month, dataf$Year, sep= "-")


library(stringr)
dataf$SnakeNSize <- str_c(dataf$Snake," ", dataf$Size)


library(tidyverse) # or library(tidyr)
dataf <- dataf %>%
    unite("DM", Date:Month)