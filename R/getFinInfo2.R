#` getFinInfo2
#`
#` This function imports finInfo2 from feather files actual & budget 2016 - present.

#' @export


getFinInfo2 <- function() {
  fs::dir_ls("C:/Users/jglenn/Documents/R/tm1-3/data_feather", regex = "actual.*201(6|7|8)\\.feather|budget.*2018\\.feather") %>%
    map(., ~ feather::read_feather(.x)) %>%
    reduce(bind_rows) %>%
    mutate(fin_version = case_when(
      fin_version == "actual-pro-forma" ~ "actual",
      grepl("budget", fin_version) ~ "budget",
      TRUE ~ "fubar"
    )) %>%
    mutate(department = case_when(
      department_code %in% c("170", "171") ~ "administratrive",
      department_code == "167" ~ "selling",
      department_code %in% c("164", "157") ~ "news",
      department_code %in% c("266", "268") ~ "distribution",
      department_code %in% c("264", "265") ~ "print",
      department_code %in% c("168") ~ "digital",
      TRUE ~ department_name
    )) %>%
    select(-matches('^department$'))
}
