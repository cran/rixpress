## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----eval = FALSE-------------------------------------------------------------
# library(rix)
# 
# rix(
#   date = "2025-09-04",
#   r_pkgs = c(
#     "arrow",
#     "dplyr",
#     "tidyr",
#     "ggplot2",
#     "hexbin"
#   ),
#   git_pkgs = list(
#     list(
#       package_name = "rix",
#       repo_url = "https://github.com/ropensci/rix/",
#       commit = "HEAD"
#     ),
#     list(
#       package_name = "rixpress",
#       repo_url = "https://github.com/ropensci/rixpress",
#       commit = "HEAD"
#     )
#   ),
#   jl_conf = list(
#     jl_version = "1.10",
#     jl_pkgs = c(
#       "Arrow",
#       "DataFrames",
#       "SparseArrays",
#       "LinearAlgebra"
#     )
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
#   rxp_jl(d_size, '150'),
# 
#   rxp_jl(
#     data,
#     "0.1randn(d_size,d_size) + reshape( \
#     cholesky(gridlaplacian(d_size,d_size) + 0.003I) \\ randn(d_size*d_size), \
#     d_size, \
#     d_size \
#     )",
#     user_functions = "functions.jl"
#   ),
# 
#   rxp_jl(
#     laplace_df,
#     'DataFrame(data, :auto)',
#     encoder = 'arrow_write',
#     user_functions = "functions.jl"
#   ),
# 
#   rxp_r(
#     laplace_long_df,
#     prepare_data(laplace_df),
#     decoder = 'read_ipc_file',
#     user_functions = "functions.R"
#   ),
# 
#   rxp_r(
#     gg,
#     make_gg(laplace_long_df)
#   )
# 
# ) |>
#   rxp_populate(build = TRUE)

## ----eval = FALSE-------------------------------------------------------------
# prepare_data <- function(laplace){
#   laplace_df |>
#     mutate(
#       x_id = row_number()
#     ) |>
#     tidyr::pivot_longer(-x_id, names_to = "y_id", values_to = "z") |>
#     mutate(
#       y_id = gsub("x", "", y_id),
#       y_id = as.numeric(y_id)
#     )
# }
# 
# make_gg <- function(laplace_long_df){
#   laplace_long_df |>
#     ggplot(aes(x = x_id, y = y_id, z = z)) +
#     stat_summary_hex(fun = function(x) mean(x), bins = 45)  +
#     scale_fill_viridis_c(option = 12) +
#     theme_void() +
#     theme(legend.position = "none") +
#     labs(subtitle = "hexagonal 2-d heatmap of laplacian matrix")
# }
# 
# save_gg <- function(path, gg){
#   ggsave("gg.png", gg)
# }

