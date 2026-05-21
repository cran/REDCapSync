## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----example, eval=FALSE------------------------------------------------------
# library(REDCapSync)
# projects$print()
# # View(projects$df())                   # Vew your previously saved projects

## ----eval=FALSE---------------------------------------------------------------
# # 1.) setting your token -------------------------------------------------------
# Sys.setenv(REDCAPSYNC_FIRST_PROJECT = "YoUrNevErShaReToken")    # in console
# # or WAY BETTER put this in your .Renviron file...
# # REDCAPSYNC_FIRST_PROJECT = 'YoUrNevErShaReToken
# # Then save file, restart R session (`.rs.restartR()`) and library(REDCapSync)
# 
# # 2.) setting up a project -----------------------------------------------------
# project <- setup_project(
#   project_name = "FIRST_PROJECT",
#   redcap_uri = "https://redcap.fake.edu/api/",             # same as REDCapR
#   dir_path = getwd(),                            # choose appropriate folder
#   sync_frequency = "daily",                          # only checks max daily
#   get_entire_log = TRUE                       # for small or medium projects
# )
# 
# # install.packages("keyring")
# project$test_token()                    # will launch keyring if token fails
# 
# # 3.) running project$sync() ---------------------------------------------------
# project$sync()
# 
# project$generate_dataset("custom", envir = globalenv())

## ----eval=FALSE---------------------------------------------------------------
# #1. set in your Renviron file
# usethis::edit_r_environ()                                 #finds your file
# # another way to find same file
# rstudioapi::navigateToFile(file.path(Sys.getenv("HOME")), ".Renviron"))
# # Then you add --> `REDCAPSYNC_FIRST_PROJECT = 'YoUrNevErShaReToken'`
# # then save file and restart R session (`.rs.restartR()`) and reload package
# 
# #2. set to your token with keyring package! (make sure is installed)
# keyring::key_set(service = config$keyring.service(), # for keyring
#                  username = "FIRST_PROJECT", # is project_name
#                  keyring = config$keyring()) # now enter token in pop-up
# # ... or if have project object already
# project$set_keyring_token() # now enter token in pop-up
# 
# #3. set each time in your console or script (not recommended!) RISKY
# Sys.setenv(REDCAPSYNC_FIRST_PROJECT = "YoUrNevErShaReToken")
# 
# # Confirm
# # If it worked you will see your token when you run...
# Sys.getenv("REDCAPSYNC_FIRST_PROJECT") # for R eviron
# # or...
# keyring::key_get(service = config$keyring.service(), # for keyring
#                  username = "FIRST_PROJECT", # is project_name
#                  keyring = config$keyring())

## ----eval=FALSE---------------------------------------------------------------
# # raw REDCap -------------------------------------------------------------------
# forms <- project$metadata$forms
# fields <- project$metadata$fields
# choices <- project$metadata$choices
# log <- project$redcap$log
# users <- project$redcap$users
# form1 <- project$data$form1
# form2 <- project$data$form2
# # project$data |> list2env(globalenv()) # all forms to global
# 
# # summarized REDCap ------------------------------------------------------------
# # has added columns using log to annotate metadata and users etc. customizable
# # help(dataset)
# # dataset <- project$load_dataset("REDCapSync") # de-identified and no free text
# dataset <- project$generate_dataset("custom") # identified (see parameters)
# annotated_forms <- dataset$metadata$forms
# annotated_fields <- dataset$metadata$fields
# annotated_choices <- dataset$metadata$choices
# annotated_users <- dataset$users
# merged <- dataset$data$merged
# # dataset$data |> list2env(globalenv()) # all forms to global
# # dataset$to_envir(globalenv()) # send to R global env
# # can modify if you want before save (the actual dataset object not global)
# # dataset$save() # will save to output folder by default

## ----eval=FALSE---------------------------------------------------------------
# project$load_dataset(summary_name = "REDCapSync", envir = globalenv())

## ----eval=FALSE---------------------------------------------------------------
# project$generate_dataset(
#   dataset_name = "custom_name"
#   filter_field = "has_something"  # Raw REDCap variable name
#   filter_choices = "Yes"          # REDCap labelled choice
#   exclude_identifiers = TRUE,
#   exclude_free_text = TRUE,
#   include_metadata = TRUE,
#   envir = globalenv()
# )

