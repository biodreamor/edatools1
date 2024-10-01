## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----example------------------------------------------------------------------
library(edatools)
df_info <- contents(happiness)
print(df_info,digits=3)

