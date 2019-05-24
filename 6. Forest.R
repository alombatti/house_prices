# RANDOM FOREST

library(randomForest)

train5 <- train3[, c("bedrooms", "bathrooms", "sqft_living", "floors", "waterfront", "view",
                     "grade", "sqft_above", "sqft_living15", "lat", "condition",
                     "yr_renovated", "price")]
test5 <- test3

random_forest <- randomForest(formula,
                              data = train6)

train5_fit <- fitted(random_forest)
train5$pred <- train5_fit

mape(train5$price, train5$pred)

summary(random_forest)
