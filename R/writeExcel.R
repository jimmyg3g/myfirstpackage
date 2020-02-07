#` writeExcel
#`
#` This function exports a tibble to a csv file then opens it.

#' @importFrom magrittr %>%
#' @name %>%
#' @rdname pipe
#' @import tidyverse
#' @export

writeExcel <- function(input) {
  my_sheet <- Sys.time() %>% as.character() %>% gsub('\\s|\\-|:', '_', .)
  my_folder <- paste0(x[['USERPROFILE']], '\\downloads\\')
  fs::dir_create(my_folder)
  my_filename <- paste0(my_folder, my_sheet, '.xlsx')
  wb <- openxlsx::createWorkbook()
  options("openxlsx.orientation" = 'landscape')
  openxlsx::modifyBaseFont(wb, fontSize = 10)
  openxlsx::addWorksheet(wb, sheetName = my_sheet)
  openxlsx::freezePane(wb, my_sheet, firstRow = TRUE)
  openxlsx::writeData(wb, my_sheet, input)
  openxlsx::setColWidths(wb, my_sheet, 1:25, widths = 'auto')
  openxlsx::saveWorkbook(wb, my_filename, overwrite = TRUE)
  shell.exec(my_filename)
}
