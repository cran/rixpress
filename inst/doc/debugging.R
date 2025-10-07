## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----eval=FALSE---------------------------------------------------------------
# rxp_inspect()

## ----eval=FALSE---------------------------------------------------------------
# rxp_trace("mtcars_mpg")

## ----eval=FALSE---------------------------------------------------------------
# list(
#   # We are actively changing the filter condition in this step
#   rxp_r(
#     name = preprocessed_data,
#     expr = filter(raw_data, year > 2020)
#   ),
#   # This step takes hours to run
#   rxp_r(
#     name = expensive_model,
#     expr = run_long_simulation(preprocessed_data)
#   ),
#   rxp_rmd(
#     name = final_report,
#     rmd_file = "report.Rmd" # Depends on expensive_model
#   )
# )
# 

## ----eval=FALSE---------------------------------------------------------------
# rxp_list_logs()

## ----eval=FALSE---------------------------------------------------------------
# # Inspect yesterday's successful build log
# rxp_inspect(which_log = "20250814")

## ----eval=FALSE---------------------------------------------------------------
# # Load the output of `mtcars_head` from yesterday's build
# old_head <- rxp_read("mtcars_head", which_log = "20250814")

