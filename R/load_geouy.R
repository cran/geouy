#' This function allows to take oficial uruguayan geometries, as object "sf", from various servers.
#' @family service
#' @param c Define the geometries to download: may be: "Departamentos", "Secciones", "Zonas", etc. View(metadata) for details.
#' @param crs Define the Coordinate Reference Systems you want the output, default 32721
#' @param folder Folder where are the files download if formato == "zip" in metadata. Default tempdir()
#' @importFrom curl has_internet
#' @importFrom sf st_read st_transform
#' @importFrom glue glue
#' @importFrom utils download.file unzip
#' @importFrom fs dir_ls
#' @keywords IDE MIDES INE
#' @return sf object with the requested geometries 
#' @export
#' @examples
#'\donttest{
#' secc <- load_geouy(c = "Secciones")
#'}

load_geouy <- function(c, crs = 32721, folder = tempdir()){
  x <- geouy::metadata 
  folder <- normalizePath(folder,"/")
  try(if (!c %in% x$capa) stop("The name of the geometry you will load is not correct. Verify in the metadata file"))
  if (!curl::has_internet()) stop("No internet access detected. Please check your connection.")
  x <- x[x$capa == c,]
  enco <- x$enc
  if (x$repositor %in% "SGM") {
    a <- sf::st_read("WFS:http://geoservicios.sgm.gub.uy/wfsPCN1000.cgi?",x$url, crs = x$crs)
  } else if (x$formato %in% c("zip", "zip a")) {
    if (!is.character(folder) | length(folder) != 1) {
      stop(glue::glue("You must enter a valid directory..."))
    }
    # download ----
    suppressWarnings(try(dir.create(folder)))
    f = glue::glue("{folder}/{x$capa}.zip")
    if (!file.exists(f)) {
      message(glue::glue("Intentando descargar {x$capa}..."))
      tryCatch({
        utils::download.file(x$url, f, mode = "wb", method = "libcurl", extra = '--no-check-certificate')
      }, error = function(e) {
        utils::download.file(x$url, f, mode = "a", method = "libcurl", extra = '--no-check-certificate')
      })
    }
    invisible(try(utils::unzip(f, exdir = folder)))
      #archive_extract(archive.path = f, dest.path = )))
    archivo <- fs::dir_ls(folder, regexp = "\\.shp$")
    archivo <- archivo[which.max(file.info(archivo)$mtime)]
    if(!enco == "UTF-8"){
      a <- sf::st_read(archivo, crs = x$crs, options = glue::glue("ENCODING=", enco))
    } else {
      a <- sf::st_read(archivo, crs = x$crs)
    }
  } else {
    if(!enco == "UTF-8"){
      a <- sf::st_read(x$url, crs = x$crs, options = glue::glue("ENCODING=", enco))
    } else {
      a <- sf::st_read(x$url, crs = x$crs) 
    }
  }
  a <- a %>% sf::st_transform(crs)
  return(a)
}
