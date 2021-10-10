rankhospital <- function(state, outcome, num="best") {

    ## Read outcome data
    x <- read.csv("outcome-of-care-measures.csv", 
                  colClasses = "character")

    ## Check that state and outcome are valid
    
    if (state %in% x$State) {x <- x[x$State == state,]
    } else {stop("invalid state")}
    
    y <- c("heart attack", "heart failure", "pneumonia")
    if(outcome=="heart attack") {x <- x[, c(2, 11)]} else
        if(outcome=="heart failure") {x <- x[, c(2, 17)]} else
            if(outcome=="pneumonia") {x <- x[, c(2, 23)]} else
                if (!(outcome %in% y)) {stop("invalid outcome")} 
    
    ## Return hospital name in that state with given rank
    # convert outcome column to numeric
    x[, 2] <- suppressWarnings(as.numeric(x[, 2]))
    
    # ordering by outcome and  hospitals
    x <- x[order(x[, 2], x[, 1], na.last = NA), ]

    if(num=="best"){print(x[, 1][1])} else
        if(num=="worst"){print(x[, 1][nrow(x)])} else
            if(num > nrow(x)) {print(NA)} else
               {print(x[, 1][num])} 
}

