# BASELINE

# Linear Regression to predict price based on the folloeing variables
model1 <- lm(formula = price ~ bedrooms +
               bathrooms +
               sqft_living +
               floors +
               waterfront +
               view +
               grade +
               sqft_above +
               sqft_living15 +
               lat +
               condition +
               yr_renovated +
               zipcode,
               data = train3)

# The model scores an R2 of 0.84
summary(model1)

# Now we fit the model to our dataset to predict the prices for every house
train3_fit <- fitted(model1)
train3$pred <- train3_fit

# We create a function for the mean absoulte percentage error
mape <- function(real, predicted) {
  return(mean(abs((real - predicted) / real)))
}

# We score the MAPE on our actual and predicted values
mape(train3$price, train3$pred)

# We predict the prices on the test dataset
test3$price <- predict(model1, test3)