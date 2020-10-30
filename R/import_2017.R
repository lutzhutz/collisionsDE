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
    "https://www.opengeodata.nrw.de/produkte/transport_verkehr/unfallatlas/Unfallorte2017_EPSG25832_Shape.zip",
    temp
  )
  unzip(temp)
  y_17 <-
    read_sf("./Shapefile/Unfallorte2017_LinRef.shp",
            "Unfallorte2017_LinRef")
  y_17 <- st_as_sf(y_17)
  y_17 <- st_transform(y_17, 25832)
  if (!save)
    return(y_17)
  if(save)
    write.csv(x=y_17,file = "coll_2017")
  return(y_17)
}
