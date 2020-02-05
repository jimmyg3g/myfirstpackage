

#' prettyNames
#'
#' This function takes a tibble and converts to Big Camel
#'
#' @param input
#'
#' @return
#' @export
#'
#' @examples
prettyNames <- function(input) {
  stopifnot(is.data.frame(input))
  input %>%
    rename_all(snakecase::to_any_case, case = 'big_camel', sep_out = ' ')
}

