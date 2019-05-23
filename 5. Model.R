# BASELINE

# To complete our analysis, we run the moden on a dataset with the selected variables
train4 <- train3[, c("bedrooms", "bathrooms", "sqft_living", "floors", "waterfront", "view",
                     "grade", "sqft_above", "sqft_living15", "lat", "condition",
                     "yr_renovated", "zipcode", "price")]
test4 <- test3

# Settings for the model
formula = price ~ .

fitControl <- trainControl(method="cv",number = 5)

# Linear Regression to predict price based on the folloeing variables
model1 <- train(formula,
                data = train4,
                method = "lm",
                trControl = fitControl,
                metric = "MAE") # what is this

# The model scores an R2 of 0.84
summary(model1)

# Now we fit the model to our dataset to predict the prices for every house
train4_fit <- fitted(model1)
train4$pred <- train4_fit

# We create a function for the mean absoulte percentage error
mape <- function(real, predicted) {
  return(mean(abs((real - predicted) / real)))
}

# We score the MAPE on our actual and predicted values
mape(train4$price, train4$pred)

# We predict the prices on the test dataset
test4$price <- predict(model1, test4)