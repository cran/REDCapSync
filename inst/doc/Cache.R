## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----eval=F-------------------------------------------------------------------
# library(REDCapSync) # don't forget to load the package

## ----eval=F-------------------------------------------------------------------
# redcapsync_cache_location <- tools::R_user_dir(package = "REDCapSync",
#                                                which = "cache")
# # launch the folder on your computer
# utils::browseURL(redcapsync_cache_location)
# # can modify with config options
# config$cache.dir()

## ----eval=F-------------------------------------------------------------------
# # clear entire cache (all projects)
# cache_clear()
# # clear specific project
# cache_clear("OLD_PROJECT1")
# # clear specific project1
# cache_clear(c("OLD_PROJECT2", "OLD_PROJECT3"))

## ----eval=F-------------------------------------------------------------------
# print.data.frame(projects$df)

