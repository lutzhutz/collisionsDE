#' Add collision types to collision data
#'
#' @param data must be a collision dataset of German Federal Statistical Office
#' @param three can be TRUE or FALSE, if TRUE more than two participating transport modes will be assigned to one value called "three", if FALSE more than two participating transport mdoes will be shown
#'
#' @return collision dataset with additional column "coll_typ" which contains information about which transport modes have collided
#' @export
#'
#' @examples
#'

collision_types <- function (data, three = TRUE) {
  data <- data %>%
    group_by(IstRad,
             IstPKW,
             IstFuss,
             IstKrad,
             IstGkfz,
             IstSonstig) %>% #sum up collisions by transport modes that have participated
    mutate(
      bicycle = if_else(IstRad == 1, "bicycle", ""),
      car = if_else(IstPKW == 1, "car", ""),
      foot = if_else(IstFuss == 1, "foot", ""),
      mcycle = if_else(IstKrad == 1, "mcycle", ""),
      truck = if_else(IstGkfz == 1, "truck", ""),
      other = if_else(IstSonstig == 1, "other", "")
    ) %>% #create new column and revalue 0 and 1 to NA and the transport mode
    unite(
      coll_typ,
      c("bicycle", "car", "foot", "mcycle", "truck", "other"),
      #unite all columns and delete all empty cells in order to get information on all participated transport modes
      remove = T,
      sep = ""
    )
  if (!three)
    return(data)
  if (three)
    subset_two <-
      data[!data$coll_typ %in% c(
        "bicycle",
        "bicyclecar",
        "bicyclefoot",
        "bicycleother",
        "bicycletruck",
        "bicyclemcycle"
      ),]
  three <- subset_two$coll_typ
  data <- data %>%
    mutate(
      coll_typ = str_replace(coll_typ, paste(three, collapse = "|"), "three"),
      coll_typ = gsub("(three).*", "\\1", coll_typ)
    )
  return(data)
}
