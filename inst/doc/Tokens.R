## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----eval=FALSE---------------------------------------------------------------
# #Install usethis if you don't have it.
# #install.packages("usethis")
# usethis::edit_r_environ()
# # Now save your token.... (without the comment symbol '#')
# # REDCAPSYNC_FIRST_PROJECT = "faKeTokeN"
# # Save the file and Close
# # Restart R Session (session tab)
# # .rs.restartR() # this will also restart R session for you.
# Sys.getenv("REDCAPSYNC_FIRST_PROJECT") # now should contain your token

## ----eval=FALSE---------------------------------------------------------------
# project <- load_project("TEST_CLASSIC")
# 
# project$set_keyring_token() # now enter token in pop-up
# # internally the package checks ...
# #1. Sys.getenv()
# token <- Sys.getenv(project$.internal$token_name)
# #2. followed by keyring
# token <- keyring::key_get(service = config$keyring.service(),
#                           username = project$project_name,
#                           keyring = config$keyring())
# # you could set with the following; not preferred because token in script
# # if you do this set in securely in file that no one can ever see; never github!
# keyring::key_set_with_value(service = config$keyring.service(),
#                             username = project$project_name,
#                             password = "VeryNOTsecureWayToSetYourTOKEN",
#                             keyring = config$keyring())

## ----eval=FALSE---------------------------------------------------------------
# options(redcapsync.config.keyring = "REDCapSync")
# # with this kind of method you could define multiple tokens in a private/secret
# # .R file which can be sourced to set all tokens in akeyring. Can also be
# # locked and unlocked (see keyring webstite for details)

## ----eval=FALSE---------------------------------------------------------------
# # Set your token manually
# # again having this in a script is not advised but possible
# Sys.setenv(REDCAPSYNC_FIRST_PROJECT="a_FaKe_TOkEn")
# 
# # Get your token
# Sys.getenv("REDCAPSYNC_FIRST_PROJECT")
# #>[1] "a_FaKe_TOkEn"

## ----eval=FALSE---------------------------------------------------------------
# project <- load_project("TEST_CLASSIC") # replace project name with yours
# 
# project$test_token()

