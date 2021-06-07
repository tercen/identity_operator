library(tercen)
library(dplyr)

# Set appropriate options
#options("tercen.serviceUri"="http://tercen:5400/api/v1/")
#options("tercen.workflowId"= "4133245f38c1411c543ef25ea3020c41")
#options("tercen.stepId"= "2b6d9fbf-25e4-4302-94eb-b9562a066aa5")
#options("tercen.username"= "admin")
#options("tercen.password"= "admin")

identity <- function(df, pair_length) {
  pair1 <- df$.y[1:pair_length]
  pair2 <- df$.y[(2*pair_length+1):(3*pair_length)]
  df %>% mutate(identity = c(pair1, pair1, pair2, pair2))
}

ctx = tercenCtx()

pair_length <- ifelse(is.null(ctx$op.value('Pair length')), 3, as.integer(ctx$op.value('Pair length')))

ctx %>% 
  select(.ci, .ri, .y) %>%
  group_by(.ri) %>%
  do(identity(., pair_length)) %>%
  ctx$addNamespace() %>%
  ctx$save()
