
# Load the necessary libraries
library(tidyverse)
library(caret)
library(prophet)
library(forecast)

# Read the data
data <- read.csv('corrected_data.csv')

# Create a training and test set
set.seed(123)
#data$Cumulative_cases <- c(data$Cumulative_cases, 10, 20, 30, 40, 50)
train_index <- sample(nrow(data), nrow(data) * 0.8)

#train_index <- createDataPartition(data$CUmulative_cases, p = 0.8, list = FALSE)
train_data <- data[train_index, ]
test_data <- data[-train_index, ]

# Fit a machine learning model
model <- prophet(train_data)

# Make a prediction
prediction <- predict(model, newdata = test_data)

# Evaluate the prediction
accuracy(prediction$yhat, test_data$Cumulative_cases)