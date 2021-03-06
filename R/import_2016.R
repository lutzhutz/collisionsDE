#' Import collisions with personal injury from year 2016
#'
#' @param x stays empty
#' @param save if TRUE saves data frame as text file
#' @return a tibble with simple features (see package: sf) represented in a geometry list-column containing all collisions with personal injuries that have been reported in 2016
#'
#' @export
#' @importFrom utils download.file
#' @importFrom utils unzip
#' @importFrom sf read_sf
#' @importFrom sf st_as_sf
#' @importFrom sf st_transform
#'
#' @examples

import_2016 <- function(x,save = FALSE) {
  temp <- tempfile()
  download.file(
    "https://www.opengeodata.nrw.de/produkte/transport_verkehr/unfallatlas/Unfallorte2016_EPSG25832_Shape.zip",
    temp
  )
  unzip(temp)
  y_16 <-
    read_sf("./Shapefile/Unfaelle_2016_LinRef.shp",
            "Unfaelle_2016_LinRef")
  y_16 <- st_as_sf(y_16)
  y_16 <- st_transform(y_16, 25832)
  if (!save)
    return(y_16)
  if(save)
    write.csv(x=y_16,file = "coll_2016")
  return(y_16)
}
