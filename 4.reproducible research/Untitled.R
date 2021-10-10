mutate(time = seq.POSIXt(as.POSIXct("2012-10-01 00:00:00"),
                         by = "5 min", along.with = date)) %>%
    
    
    scale_x_datetime(breaks = "week", date_labels = "%Y %b %d") +