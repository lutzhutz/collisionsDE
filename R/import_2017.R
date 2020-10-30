#' Import collisions with personal injury from year 2017
#'
#' @param x stays empty
#' @param save if TRUE saves data frame as text file
#' @return all collisions with personal injuries that have been reported in 2017
#'
#' @export
#' @importFrom utils download.file
#' @importFrom utils unzip
#' @importFrom sf read_sf
#' @importFrom sf st_as_sf
#' @importFrom sf st_transform
#'
#' @examples

import_2017 <- function(x,save = FALSE) {
  temp <- tempfile()
  download.file(
    "https://unfallatlas.statistikportal.de/app/UnfalldatenDownload/Unfallorte2017_LinRef_Shapefile.zip",
    temp
  )
  unzip(temp)
  y_18 <-
    read_sf("./Shapefile/Unfallorte2017_LinRef.shp",
            "Unfallorte2017_LinRef")
  y_18 <- st_as_sf(y_18)U
  y_18 <- st_transform(y_18, 25832)
  if (!save)
    return(y_18)
  if(save)
    write.csv(x=y_18,file = "coll_2017")
  return(y_18)
}
