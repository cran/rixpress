## ----eval = FALSE-------------------------------------------------------------
# library(rixpress)
# 
# rxp_init()

## ----eval = FALSE-------------------------------------------------------------
# # This script defines the default environment the pipeline runs in.
# # Add the required packages to execute the code necessary for each derivation.
# # If you want to create visual representations of the pipeline, consider adding
# # `{visNetwork}` and `{ggdag}` to the list of R packages.
# library(rix)
# 
# # Define execution environment
# rix(
#   date = NULL,
#   r_pkgs = NULL,
#   py_conf = NULL,
#   git_pkgs = list(
#     "package_name" = "rixpress",
#     "repo_url" = "https://github.com/ropensci/rixpress",
#     "commit" = "HEAD"
#   ),
#   ide = "none",
#   project_path = "."
# )

## ----eval = FALSE-------------------------------------------------------------
# library(rix)
# 
# # Define execution environment
# rix(
#   date = "2025-04-11",
#   r_pkgs = c("dplyr", "igraph"),
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
# library(igraph)
# 
# list(
#   rxp_r_file(
#     name = NULL,
#     path = NULL,
#     read_function = \(x) read.csv(file = x, sep = ",")
#   ),
#   rxp_r(
#     name = NULL,
#     expr = NULL
#   )
# ) |> rxp_populate(build = TRUE)

## ----eval = FALSE-------------------------------------------------------------
# library(rixpress)
# library(igraph)
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
#     expr = filter(mtcars, am == 1)
#   )
# ) |> rxp_populate(build = TRUE)

## ----eval = FALSE-------------------------------------------------------------
# rxp_read("filtered_mtcars")

## ----eval = FALSE-------------------------------------------------------------
# filtered_mtcars <- rxp_read("filtered_mtcars")

## ----eval = FALSE-------------------------------------------------------------
# library(rixpress)
# library(igraph)
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
#     expr = filter(mtcars, am == 1)
#   ),
# 
#   rxp_r(
#     name = mtcars_mpg,
#     expr = select(filtered_mtcars, mpg)
#   )
# ) |>
#   rxp_populate(build = TRUE)

