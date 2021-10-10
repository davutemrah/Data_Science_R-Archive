complete <- function(directory, id = 1:332) {
    setwd("/Users/d842a922/Desktop/R_Coursera/")
    setwd(directory)
    
    files <- list.files(pattern = ".csv")
    nobs <- numeric()
    
    for (i in id) {
        df <- read.csv( file =  files[i])
        nobs <- c(nobs, sum(complete.cases(df)))
        }
    data.frame(id, nobs)
    }