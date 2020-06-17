#' Title
#'
#' @param x
#'
#' @return
#'
#' @export
#' @importFrom utils download.file
#' @importFrom utils unzip
#' @importFrom sf read_sf
#' @importFrom sf st_as_sf
#' @importFrom sf st_transform
#'
#' @examples

import_2018 <- function(x) {
  temp <- tempfile()
  download.file(
    "https://unfallatlas.statistikportal.de/app/UnfalldatenDownload/Unfallorte2018_LinRef_Shapefile.zip",
    temp
  )
  unzip(temp)
  y_18 <-
    read_sf("./Shapefile/Unfallorte2018_LinRef.shp",
            "Unfallorte2018_LinRef")
  y_18 <- st_as_sf(y_18)
  y_18 <- st_transform(y_18, 25832)
  return(y_18)
}
