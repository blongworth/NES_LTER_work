api_url <- "https://nes-lter-data.whoi.edu/api/"

get_cruises <- function() {
  jsonlite::fromJSON(paste0(api_url, "cruises"))[[1]]
}

get_underway <- function(cruise) {
  readr::read_csv(paste0(api_url, "underway/", cruise, ".csv"),
                  show_col_types = FALSE) 
}

dla_url <- "https://dlacruisedata.whoi.edu/AR/cruise/AR38/underway/proc/AR_IMU10_190919_0000.csv"

# get_arm_ims <- function(cruise, date) {
#   url <- paste0(https://dlacruisedata.whoi.edu/AR/cruise/AR38/underway/proc/
#                   https://dlacruisedata.whoi.edu/AR/cruise/AR38/underway/proc/AR_IMU10_190919_0000.csv
# }

# Link for parseable text of filenames in R2R
# http://get.rvdata.us/catalog/inventory/AR38