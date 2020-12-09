#' Add regional information to collision data
#'
#' @param data stays empty
#'
#' @return the reported collision dataset with additional columns containing information about the region
#' @export
#'
#' @import dplyr
#' @importFrom httr GET
#' @importFrom httr write_disk
#' @importFrom readxl read_excel
#' @importFrom plyr revalue

add_regions <- function(data) {
  data <- data %>%
    mutate(
      UREGBEZ = case_when(ULAND %in% c('02', '11') ~ '0',
                          TRUE ~ as.character(UREGBEZ)),
      UKREIS = case_when(ULAND %in% c('02', '11') ~ '00',
                         TRUE ~ as.character(UKREIS)),
      UGEMEINDE = case_when(ULAND %in% c('02', '11') ~ '000',
                            TRUE ~ as.character(UGEMEINDE))
    )
  options(scipen = 999)
  url1 <-
    "https://www.bmvi.de/SharedDocs/DE/Anlage/G/regiostar-referenzdateien.xlsx?__blob=publicationFile"
  GET(url1, write_disk(tf <- tempfile(fileext = ".xlsx")))
  df <- read_excel(tf, sheet = 6)
  df$gem <- as.character(df$gem)
  data$gem <-
    paste0(data$ULAND, data$UREGBEZ, data$UKREIS, data$UGEMEINDE)
  data$gem <- gsub('^0', '', data$gem)
  data <- merge(x = data,
                y = df,
                by = "gem",
                all.x = T)
  data_na <- sum(is.na(data$RegioStaR7))
  if (data_na > 0)
    warning(paste0(
      data_na,
      "collisions could not be assigned a regional spatial type"
    ))
  data$regio7bez <- revalue(
    as.factor(data$RegioStaR7),
    c(
      "71" = "U_Metro",
      "72" = "U_Regiop",
      "73" = "U_Medium",
      "74" = "U_Small",
      "75" = "R_C",
      "76" = "R_Med_C",
      "77" = "R_Small_C"
    )
  )
  options("scipen" = 0, "digits" = 7)
  return(data)
}
