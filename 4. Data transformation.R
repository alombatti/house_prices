# 3. DATA TRANSFORMATION

# https://medium.com/@rrfd/standardize-or-normalize-examples-in-python-e3f174b65dfc

# Creating a copy of my dataframe
complete3 <- complete2

# Function for normalization between 0 and 1
range01 <- function(x) {
  (x-min(x)) / (max(x)-min(x))
  }

# Standardization of sqft_living
complete3$sqft_living <- range01(complete3$sqft_living)
hist(complete3$sqft_living)

# Standardization of sqft_above
complete3$sqft_above <- scale(complete3$sqft_above)
hist(complete3$sqft_above)

# Standardization of sqft_living15
complete3$sqft_living15 <- scale(complete3$sqft_living15)
hist(complete3$sqft_living15)

# Binning lat
breaks_lat <- c(-Inf, 47.20, 47.25, 47.30, 47.35, 47.40, 47.45, 47.50, 47.55, 47.60,
                47.65, 47.70, 47.75, Inf)
names_lat <- c("47.15 - 47.20", "47.20 - 47.25", "47.25 - 47.30", "47.30 - 47.35",
               "47.35 - 47.40", "47.40 - 47.45", "47.45 - 47.50", "47.50 - 47.55",
               "47.55 - 47.60", "47.60 - 47.65", "47.65 - 47.70", "47.70 - 47.75",
               "47.75 - 47.80")
complete3$lat <- cut(complete3$lat, breaks = breaks_lat, labels = names_lat)

# Transforming remaining varibles into factor for LR
complete3$bedrooms <- as.factor(complete2$bedrooms)
complete3$bathrooms <- as.factor(complete2$bathrooms)
complete3$floors <- as.factor(complete2$floors)
complete3$waterfront <- as.factor(complete2$waterfront)
complete3$view <- as.factor(complete2$view)
complete3$grade <- as.factor(complete2$grade)
complete3$sqft_basement <- as.factor(complete3$sqft_basement)
complete3$yr_renovated <- as.factor(complete3$yr_renovated)
complete3$condition <- as.factor(complete3$condition)
complete3$zipcode <- as.factor(complete3$zipcode)

# Unstack train and test
train3 <- split(complete3, complete3$price > 0)
train3 <- train3[["TRUE"]]

test3 <- split(complete3, is.na(complete3$price))
test3 <- test3[["TRUE"]]
