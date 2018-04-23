#` writeClipboard
#`
#` This function exports a tibble to the clipboard, ready to paste into a spreadsheet.

#' @export

writeClipboard <- function(input) {
  rio::export(input, 'clipboard')
}
