## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----eval = FALSE-------------------------------------------------------------
# d0 <- rxp_r_file(
#   name = mtcars,
#   path = 'data/mtcars.csv',
#   read_function = \(x) (read.csv(file = x, sep = "|"))
# )

## ----eval = FALSE-------------------------------------------------------------
# d1 <- rxp_r(
#   name = filtered_mtcars,
#   expr = dplyr::filter(mtcars, am == 1)
# )

## ----eval = FALSE-------------------------------------------------------------
# d2 <- rxp_r(
#   name = mtcars_mpg,
#   expr = dplyr::select(filtered_mtcars, mpg)
# )

## ----eval = FALSE-------------------------------------------------------------
# derivs <- list(d0, d1, d2)

## ----eval = FALSE-------------------------------------------------------------
# rxp_populate(derivs)

## ----eval = FALSE-------------------------------------------------------------
# library(rixpress)
# 
# list(
#   rxp_r_file(
#     name = mtcars,
#     path = 'data/mtcars.csv',
#     read_function = \(x) (read.csv(file = x, sep = "|"))
#   ),
# 
#   rxp_r(
#     name = filtered_mtcars,
#     expr = dplyr::filter(mtcars, am == 1)
#   ),
# 
#   rxp_r(
#     name = mtcars_mpg,
#     expr = dplyr::select(filtered_mtcars, mpg)
#   )
# ) |>
#   rxp_populate()

## ----eval = FALSE-------------------------------------------------------------
# library(rix)
# 
# rix(
#   date = "2025-04-11",
#   r_pkgs = "dplyr",
#   ide = "rstudio",
#   project_path = ".",
#   overwrite = TRUE
# )

## ----eval = FALSE-------------------------------------------------------------
# library(rix)
# 
# # Define execution environment
# rix(
#   date = "2025-04-11",
#   r_pkgs = "dplyr",
#   git_pkgs = list(
#     package_name = "rixpress",
#     repo_url = "https://github.com/ropensci/rixpress",
#     commit = "HEAD"
#   ),
#   ide = "rstudio",
#   project_path = ".",
#   overwrite = TRUE
# )

## ----eval = FALSE-------------------------------------------------------------
# library(rixpress)
# # Define pipeline
# list(
#   rxp_r_file(
#     name = mtcars,
#     path = 'data/mtcars.csv',
#     read_function = \(x) (read.csv(file = x, sep = "|"))
#   ),
# 
#   rxp_r(
#     name = filtered_mtcars,
#     expr = dplyr::filter(mtcars, am == 1)
#   ),
# 
#   rxp_r(
#     name = mtcars_mpg,
#     expr = dplyr::select(filtered_mtcars, mpg)
#   )
# ) |>
#   rxp_populate(project_path = ".")

