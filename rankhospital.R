rankhospital <- function(state, outcome, num = "best"){
    # Read the data
    data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    # Create a clear data table 
    dbase <- as.data.frame(cbind(data[, 2], #Hospital name
                              data[, 7], #State 
                              data[, 11], #heart attack
                              data[, 17], #heart failure
                              data[, 23]), #Pneumonia
                        stringsAsFactors = FALSE)
    colnames(dbase) <- c("hospital", 
                         "state", 
                         "heart attack", 
                         "heart failure", 
                         "pneumonia")
    ## Check that state and outcome are valid
    if (!state %in% dbase[, "state"]) {
        stop("invalid state")
    }else if (!outcome %in% c("heart attack", "pneumonia", "heart failure")) {
            stop("invalid outcome")
    ## Check the rank value
    }else if (is.numeric(num)) {
        #Extract the data for the called state and outcome
        si <- which(dbase[, "state"] == state)
        ts <- dbase[si, ]
        ts[, eval(outcome)] <- as.numeric(ts[, eval(outcome)])
        #Sort the data frame
        ts <- ts[order(ts[, eval(outcome)], ts[, "hospital"], na.last = NA),]
        #Check whether the called rank exceeds the record number
        output <- ts[, "hospital"][num]}
    else if (!is.numeric(num)) {
        if (num == "best") {
            output <- best(state, outcome)}
        else if (num == "worst") {
            si <- which(dbase[, "state"] == state)
            ts <- dbase[si, ]
            ts[, eval(outcome)] <- as.numeric(ts[, eval(outcome)])
            ts <- ts[order(ts[, eval(outcome)], ts[, "hospital"], na.last = NA, decreasing = TRUE), ]
            output <- ts[, "hospital"][1]
        }
        else {
            stop("invalid rank")}
    }
  return (output)
}