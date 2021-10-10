best <- function(state, outcome) {
    ## Read outcome data
    x <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    
    ## Check that state and outcome are valid
    if (state %in% x$State) { x <- x[x$State == state, ]} else 
    {stop("invalid state")}
    
    y <- c("heart attack", "heart failure", "pneumonia")
    if(outcome=="heart attack") {x <- x[, c(2, 7, 11)]} else
        if(outcome=="heart failure") {x <- x[, c(2, 7, 17)]} else
            if(outcome=="pneumonia") {x <- x[, c(2, 7, 23)]} else
                if (!outcome %in% y) {stop("invalid outcome")} 
    
    ## Return hospital name in that state with lowest 30-day death rate
    # convert outcome column to numeric
    x[, 3] <- suppressWarnings(as.numeric(x[, 3]))
    
    x <- data.frame(x[x[, 3] == min(x[, 3], na.rm = TRUE), 2])
    x <- x[order(x), ][1]
    return(x)
}


