corr2 <- function(directory, threshold = 0) {
    setwd("/Users/d842a922/Desktop/R_Coursera/")
    setwd(directory)
    
    files <- list.files(pattern = ".csv")
    x <- numeric()
    
    comp <- complete(directory)
    ids <- comp[comp["nobs"] > threshold, ]$id
    
    for (i in ids) {
        df <- read.csv(file =  files[i])
        df <- df[complete.cases(df), ]
        y <- cor(df$sulfate, df$nitrate) 
        x <- c(x, y)}
    return(x)
    }