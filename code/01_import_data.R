library(medicaldata)
library(here)
data <- medicaldata::blood_storage
saveRDS(scurvy, file = here::here('data/raw/data.rds'))

