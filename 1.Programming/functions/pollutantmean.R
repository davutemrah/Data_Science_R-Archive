
pollutantmean <- function(directory, pollutant, id=1:332) {
    setwd("/Users/d842a922/Desktop/R_Coursera/")
    setwd(directory)
    files <- list.files( pattern = ".csv")
    x <- numeric()
    for (i in id) {
        df <- read.csv( file =  files[i])
        x <- c(x, df[[pollutant]])
    }
    
    mean(x, na.rm = TRUE)
    }
