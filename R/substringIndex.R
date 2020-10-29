
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
substring_index <- function(string, delim, count) {
  # from queryparser https://github.com/ianmcook/queryparser
  is_constant <- function(expr) {
    length(all_cols(expr)) == 0
  }
  all_cols <- function(expr) {
    setdiff(all.vars(expr), r_symbolic_constants)
  }
  r_symbolic_constants <- c(
    "pi", "TRUE", "FALSE", "NULL", "Inf", "NA", "NaN",
    "NA_integer_", "NA_real_", "NA_complex_", "NA_character_"
  )
  if (!is_constant(eval(substitute(quote(delim)))) ||
      !is_constant(eval(substitute(quote(count))))) {
    stop("The second and third arguments to substring_index() ",
         "must be constant values", call. = FALSE)
  }
  rev_fun <- str2lang("stringi::stri_reverse")
  coa_fun <- str2lang("dplyr::coalesce")
  ext_fun <- str2lang("stringr::str_extract")
  count <- as.integer(round(count))
  if(count < 0 && nchar(delim) > 1) {
    delim <- sapply(lapply(strsplit(delim, ""), rev), paste, collapse = "")
  }
  if (abs(count) == 1L) {
    pattern <- paste0("^.*?(?=\\Q", delim, "\\E)")
  } else if (abs(count) > 1L) {
    pattern <- paste0("^(.*?\\Q", delim, "\\E.*?){", abs(count) - 1L, "}(?=\\Q", delim, "\\E)")
  }
  if (count == 0) {
    ""
  } else if (count < 0) {
    eval(eval(substitute(quote(coa_fun(rev_fun(ext_fun(rev_fun(string), pattern)), string)))))
  } else {
    eval(eval(substitute(quote(coa_fun(ext_fun(string, pattern), string)))))
  }
}
