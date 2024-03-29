#' A function to geocoding directions using IDE_uy
#' @family service
#' @param x Dataframe with unless 3 variables: dpto = corresponding to the department, loc = city / location, dir = to the address.
#' @param details Logical value, default FALSE for X and Y variables only, if TRUE keep all variables of the service. 
#' @keywords geocoding IDE_uy
#' @importFrom  rjson fromJSON
#' @return The DafaFrame x with the coordinates variables append (x and y)
#' @export
#' @details https://direcciones.ide.uy/swagger-ui.html#/geocode,_reverse,_inversa
#' @examples
#'\donttest{
#' # x1 <- cbind(dpto="Montevideo",loc="Montevideo",dir="Av. 18 de julio 1453")
#' # x2 <- data.frame(x1, stringsAsFactors = F)
#' # geocode_ide_uy(x2)
#'}

geocode_ide_uy <- function(x, details = F) {
  stopifnot(is.data.frame(x))
  stopifnot(is.character(x$dpto), "dpto" %in% colnames(x), length(x$dpto) >= 1)
  stopifnot(is.character(x$loc), "loc" %in% colnames(x))
  stopifnot(is.character(x$dir), "dir" %in% colnames(x))
  if (!curl::has_internet()) stop("No internet access detected. Please check your connection.")
  x <- x %>% dplyr::mutate(dir = stringr::str_trim(dir)) %>% dplyr::filter(nchar(dir) > 0)
  for (i in 1:nrow(x)) {
    p <- glue::glue("https://direcciones.ide.uy/api/v0/geocode/BusquedaDireccion?calle={x[i,'dir']}&departamento={x[i,'dpto']}&localidad={x[i,'loc']}.json") %>% 
      stringr::str_replace_all(" ", "%20") 
    p <- suppressWarnings(rjson::fromJSON(paste(readLines(p), collapse=""))[[1]])
    x[i, "x"] <- p$puntoX
    x[i, "y"] <- p$puntoY
    if (details == T) {
      x[i, "idTipoClasificacion"] <- p$idTipoClasificacion
      x[i, "error"] <- p$error
    }
    
    p <- NULL 
    Sys.sleep(10)
  }
  return(x)
}
