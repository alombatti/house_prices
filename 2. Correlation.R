# 2. CORRELATION

# Plot
corr = cor(train[, 3:24])
corrplot(corr, method = "color",
         outline = T,
         cl.pos = "n",
         rect.col = "black",
         tl.col = "indianred4",
         addCoef.col = "black",
         number.digits = 2,
         number.cex = 0.60,
         tl.cex = 0.7,
         cl.cex = 1,
         col = colorRampPalette(c("red", "white", "green4")) (100))

# Keeping only interesting columns with corr > 0.15
complete2 <- select(complete, "price", "bedrooms", "bathrooms", "sqft_living", "floors",
                    "waterfront", "view", "grade", "sqft_above", "sqft_basement", "lat",
                    "sqft_living15", "condition", "yr_renovated", "zipcode")

# to maybe remove: condition, yr_renovated, "zipcode"
