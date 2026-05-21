## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library(REDCapSync)

## ----eval=TRUE----------------------------------------------------------------
TEST_CLASSIC <- load_project(project_name = "TEST_CLASSIC")
listviewer::jsonedit(TEST_CLASSIC$.internal)

## ----setup, eval=TRUE---------------------------------------------------------
project <- load_project("TEST_CLASSIC")

# projects have read-only active bindings
names(REDCapSyncProject$active)

# projects have public methods
names(REDCapSyncProject$public_methods) |> setdiff("initialize")

