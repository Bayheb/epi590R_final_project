#fit mlr model
mlr_regression_model <- lm(TimeToRecurrence ~ Age + PVol + TVol_label,
									 data = data
)

#mlr table
tbl_regression(
	mlr_regression_model,
	label = list(
		PVol ~ "Prostate Volume",
		TVol_label ~ "Tumor Volume"
	))

#histogram
hist(data$TimeToRecurrence, main = "Histogram #1",
														xlab = "Time to Recurrence (Months)")


