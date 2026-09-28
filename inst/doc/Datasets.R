## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----eval=FALSE---------------------------------------------------------------
# library(REDCapSync)

## ----eval=FALSE---------------------------------------------------------------
# save_dir <- tempdir() # replace with your intended folder
# 
# project <- load_project("TEST_CLASSIC")
# 
# project$sync() #optional sync
# 
# project$add_field(
#   field_name = "letter_b",
#   field_label = "Letter B?",
#   form_name = "text",
#   data_func = function(project) {
#     project$data$text$var_text_letters == "b"
#   }
# )
# 
# project$add_field(
#   field_name = "factor_sml",
#   form_name = "text",
#   field_type_r = "factor",
#   field_choices = c("Small", "Medium", "Large"),
#   data_func = function(project) {
#     nums <- as.integer(project$data$text$var_text_integer)
#     final <- ifelse(nums <= 33, "Small", ifelse(nums <= 66, "Medium", "Large"))
#     final # must be in same order as original
#   }
# )
# 
# dataset <- project$generate_dataset("custom", exclude_identifiers = FALSE)
# 
# dataset$data$merged$letter_b
# 
# dataset$data$merged$factor_sml
# 
# dataset$data$merged[, c("var_text_integer", "factor_sml")]
# 
# # send data in global environment
# dataset$to_envir(globalenv())
# 
# # preview file from temporary directory
# dataset$preview()
# 
# # save data in custom location
# dataset$save(dir_other = save_dir)
# 
# # open folder where file was saved
# browseURL(save_dir)

## ----eval=FALSE---------------------------------------------------------------
# save_dir <- tempdir() # replace with your intended folder
# 
# dataset <- projects$load("TEST_CLASSIC")$sync()$load_dataset("REDCapSync")
# # add quick custom variable
# # in future version you can use project$add_field for this
# dataset$data$merged$letter_b <- dataset$data$merged$var_text_letters == "b"
# 
# # send data in global environment
# dataset$to_envir(globalenv())
# 
# # save data in custom location
# dataset$save(dir_other = save_dir) # dir_other not needed for non-test-projects
# 
# # open folder where file was saved
# browseURL(save_dir)

## ----eval=FALSE---------------------------------------------------------------
# projects$load("TEST_CLASSIC")$
#   sync()$
#   load_dataset("REDCapSync", envir = globalenv())

## ----eval=FALSE---------------------------------------------------------------
# save_dir <- tempdir() # replace with your intended folder
# 
# #load and sync (load_project(...) is the same as projects$load(...))
# project <- load_project("TEST_LONGITUDINAL")$sync()
# 
# # see field_names
# project$metadata$fields$field_name
# 
# males_dataset <- project$generate_dataset(dataset_name = "males",
#                                           envir = globalenv(), # global env
#                                           filter_field = "birth_sex",
#                                           filter_choices = "Male")
# # if you check merged and survey it will only contain males
# unique(males_dataset$data$merged$birth_sex) # Male
# unique(males_dataset$data$survey$birth_sex) # Male
# 
# females_dataset <- project$generate_dataset(dataset_name = "females",
#                                             envir = globalenv(), # global env
#                                             filter_field = "birth_sex",
#                                             filter_choices = "Female")
# # if you check merged and survey it will only contain males
# unique(females_dataset$data$merged$birth_sex) # Female
# unique(females_dataset$data$survey$birth_sex) # Female
# 
# # if you want this saved to excel one time you can do
# females_dataset$save(dir_other = save_dir) # dir_other not needed for default
# 
# # To keep this analysis refreshing with each sync use project$add_dataset(..,)
# project$add_dataset(dataset_name = "males",
#                     filter_field = "birth_sex",
#                     filter_choices = "Male")
# # not it can be loaded by name!
# males_dataset <- project$load_dataset("males") # will not send to global
# 
# project$load_dataset("males", envir = globalenv()) # will send to global
# 
# project$save_dataset("males") # will save AND keep track in project object
# 
# project$sync() # once defined will save datasets with sync

## ----eval=FALSE---------------------------------------------------------------
# #load and sync add datasets and save
# project <- load_project("TEST_LONGITUDINAL")$
#   sync()$
#   add_dataset(dataset_name = "males",
#               filter_field = "birth_sex",
#               filter_choices = "Male")$
#   add_dataset(dataset_name = "females",
#               filter_field = "birth_sex",
#               filter_choices = "Female")
# # load males
# project$load_dataset("males", envir = globalenv()) # will send to global
# 
# # load females
# project$load_dataset("females", envir = globalenv()) # will send to global
# 
# # load all default
# project$load_dataset("REDCapSync", envir = globalenv()) # will send to global
# 
# project$load_dataset("males")$preview() # open temporary excel
# project$load_dataset("females")$preview() # open temporary excel
# 
# # can trigger saves with `project$save_datasets()` or default `project$sync()`
# project$save_datasets()
# project$sync()

