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
complete2 <- select(complete, "id", "price", "bedrooms", "bathrooms", "sqft_living", "floors",
                    "waterfront", "view", "grade", "sqft_above", "sqft_basement", "lat",
                    "sqft_living15", "condition", "yr_renovated", "zipcode")

# to maybe remove: condition, yr_renovated, "zipcode" (because they don't respect > 0.15)
# As we transform them in factors later in the project (after EDA), we can't relly exclude them
# because the corr matrix takes them into consideration as numeric values, and as numeric they
# might not have any correlation. But as factor they could have, so we keep them
