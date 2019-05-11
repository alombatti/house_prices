# BASELINE

baseline <- lm(formula = price ~ year + month + day + bedrooms + bathrooms + sqft_living +
                 sqft_lot + floors + waterfront + view + condition + grade + sqft_above +
                 sqft_basement + yr_built + yr_renovated + zipcode + lat + long +
                 sqft_living15 + sqft_lot15, data = train)
summary(baseline)
