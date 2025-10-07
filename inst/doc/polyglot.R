## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----eval = FALSE-------------------------------------------------------------
# library(rix)
# 
# rix(
#   date = "2025-03-31",
#   r_pkgs = c("dplyr", "igraph", "reticulate", "quarto"),
#   git_pkgs = list(
#     package_name = "rixpress",
#     repo_url = "https://github.com/ropensci/rixpress",
#     commit = "HEAD"
#   ),
#   py_conf = list(
#     py_version = "3.12",
#     py_pkgs = c("pandas", "polars", "pyarrow")
#   ),
#   ide = "none",
#   project_path = ".",
#   overwrite = TRUE
# )

## ----eval = FALSE-------------------------------------------------------------
# library(rixpress)
# library(igraph)
# 
# list(
#   rxp_py_file(
#     name = mtcars_pl,
#     path = 'data/mtcars.csv',
#     read_function = "lambda x: pl.read_csv(x, separator='|')"
#   ),
# 
#   rxp_py(
#     # reticulate doesn't support polars DFs yet, so need to convert
#     # first to pandas DF
#     name = mtcars_pl_am,
#     expr = "mtcars_pl.filter(pl.col('am') == 1).to_pandas()"
#   ),
# 
#   rxp_py2r(
#     name = mtcars_am,
#     expr = mtcars_pl_am
#   ),
# 
#   rxp_r(
#     name = mtcars_head,
#     expr = my_head(mtcars_am),
#     user_functions = "functions.R"
#   ),
# 
#   rxp_r2py(
#     name = mtcars_head_py,
#     expr = mtcars_head
#   ),
# 
#   rxp_py(
#     name = mtcars_tail_py,
#     expr = 'mtcars_head_py.tail()'
#   ),
# 
#   rxp_py2r(
#     name = mtcars_tail,
#     expr = mtcars_tail_py
#   ),
# 
#   rxp_r(
#     name = mtcars_mpg,
#     expr = dplyr::select(mtcars_tail, mpg)
#   ),
# 
#   rxp_qmd(
#     name = page,
#     qmd_file = "my_doc/page.qmd",
#     additional_files = c("my_doc/content.qmd", "my_doc/images")
#   )
# ) |>
#   rxp_populate(
#     project_path = ".",
#     py_imports = c(polars = "import polars as pl")
#   )

## ----eval = FALSE-------------------------------------------------------------
# py_imports = c(pillow = "from PIL import Image")

## ----eval = FALSE-------------------------------------------------------------
# library(rixpress)
# library(igraph)
# 
# list(
#   rxp_py_file(
#     name = mtcars_pl,
#     path = "data/mtcars.csv",
#     read_function = "lambda x: pl.read_csv(x, separator='|')"
#   ),
# 
#   rxp_py(
#     name = mtcars_pl_am,
#     expr = "mtcars_pl.filter(pl.col('am') == 1)",
#     user_functions = "functions.py",
#     encoder = "serialize_to_json",
#   ),
# 
#   rxp_r(
#     name = mtcars_head,
#     expr = my_head(mtcars_pl_am),
#     user_functions = "functions.R",
#     decoder = "jsonlite::fromJSON"
#   ),
# 
#   rxp_r(
#     name = mtcars_mpg,
#     expr = dplyr::select(mtcars_head, mpg)
#   )
# ) |>
#   rxp_populate(
#     project_path = ".",
#     py_imports = c(polars = "import polars as pl")
#   )
# 
# # Plot DAG for CI
# rxp_dag_for_ci()

## ----eval = FALSE-------------------------------------------------------------
# rxp_qmd(
#   name = page,
#   qmd_file = "my_doc/page.qmd",
#   additional_files = c("my_doc/content.qmd", "my_doc/images"),
#   args = "--to typst"
# )

## ----eval = FALSE-------------------------------------------------------------
# rix(
#   date = "2025-03-31",
#   r_pkgs = c("dplyr", "igraph", "reticulate", "quarto"),
#   system_pkgs = "typst",
#   git_pkgs = list(...

