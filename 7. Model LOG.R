# Linear model with log(prices)

# Create new dataframes
train6 <- train3[, c("bedrooms", "bathrooms", "sqft_living", "floors", "waterfront", "view",
                     "grade", "sqft_above", "sqft_living15", "lat", "condition",
                     "yr_renovated", "zipcode", "price")]
test6 <- test3

# Transform into log prices
train6$price <- log(train6$price)
test6$price <- log(test6$price)

# Liner model
model3 <- train(formula,
                data = train6,
                method = "lm",
                trControl = fitControl,
                metric = "MAE")

# The model scores an R2 of 0.88
summary(model3)

# Now we fit the model to our dataset to predict the prices for every house
train6_fit <- fitted(model3)
train6$pred <- train6_fit

# Turn the log back into normal prices
train6$price <- exp(train6$price)
train6$pred <- exp(train6$pred)

# We create a function for the mean absoulte percentage error
mape <- function(real, predicted) {
  return(mean(abs((real - predicted) / real)))
}

# We score the MAPE on our actual and predicted values
mape(train6$price, train6$pred)
