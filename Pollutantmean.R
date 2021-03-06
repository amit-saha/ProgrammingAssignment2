pollutantmean <- function(directory, pollutant, id = 1:332) {

##  Write a function named 'pollutantmean' that calculates the mean of a pollutant (sulfate or nitrate) 
##  across a specified list of monitors. The function 'pollutantmean' takes three arguments:
##   'directory', 'pollutant', and 'id'. 
##  Given a vector monitor ID numbers, 'pollutantmean' reads that monitors' particulate matter data from the   
##  directory specified in the 'directory' argument and returns the mean of the pollutant across all of the
##  monitors, ignoring any missing values coded as NA. The function is as follows - 'directory'
##  is a character vector of length 1 indicating the location of the CSV files 'pollutant' is a character 
##  vector of length 1 indicating the name of the pollutant for which we will calculate the
##  mean; either "sulfate" or "nitrate". 'id' is an integer vector indicating the monitor ID numbers
##  to be used. Return the mean of the pollutant across all monitors list

files <- list.files(directory, full.names = TRUE)

## Store the full paths of all the files containing pollutant data
target_monitor <- lapply(files[id], function(x) read.csv(x, header = TRUE))

## Store data of selected monitors into target_monitor
result_data <- lapply(target_monitor, function(x) x[, pollutant])

## Store the pollutant values as a list in result_data
pollutant_all <- unlist(result_data)

mean(pollutant_all, na.rm = TRUE) 

}
