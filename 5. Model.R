# BASELINE

baseline <- lm(formula = price ~ bedrooms +
                 bathrooms +
                 sqft_living +
                 floors +
                 waterfront +
                 view +
                 grade +
                 sqft_above +
                 sqft_basement +
                 lat +
                 sqft_living15 +
                 condition +
                 yr_renovated +
                 zipcode,
               data = train3)

summary(baseline)
