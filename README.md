# geouy <img align="right" src="man/figures/geouy_logo_a.png" alt="logo" width="160"> <img align="right" src="man/figures/geouy_logo_b.png" alt="logo" width="160">

<!-- badges: start -->
[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![Travis build status](https://travis-ci.org/RichDeto/geouy.svg?branch=master)](https://travis-ci.org/RichDeto/geouy)
[![AppVeyor build status](https://ci.appveyor.com/api/projects/status/github/RichDeto/geouy?branch=master&svg=true)](https://ci.appveyor.com/project/RichDeto/geouy)
[![Codecov test coverage](https://codecov.io/gh/RichDeto/geouy/branch/master/graph/badge.svg)](https://codecov.io/gh/RichDeto/geouy?branch=master)
[![DOI](https://zenodo.org/badge/229800365.svg)](https://zenodo.org/badge/latestdoi/229800365)
<!-- badges: end -->

**geouy** is an R package that allows users to easily access official spatial data sets of Uruguay. The package includes a wide range of geospatial datasets as *simple features* (`sf`), available at various geographic scales and for various years with harmonized attributes and projection (see detailed list below).

## Installation

```R
# Use the development version with latest features
  utils::remove.packages('geouy')
  devtools::install_github("RichDeto/geouy")
  library(geouy)
```
obs. If you use **Linux**, you need to install a couple dependencies before installing the libraries `sf` and `geouy`. [More info here](https://github.com/r-spatial/sf#linux).


## Basic Usage

The syntax of all `geouy` functions operate one the same logic so it becomes intuitive to download any data set using a single line of code. Like this:

```R
secc <- load_geouy("Secciones")
```

## Available datasets:


| Layer | Productor | Server | Year | Format |
|-----|-----|-----|-----|-----|
|`"Uruguay"`| `"INE"` | MIDES | 2011 | wfs |
|`"Areas administrativas"`| `"SGM"` | SGM | 2011 | wfs |
|`"Limites departamentales"`| `"IGM"` | IGM | 2011 | wfs |
|`"Departamentos"`| `"IDE"` | MIDES | 2011 | wfs |
|`"Secciones"`| `"INE Censo"` | MIDES | 2011 | wfs |
|`"Secc MVD 2004"`| `"INE"` | MIDES | 2004 | wfs |
|`"Segmentos"`| `"INE Censo"` | MIDES | 2011 | wfs |
|`"Segm MVD 2004"`| `"INE"` | MIDES | 2004 | wfs |
|`"Segm URB INT 2004"`| `"INE"` | MIDES | 2004 | wfs |
|`"Zonas"`| `"INE Censo"` | MIDES | 2011 | wfs |
|`"Zonas MVD 2004"`| `"INE"` | MIDES | 2004 | wfs |
|`"Zonas URB INT 2004"`| `"INE"` | MIDES | 2004 | wfs |
|`"Localidades pg"`| `"INE Censo"` | MIDES | 2011 | wfs |
|`"Localidades pt"`| `"INE Censo"` | MIDES | 2011 | wfs |
|`"Centros poblados pg"`| `"SGM"` | SGM | 2011 | wfs |
|`"Centros poblados pt"`| `"SGM"` | SGM | 2011 | wfs |
|`"Municipios"`| `"IGM"` | IGM | 2011 | wfs |
|`"Asentamientos irregulares"`| `"PMB"` | MIDES | 2014 | wfs |
|`"Barrios"` | `"INE"` | MIDES | 2011 | wfs |
|`"Balnearios"`| `"MTOP"` | MTOP |  2017 | wfs |
|`"Cursos de agua navegables y flotables"` | `"MTOP"` | MTOP | 2019 | wfs |
|`"Lagunas publicas"` | `"MTOP"` | MTOP | 2019 |  wfs |
|`"Rutas"` | `"IDE"` | MIDES | 2017 | wfs |
|`"Calles"` | `"IDE - UTE - IM"` | MIDES | 2017 | wfs |
|`"Peajes"` | `"MTOP"` | MTOP | 2019 | wfs |
|`"Instituciones deportivas"` | `"IDE"` | MIDES | 2015 | wfs |
|`"Postes Kilometros"` |`"MTOP"` | MTOP | 2019 | wfs |
|`"Grilla ortofotos urbana"` | `"IDE"` | IDE | 2019 | wfs |
|`"Grilla ortofotos nacional"` | `"IDE"` | IDE | 2019 | wfs |


### Other functions:


| Function | Action|
|-----|-----|
|`which_uy` | Add to an 'sf' object its spatial coincidence with one or more administrative units in Uruguay, generating the corresponding variables. | 
|`tiles_ide_uy`| Download .tif files from the IDEuy orthophotos repository, according to a 'sf' object bbox. |
|`geocode_ide_uy`| Allows geocoding directions using IDE_uy. |
|`plot_geouy`| Plot a variable of your sf object with north and scale, set on a simple theme. | 
|`is.uy4326`| Test if an 'sf' object match with Uruguay at crs = 4326. |
|`is.uy32721`| Test if an 'sf' object match with Uruguay at crs = 32721.  |
| ... | ... | 

## History

This package arises from the conjugation of own ideas with an eye on the region. It started as a part of the package where I work with @calcita at [ech](https://github.com/calcita/ech), and some geospatial service packages in the region mainly: 
[geobr](https://github.com/ipeaGIT/geobr) and 
[chilemapas](https://github.com/pachamaltese/chilemapas)

This walk on the shoulders of giants, allows this package focused on this small country (my beautiful Uruguay), to have its own particularities although it tries to fit especially to [geobr](https://github.com/ipeaGIT/geobr) in its structure and with a view to complementing [ech](https://github.com/calcita/ech).

## Community contributions [es](https://github.com/RichDeto/geouy/issues/1)

This package intends to incorporate any function of general requirements that use the geographic data of Uruguay as a base. All contributions in this regard are welcome.

If you work with geographic data of Uruguay and want to add your function or data, we recommend that you read the following tips on how to collaborate:

### To add your function:

    - Fork of this repository
    - Add your function as an `.R` file in the `R/` folder with the same name as the function
    - Document it with `roxygen2` clarifying its functionality, parameters and an example of use. To see how it is documented to review another function in the same directory
    - Remember at the end of the documentation you must add a # '@export
    - Check that the types and values of your function parameters are fine (for example, you can look at `data-raw/metadata.R`
    - Add the dependencies in the `DESCRIPTION` file 
    - Check the package with devtools::check()
    - If everything works fine, then make a pull request

### To add geographic data to the `load_geouy()` function:

    - Fork of this repository
    - Identify the corresponding WFS service URL
    - Add a record to the `metadata` file in the `data-raw/` directory, with the corresponding data.
    - Also include this record in the corresponding table of the `README.md` file, with the corresponding format.
    - If everything works fine, then make a pull request
