# Load the randomForest package
library(randomForest)

# Read the COVID-19 data
data <- read.csv("corrected_data.csv")

# Create a training and testing set
set.seed(123)
train_index <- sample(nrow(data), 0.8*nrow(data))
train <- data[train_index, start = c(2020, 1)]
test <- data[-train_index start = c(2020, 1)

# Create a random forest model
model <- randomForest(New_deaths ~ ., data=train)

plot(model)

# Make predictions on the test set
predictions <- predict(model, test)

# Evaluate the model
mse <- mean((predictions - test$New_deaths)^2)
print(mse)

