# RANDOM FOREST

train5 <- train3[, c("bedrooms", "bathrooms", "sqft_living", "floors", "waterfront", "view",
                     "grade", "sqft_above", "sqft_living15", "lat", "condition",
                     "yr_renovated", "price")]
test5 <- test3

model2 <- randomForest(formula,
                       data = train5)

model2 # I get a R2 of 0.8044