#fit mlr model
mlr_regression_model <- lm(TimeToRecurrence ~ Age + PVol + TVol_label,
									 data = data
)

#mlr table
regression_table <- tbl_regression(
	mlr_regression_model,
	label = list(
		PVol ~ "Prostate Volume",
		TVol_label ~ "Tumor Volume"
	))
regression_table
new_save_rds(regression_table, 'regression_table.rds')

#histogram
hist <- hist(data$TimeToRecurrence, main = "Histogram #1",
														xlab = "Time to Recurrence (Months)")
new_save_rds(hist, 'hist.rds')

