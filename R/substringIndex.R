
#' Substring Index
#'
#' This function mimics MySQL's substring_index() function.
#' @param string
#' @param delimiter
#' @param number
#'
#' @return
#' @export
#'
#' @examples
substring_index <- function(string, delimiter, number) {
  string_parts <- stringr::str_split(string, stringr::coll(delimiter), simplify = FALSE) %>% unlist()
  n_parts <- length(string_parts)
  if(number > 0) {
    number <- min(c(number, n_parts))
    return(string_parts[1:number] %>%
             stringr::str_flatten(delimiter))
  }
  if(number < 0) {
    number <- max(c(number, -n_parts))
    return(string_parts[(n_parts + number + 1):n_parts] %>%
             stringr::str_flatten(delimiter))
  }
}
