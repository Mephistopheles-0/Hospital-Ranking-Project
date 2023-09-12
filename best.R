#------------------------------------------------------------------------------
# Find the Hospital with the Lowest 30-Day Mortality Rate in a Given State
# Write a function called "findBestHospital" that takes two arguments: the 2-character abbreviated 
# name of a state and the name of an outcome. The function reads data from the "outcome-of-care-measures.csv" 
# file and returns the name of the hospital that achieved the best (i.e., lowest) 30-day mortality rate 
# for the specified outcome within the specified state.
#------------------------------------------------------------------------------

# Read data from the CSV file "outcome-of-care-measures.csv" and specify that all columns should be treated as character data.
data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")

# Display the first few rows (head) of the data to inspect its structure.
head(data)

# Get the number of columns in the data.
ncol(data)

# Get the number of rows in the data.
nrow(data)

# Display the column names (variable names) of the data.
names(data)

# Convert the data in column 11 (assumed to be named "outcome") to numeric.
outcome[, 11] <- as.numeric(outcome[, 11])

# Create a histogram of the data in column 11 (assuming it represents a numeric variable) to visualize its distribution.
hist(outcome[, 11])


best <- function(state, outcome) {
    ## Read outcome data from CSV file
    data <- read.csv("outcome-of-care-measures.csv", 
                            colClasses = "character")
    
    ## Check if the target state is valid
    if (!state %in% data$State) {
        stop("Invalid state")
    } else {
        ## Determine the column number corresponding to the target outcome
        if (outcome == "heart attack") {
            outcomeColumn <- 11
        } else if (outcome == "heart failure") {
            outcomeColumn <- 17
        } else if (outcome == "pneumonia") {
            outcomeColumn <- 23
        } else {
            stop("Invalid outcome")
        }
        
        ## Subset the data for the target state
        stateData <- subset(data, State == state)
        
        ## Find the minimum mortality rate (ignoring NA values)
        minMortality <- suppressWarnings(min(as.numeric(stateData[, outcomeColumn]), na.rm = TRUE))
        
        ## Subset hospitals with the lowest 30-day death rate
        lowestMortalityHospitals <- subset(stateData, as.numeric(stateData[, outcomeColumn]) == minMortality)
        
        ## Extract and return hospital names
        hospitalNames <- lowestMortalityHospitals[, "Hospital.Name"]
        
        ## Return hospital names in that state with the lowest 30-day death rate
        return(sort(hospitalNames))
    }
}
