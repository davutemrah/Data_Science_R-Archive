rankall <- function(outcome, num="best") {

## Read outcome data
x <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    
## Check that state and outcome are valid
y <- c("heart attack", "heart failure", "pneumonia")
   
if(outcome=="heart attack") {x <- x[, c(2, 7, 11)]} else
    if(outcome=="heart failure") {x <- x[, c(2, 7, 17)]} else
        if(outcome=="pneumonia") {x <- x[, c(2, 7, 23)]} else
            if (!outcome %in% y) {stop("invalid outcome")} 
    
## For each state, find the hospital of the given rank
# convert outcome column to numeric
x[, 3] <- suppressWarnings(as.numeric(x[, 3]))
        
# ordering by outcome and  hospitals and remove NA outcomes
x <- x[order(x[, 2], x[, 3], x[, 1], na.last = NA), c(1, 2)]
     
## Return a data frame with the hospital names and the state name (abbrv)

select <- function(dt, num) {
    dt <- aggregate(dt[, 1], list(dt[, 2]), function(d){d <- d[num]})
    # set the names of the data frame
    colnames(dt) <- c( "state", "hospital")
    dt<- dt[, 2:1]}

if(num=="worst"){
    x <- aggregate(x[, 1], list(x[, 2]), function(e){e <- tail(e, 1)})
    # set the names of the data frame
    colnames(x) <- c( "state", "hospital")
    x<- x[, 2:1]
    }  else
        if(num=="best"){select(x, num=1)} else  {select(x, num)}
}
