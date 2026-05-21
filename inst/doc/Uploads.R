## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup, eval=FALSE--------------------------------------------------------
# library(REDCapSync)

## ----eval=FALSE, message=FALSE------------------------------------------------
# project <- load_project("TEST_CLASSIC")$sync()
# 
# new_branching <- sample(c("Yes", "No"), size = 50, replace = TRUE)
# 
# # add 50 records
# upload_this <- data.frame(record_id = as.character(51:100),
#                           var_branching = new_branching,
#                           ecog_at_diagnosis = "0")
# 
# project$upload(upload_this) # will also trigger sync/update

