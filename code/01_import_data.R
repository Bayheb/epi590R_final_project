library(medicaldata)
library(here)
data <- medicaldata::blood_storage


#create a new saveRDS function
new_save_rds <- function(object, filename, output_dir = 'output') {
	saveRDS(
		{{ object }},
		file = file.path(output_dir, filename))
}

new_save_rds(data, 'data.rds')


