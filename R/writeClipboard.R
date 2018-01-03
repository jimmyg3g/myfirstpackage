#` writeClipboard
#`
#` This function exports a tibble to the clipboard, ready to paste into a spreadsheet.


writeClipboard <- function(input) {
  write.table(input, 'clipboard', row.names=F, sep='\t')
}
