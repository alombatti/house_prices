# 3. DATA TRANSFORMATION

# https://medium.com/@rrfd/standardize-or-normalize-examples-in-python-e3f174b65dfc

# Function for normalization between 0 and 1
range01 <- function(x) {
  (x-min(x)) / (max(x)-min(x))
  }

# Creating a copy of my dataframe
complete2 <- complete

# Standardization of sqft_living
complete2$sqft_living <- range01(complete2$sqft_living)
hist(complete2$sqft_living)

# Standardization of sqft_above
complete2$sqft_above <- scale(complete2$sqft_above)
hist(complete2$sqft_above)

# Standardization of sqft_basement
complete2$sqft_basement <- scale(complete2$sqft_basement)
hist(complete2$sqft_basement)

# Standardization of sqft_living15
complete2$sqft_living15 <- scale(complete2$sqft_living15)
hist(complete2$sqft_living15)

# Binning bedrooms
breaks_bed <- c(-Inf, 1, 2, 3, 4, 5, 6, Inf)
names_bed <- c("1", "2", "3", "4", "5", "6", "7-33")
complete2$bedrooms <- cut(complete2$bedrooms, breaks = breaks_bed, labels = names_bed)

# Binning lat
breaks_lat <- c(-Inf, 47.20, 47.25, 47.30, 47.35, 47.40, 47.45, 47.50, 47.55, 47.60,
                47.65, 47.70, 47.75, Inf)
names_lat <- c("47.15 - 47.20", "47.20 - 47.25", "47.25 - 47.30", "47.30 - 47.35",
               "47.35 - 47.40", "47.40 - 47.45", "47.45 - 47.50", "47.50 - 47.55",
               "47.55 - 47.60", "47.60 - 47.65", "47.65 - 47.70", "47.70 - 47.75",
               "47.75 - 47.80")
complete2$lat <- cut(complete2$lat, breaks = breaks_lat, labels = names_lat)

# Keeping only interesting columns
complete2 <- select(complete2, "price", "bedrooms", "bathrooms", "floors",
                       "waterfront", "view", "grade", "lat", "sqft_living", "sqft_living15",
                       "sqft_above", "sqft_basement")

# Dummify variables
complete2 <- dummy_cols(complete2, select_columns = c("bedrooms", "bathrooms",
                           "floors", "waterfront", "view", "grade", "lat"))

complete2$bedrooms = NULL
complete2$bathrooms = NULL
complete2$floors = NULL
complete2$waterfront = NULL
complete2$view = NULL
complete2$grade = NULL
complete2$lat = NULL

# Unstack train and test
train2 <- split(complete2, complete2$price > 0)
train2 <- train2[["TRUE"]]

test2 <- split(complete2, is.na(complete2$price))
test2 <- test2[["TRUE"]]
