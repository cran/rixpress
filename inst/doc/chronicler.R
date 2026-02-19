## ----eval = FALSE-------------------------------------------------------------
# library(chronicler)
# 
# # Create a recorded version of sqrt
# r_sqrt <- record(sqrt)
# 
# # Success case
# result <- r_sqrt(4)
# result$value
# #> Just
# #> [1] 2
# 
# # Failure case: sqrt(-1) produces a warning "NaNs produced"
# # With default strict=2, warnings are treated as failures
# result <- r_sqrt(-1)
# result$value
# #> Nothing

## ----eval = FALSE-------------------------------------------------------------
# library(rixpress)
# 
# list(
#   rxp_r(
#     name = result,
#     expr = r_sqrt(-1),  # This produces a `Nothing` value, not an error!
#     user_functions = "functions.R"
#   )
# ) |> rxp_populate(build = FALSE)

## ----eval = FALSE-------------------------------------------------------------
# # Build the pipeline - chronicle status is checked automatically!
# rxp_make()

## ----eval = FALSE-------------------------------------------------------------
# # functions.R
# library(chronicler)
# 
# r_filter <- record(dplyr::filter)
# r_pull <- record(dplyr::pull)
# r_sqrt <- record(sqrt)
# r_mean <- record(mean)

## ----eval = FALSE-------------------------------------------------------------
# library(rixpress)
# 
# list(
#   # Read data (not a chronicle)
#   rxp_r_file(
#     name = mtcars,
#     path = "data/mtcars.csv",
#     read_function = \(x) read.csv(file = x, sep = "|")
#   ),
# 
#   # Filter using chronicler - SUCCESS
#   rxp_r(
#     name = filtered_mtcars,
#     expr = mtcars |> r_filter(am == 1),
#     user_functions = "functions.R"
#   ),
# 
#   # Pull column - SUCCESS
#   rxp_r(
#     name = mtcars_mpg,
#     expr = filtered_mtcars |> bind_record(r_pull, mpg),
#     user_functions = "functions.R"
#   ),
# 
#   # Compute mean - SUCCESS
#   rxp_r(
#     name = mean_mpg,
#     expr = mtcars_mpg |> bind_record(r_mean),
#     user_functions = "functions.R"
#   ),
# 
#   # Intentional failure: sqrt(-1) - NOTHING
#   rxp_r(
#     name = sqrt_of_negative,
#     expr = r_sqrt(-1),
#     user_functions = "functions.R"
#   ),
# 
#   # Downstream of Nothing - also NOTHING
#   rxp_r(
#     name = downstream_of_nothing,
#     expr = sqrt_of_negative |> bind_record(r_mean),
#     user_functions = "functions.R"
#   )
# ) |>
#   rxp_populate(build = FALSE)

## ----eval = FALSE-------------------------------------------------------------
# rxp_make()
# 
# # You can also manually check chronicles at any time:
# # rxp_check_chronicles()

## ----eval = FALSE-------------------------------------------------------------
# rxp_read("sqrt_of_negative")
# #> Warning message:
# #> Derivation 'sqrt_of_negative' contains a chronicle with Nothing value!
# #>   Use chronicler::read_log() on this object for details.

## ----eval = FALSE-------------------------------------------------------------
# result <- rxp_read("sqrt_of_negative")
# read_log(result)

