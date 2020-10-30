#' Import collisions with personal injury from year 2018
#'
#' @param x stays empty
#' @param save if TRUE saves data frame as text file
#' @return a tibble with simple features (see package: sf) represented in a geometry list-column containing all collisions with personal injuries that have been reported in 2018
#'
#' @export
#' @importFrom utils download.file
#' @importFrom utils unzip
#' @importFrom sf read_sf
#' @importFrom sf st_as_sf
#' @importFrom sf st_transform
#'
#' @examples

import_2018 <- function(x,save = FALSE) {
  temp <- tempfile()
  download.file(
    "https://www.opengeodata.nrw.de/produkte/transport_verkehr/unfallatlas/Unfallorte2018_EPSG25832_Shape.zip",
    temp
  )
  unzip(temp)
  y_18 <-
    read_sf("./Shapefile/Unfallorte2018_LinRef.shp",
            "Unfallorte2018_LinRef")
  y_18 <- st_as_sf(y_18)
  y_18 <- st_transform(y_18, 25832)
  if (!save)
    return(y_18)
  if(save)
    write.csv(x=y_18,file = "coll_2018")
  return(y_18)
}
