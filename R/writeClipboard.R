#` writeClipboard
#`
#` This function exports a tibble to the clipboard, ready to paste into a spreadsheet..unless there are errors.

#' @export

writeClipboard <- function(input) {
  rio::export(input, 'clipboard')
}
