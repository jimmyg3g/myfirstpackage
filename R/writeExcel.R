#` writeExcel
#`
#` This function exports a tibble to a csv file then opens it.

#' @importFrom magrittr %>%
#' @name %>%
#' @rdname pipe
#' @export

writeExcel <- function(input) {
  my_filename <- Sys.time() %>% as.character() %>% gsub('\\s|\\-|:', '_', .) %>%
    paste0('C:/Users/jglenn/Downloads/', ., '.csv')
  write.csv(input, file=my_filename, row.names=F)
  shell.exec(my_filename)
}
