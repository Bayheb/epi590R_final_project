library(gtsummary)
library(dplyr)

#add labeled variable for TVol
data <- data |>
	mutate(TVol_label = case_match(
		TVol,
		1 ~ "Low",
		2 ~ "Medium",
		3 ~ "Extensive"
	))

#create tbl_summary
table <- tbl_summary(
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
table
