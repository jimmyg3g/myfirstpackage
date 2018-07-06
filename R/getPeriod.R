#' getPeriod
#'
#' This function converts a date to period in yyyymm format.
#' @param date
#'
#'
#'
#' @return
#' @export
#'
#' @examples
getPeriod <- function(date) {
  paste0(lubridate::year(date),
         formatC(lubridate::month(date), width = 2, flag = '0'))
}
