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

#make histogram
library(ggplot2)
hist_gg <- ggplot(data, aes(x = TimeToRecurrence)) +
	geom_histogram(binwidth = 2, fill = "blue", color = "white") +
	labs(x = "Time to Recurrence", y = "Count")
hist_gg
ggsave("output/hist_gg.png", width = 6, height = 4, dpi = 300)



