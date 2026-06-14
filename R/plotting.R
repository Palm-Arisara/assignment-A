## Plotting ##

# Functions for visualising model results. Sourced by `part1a_r.Rmd`

# Scatter plot of predicted vs. actual BMI with a y = x reference line

# Reused for both the train and the test set (one function, two calls)

#' @param predicted Numeric vector of predictions
#' @param actual    Numeric vector of observed values
#' @param main      Plot title
#' @return Invisibly NULL; called for its plotting side effect

plot_pred_vs_actual <- function(predicted, actual,
                                main = "Predicted vs. actual") {
  plot(predicted, actual, pch = 16, col = grDevices::rgb(0, 0, 0, 0.5),
       xlab = "Predicted BMI", ylab = "Actual BMI", main = main)
  graphics::abline(a = 0, b = 1, col = "red", lty = 3)  
  invisible(NULL)
}
