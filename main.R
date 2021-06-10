library(tercen)
library(dplyr)

ctx = tercenCtx()

ctx  %>% 
  select(.y, .ci, .ri) %>% 
  group_by(.ci, .ri) %>%
  summarise(identity = .y, .groups = "drop") %>%
  ctx$addNamespace() %>%
  ctx$save()