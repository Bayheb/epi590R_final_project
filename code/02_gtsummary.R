library(gtsummary)
library(dplyr)

#read in data object
data <- readRDS(
	file = here::here("data/raw/data.rds"))

#add labeled variable for TVol
data <- data |>
	mutate(TVol_label = recode_values(
		TVol,
		1 ~ "Low",
		2 ~ "Medium",
		3 ~ "Extensive"
	))

#create tbl_summary
table_one <- tbl_summary(
	data,
	include = c(
	Age, AA, FamHx, PVol, TVol_label
	),
	label = list(
		AA ~ "African American",
		FamHx ~ "Family History",
		PVol ~ "Prostate Volume",
		TVol_label ~ "Tumor Volume"
	),
	missing_text = "Missing"
)
table_one

#save table as rds object
new_save_rds(table_one, 'table_one.rds')
