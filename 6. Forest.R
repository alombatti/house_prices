# RANDOM FOREST

library(randomForest)

train5 <- train3[, c("bedrooms", "bathrooms", "sqft_living", "floors", "waterfront", "view",
                     "grade", "sqft_above", "sqft_living15", "lat", "condition",
                     "yr_renovated", "price")]
test5 <- test3

random_forest <- randomForest(formula,
                              data = train5)

random_forest # I get a R2 of 0.8044