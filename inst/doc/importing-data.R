## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----eval = FALSE-------------------------------------------------------------
# library(rixpress)
# 
# list(
#   rxp_r_file(
#     name = mtcars,
#     path = 'data/mtcars.csv',
#     read_function = \(x) (read.csv(file = x, sep = "|"))
#   ),
# ...

## ----eval = FALSE-------------------------------------------------------------
# library(rixpress)
# 
# list(
#   rxp_r_file(
#     name = mtcars,
#     path = 'https://raw.githubusercontent.com/b-rodrigues/rixpress_demos/refs/heads/master/basic_r/data/mtcars.csv',
#     read_function = \(x) (read.csv(file = x, sep = "|"))
#   ),
# ...

## ----eval = FALSE-------------------------------------------------------------
# library(rixpress)
# 
# list(
#   rxp_r_file(
#     name = mtcars_r,
#     path = 'data',
#     read_function = \(x) {
#       (readr::read_delim(list.files(x, full.names = TRUE), delim = '|'))
#     }
#   )
# ) |>
#   rxp_populate(project_path = ".")

## ----eval = FALSE-------------------------------------------------------------
# library(rixpress)
# 
# list(
#   rxp_py_file(
#     name = mtcars_py,
#     path = 'data',
#     read_function = "read_many_csvs",
#     user_functions = "functions.py"
#   )
# ) |>
#   rxp_populate(project_path = ".")

## ----eval = FALSE-------------------------------------------------------------
# library(rixpress)
# 
# list(
#   rxp_py_file(
#     name = gdf,
#     # We provide the directory 'data' to ensure all shapefile components are copied.
#     path = 'data',
#     # The read_function must use the hardcoded path within the build environment.
#     read_function = "lambda x: geopandas.read_file('input_folder/data/oceans.shp', driver='ESRI Shapefile')"
#   ),
# 
#   rxp_py(
#     name = sa,
#     expr = "gdf.loc[gdf['Oceans'] == 'South Atlantic Ocean']['geometry'].loc[0]"
#   )
# ) |>
#   rxp_populate(project_path = ".")

