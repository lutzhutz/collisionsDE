#' Import collisions with personal injury from year 2019
#'
#' @param x stays empty
#' @param save if TRUE saves data frame as text file
#' @return all collisions with personal injuries that have been reported in 2019
#'
#' @export
#' @importFrom utils download.file
#' @importFrom utils unzip
#' @importFrom sf read_sf
#' @importFrom sf st_as_sf
#' @importFrom sf st_transform
#'
#' @examples

import_2019 <- function(x,save = FALSE) {
  temp <- tempfile()
  download.file(
    "https://www.opengeodata.nrw.de/produkte/transport_verkehr/unfallatlas/Unfallorte2019_EPSG25832_Shape.zip",
    temp
  )
  unzip(temp)
  y_19 <-
    read_sf("./Shapefile/Unfallorte2019_LinRef.shp",
            "Unfallorte2019_LinRef")
  y_19 <- st_as_sf(y_19)
  y_19 <- st_transform(y_19, 25832)
  if (!save)
    return(y_19)
  if(save)
    write.csv(x=y_19,file = "coll_2019")
  return(y_19)
}
