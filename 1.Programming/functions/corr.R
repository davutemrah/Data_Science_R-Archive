corr <- function(directory, threshold = 0) {
    setwd("/Users/d842a922/Desktop/R_Coursera/")
    setwd(directory)
    
    files <- list.files(pattern = ".csv")
    x <- numeric()

    for (i in 1:length(files)) {
        df <- read.csv(file =  files[i])
        
        if (sum(complete.cases(df)) > threshold) {
            df <- df[complete.cases(df), ]
            y <- cor(df$sulfate, df$nitrate) 
            x <- c(x, y)}
        else {corr <- 0}
    }
    x
    }


