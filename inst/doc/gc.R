## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----eval=FALSE---------------------------------------------------------------
# rxp_list_logs()
# #>                                                         filename   modification_time size_kb
# #> 1 build_log_20250815_113000_a1b2c3d4e5f6g7h8i9j0k1l2m3n4o5p6.rds 2025-08-15 11:30:00    0.51
# #> 2 build_log_20250814_170000_z9y8x7w6v5u4t3s2r1q0p9o8n7m6l5k4.rds 2025-08-14 17:00:00    0.50

## ----eval=FALSE---------------------------------------------------------------
# # Preview what would be deleted if we keep artifacts from August 1st, 2025 onward.
# rxp_gc(keep_since = "2025-08-01", dry_run = TRUE) # dry_run = TRUE is actually the default

## ----eval=FALSE---------------------------------------------------------------
# # Keep builds from the last 30 days and delete everything older.
# thirty_days_ago <- Sys.Date() - 30
# rxp_gc(keep_since = thirty_days_ago)

## ----eval=FALSE---------------------------------------------------------------
# # This will trigger a full Nix garbage collection.
# rxp_gc()

