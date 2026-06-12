## Data preparation ##

# Functions for loading the obesity dataset and turning the raw columns
# into model-ready numeric features. Sourced by `part1a_r.Rmd`.

# Read the obesity dataset from a local CSV file
#' @param csv_path Path to the local CSV file
#' @return A tibble with the raw obesity data

load_obesity_data <- function(csv_path) {
  # Stop early with a clear message if the file is missing.
  if (!file.exists(csv_path)) {
    stop("Data file not found: ", csv_path)
  }
  message("Reading data from '", csv_path, "' ...")
  readr::read_csv(csv_path, show_col_types = FALSE)
}

# Add a BMI column computed from weight and height

# BMI = weight (kg) / height (m)^2, computed for the whole column at once

#' @param data Data frame containing `Weight` and `Height` column
#' @return The same data frame with a `BMI` column added

add_bmi <- function(data) {
  data$BMI <- data$Weight / data$Height^2
  data
}

# Classify BMI values into WHO weight categories

# Uses a single vectorised `cut()` instead of a row-by-row loop
# Intervals are [lo, hi) to match the original `<` comparisons

#' @param bmi    Numeric vector of BMI values
#' @param breaks Numeric cut-points (default: WHO thresholds)
#' @param labels Character labels for each interval
#' @return Character vector of category labels
#' 
classify_bmi <- function(bmi,
                         breaks = c(-Inf, 18.5, 25, 30, Inf),
                         labels = c("0_underweight", "1_normal",
                                    "2_overweight", "3_obese")) {
  as.character(cut(bmi, breaks = breaks, labels = labels, right = FALSE))
}

# Encode yes/no columns as 1/0 integers

#' @param data    Data frame
#' @param columns Character vector of yes/no column names
#' @return Data frame with those columns converted to integer 0/1

encode_yes_no <- function(data, columns) {
  for (col in columns) {
    data[[col]] <- as.integer(data[[col]] == "yes")
  }
  data
}

# Encode ordinal frequency columns ('no' < 'Sometimes' < 'Frequently' < 'Always')

# Maps the four levels to integers 0..3.

#' @param data    Data frame
#' @param columns Character vector of ordinal column names
#' @return Data frame with those columns converted to numeric 0..3

encode_ordinal_frequency <- function(data, columns) {
  freq_levels <- c("no", "Sometimes", "Frequently", "Always")
  for (col in columns) {
    data[[col]] <- as.numeric(factor(data[[col]], levels = freq_levels)) - 1
  }
  data
}

# Compute balanced class weights: n / (n_classes * class_count)

# Rare classes get a larger weight to balance the data

#' @param labels Character/factor vector of class labels
#' @return Named numeric vector of weights, one per class

compute_class_weights <- function(labels) {
  freq      <- table(labels)
  n_classes <- length(freq)
  weights   <- length(labels) / (n_classes * as.numeric(freq))
  names(weights) <- names(freq)
  weights
}
