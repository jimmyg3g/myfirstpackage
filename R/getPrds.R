#' getPrds
#'
#' This function returns calendar month periods for `map` GA queries
#'
#' @param start_date
#' @param end_date
#'
#' @return
#' @export
#'
#' @examples
getPrds <- function(start_date, end_date = Sys.Date() - days(1)) {
  if (is.character(start_date)) {
     start_date <- ymd(start_date)
  }
  start_date <- floor_date(start_date, 'month')
  getEndOfMonth <- function(x) {
    y <- ymd(x) %>% ceiling_date("month") - days(1)
    ifelse(y >= Sys.Date(), Sys.Date() - days(1), y)
  }

  number_of_months <- (year(end_date) - year(start_date)) * 12 + month(end_date) - month(start_date)
  start_dates <- start_date + months(0:number_of_months)
  map(start_dates, function(x) {
    c(x, getEndOfMonth(x))
  })
}
