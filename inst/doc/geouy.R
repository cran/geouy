## ---- include = FALSE----------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- eval=FALSE, message=FALSE, warning=FALSE, include=TRUE-------------
#  # install.packages('devtools') si no tiene instalado devtools
#  devtools::install_github("RichDeto/geouy")

## ----setup, message=FALSE, warning=FALSE, include=TRUE-------------------
knitr::opts_chunk$set(
	eval = FALSE,
	message = FALSE,
	warning = FALSE,
	include = FALSE
)
library(geouy)

## ----eval=FALSE, message=FALSE, warning=FALSE, include=FALSE-------------
#  depor <- geouy::load_geouy("Instituciones deportivas")

## ----eval=FALSE, message=FALSE, warning=FALSE, include=FALSE-------------
#  nuevas <- data.frame(cbind(dpto = c("Montevideo", "Salto"),
#                             loc = c("Montevideo", "Salto"),
#                             dir = c("Cebollati esq. Magallanes",
#                                     "15 de noviembre 1310")),
#                       stringsAsFactors = F)
#  nuevas_geo <- geocode_ide_uy(nuevas)
#  

## ----eval=FALSE, message=FALSE, warning=FALSE, include=FALSE-------------
#  depor_dep <- geouy::which_uy(depor, "Departamentos")

