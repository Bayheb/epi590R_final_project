mlr_regression_model <- lm(TimeToRecurrence ~ Age + PVol + TVol_label,
									 data = data
)

tbl_regression(
	mlr_regression_model,
	label = list(
		PVol ~ "Prostate Volume",
		TVol_label ~ "Tumor Volume"
	))
