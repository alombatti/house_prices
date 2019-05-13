# BASELINE

baseline <- lm(formula = price ~ bedrooms +
                 bathrooms +
                 floors +
                 waterfront +
                 view +
                 grade +
                 lat +
                 sqft_living +
                 sqft_living15 +
                 sqft_above +
                 sqft_basement,
               data = train3)

summary(baseline)
