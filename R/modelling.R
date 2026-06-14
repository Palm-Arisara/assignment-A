## Modelling ##

# Functions for training the BMI model and measuring its error
# Sourced by `part1a_r.Rmd`

# Train a random-forest regressor for BMI

# Wraps the model configuration in one place so the hyper-parameters are
# documented and easy to change

#' @param x        Data frame of predictor columns
#' @param y        Numeric response vector (BMI)
#' @param ntree    Number of trees
#' @param nodesize Minimum size of terminal nodes
#' @param maxnodes Maximum number of terminal nodes per tree
#' @return A fitted `randomForest` model

train_bmi_model <- function(x, y, ntree = 100, nodesize = 5, maxnodes = 20) {
  randomForest::randomForest(
    x = x, y = y,
    ntree = ntree, nodesize = nodesize, maxnodes = maxnodes
  )
}

# Weighted mean absolute error

#' @param actual    Numeric vector of observed values
#' @param predicted Numeric vector (or scalar) of predictions
#' @param weights   Numeric vector of per-observation weights
#' @return A single numeric MAE value

weighted_mae <- function(actual, predicted, weights) {
  sum(abs(actual - predicted) * weights) / sum(weights)
}
