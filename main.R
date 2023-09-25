suppressPackageStartupMessages({
  library(tercenApi)
  library(tercen)
  library(dplyr, warn.conflicts = FALSE)
})

ctx = tercenCtx()

ctx  %>% 
  select(.y, .ci, .ri) %>% 
  rename(identity = .y) %>%
  ctx$addNamespace() %>%
  ctx$save()
