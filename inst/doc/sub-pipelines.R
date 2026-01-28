## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----sub-pipeline-1, eval = FALSE---------------------------------------------
# # Data Preparation Sub-Pipeline
# # pipelines/01_data_prep.R
# library(rixpress)
# 
# list(
#   rxp_r(name = raw_mtcars, expr = mtcars),
#   rxp_r(name = clean_mtcars, expr = dplyr::filter(raw_mtcars, am == 1)),
#   rxp_r(name = selected_mtcars, expr = dplyr::select(clean_mtcars, mpg, cyl, hp, wt))
# )

## ----sub-pipeline-2, eval = FALSE---------------------------------------------
# # Analysis Sub-Pipeline
# # pipelines/02_analysis.R
# library(rixpress)
# 
# list(
#   rxp_r(name = summary_stats, expr = summary(selected_mtcars)),
#   rxp_r(name = mpg_model, expr = lm(mpg ~ hp + wt, data = selected_mtcars)),
#   rxp_r(name = model_coefs, expr = coef(mpg_model))
# )

## ----master-script, eval = FALSE----------------------------------------------
# # gen-pipeline.R
# library(rixpress)
# 
# # Create named pipelines with colours by pointing to the files
# pipe_data_prep <- rxp_pipeline(
#   name = "Data Preparation",
#   path = "pipelines/01_data_prep.R",
#   color = "#E69F00"
# )
# 
# pipe_analysis <- rxp_pipeline(
#   name = "Statistical Analysis",
#   path = "pipelines/02_analysis.R",
#   color = "#56B4E9"
# )
# 
# # Build combined pipeline
# rxp_populate(list(pipe_data_prep, pipe_analysis), project_path = ".", build = TRUE)

## ----color-modes, eval = FALSE------------------------------------------------
# # Dual encoding: fill = type, border = pipeline (default when pipelines are defined)
# rxp_ggdag(color_by = "pipeline")
# 
# # Colour entirely by derivation type (rxp_r, rxp_py, etc.) - original behaviour
# rxp_ggdag(color_by = "type")

