# get_gps.R Return gps data

get_gps <- function(time = NULL) {
    if (!is.null(time)) {
        # get location for time
    }
    result <- httr::GET("http://10.100.100.254/cgi-bin/sssg_gps_dpsudp.pl")
    result
}
