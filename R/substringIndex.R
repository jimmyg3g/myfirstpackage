

substring_index_tidyverse <- function(string, delimiter, number) {
  string_parts <- str_split(string, coll(delimiter), simplify = FALSE) %>% unlist()
  n_parts <- length(string_parts)
  if(number > 0) {
    number <- min(c(number, n_parts))
    return(string_parts[1:number] %>%
             str_flatten(delimiter))
  }
  if(number < 0) {
    number <- max(c(number, -n_parts))
    return(string_parts[(n_parts + number + 1):n_parts] %>%
             str_flatten(delimiter))
  }
}



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
#' @examples mtcars %>% rownames_to_column() %>% as_tibble() %>% mutate(ck = substring_index(rowname, ' ', 1))
substring_index <- Vectorize(substring_index_tidyverse)
