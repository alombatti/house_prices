# 3. DATA TRANSFORMATION

# https://medium.com/@rrfd/standardize-or-normalize-examples-in-python-e3f174b65dfc

# Function for normalization between 0 and 1
range01 <- function(x) {
  (x-min(x)) / (max(x)-min(x))
  }

# Creating a copy of my dataframe
complete3 <- complete

# Standardization of sqft_living
complete3$sqft_living <- range01(complete3$sqft_living)
hist(complete3$sqft_living)

# Standardization of sqft_above
complete3$sqft_above <- scale(complete3$sqft_above)
hist(complete3$sqft_above)

# Standardization of sqft_basement
complete3$sqft_basement <- scale(complete3$sqft_basement)
hist(complete3$sqft_basement)

# Standardization of sqft_living15
complete3$sqft_living15 <- scale(complete3$sqft_living15)
hist(complete3$sqft_living15)

# Binning bedrooms
breaks_bed <- c(-Inf, 1, 2, 3, 4, 5, 6, Inf)
names_bed <- c("1", "2", "3", "4", "5", "6", "7-33")
complete3$bedrooms <- cut(complete3$bedrooms, breaks = breaks_bed, labels = names_bed)

# Binning lat
breaks_lat <- c(-Inf, 47.20, 47.25, 47.30, 47.35, 47.40, 47.45, 47.50, 47.55, 47.60,
                47.65, 47.70, 47.75, Inf)
names_lat <- c("47.15 - 47.20", "47.20 - 47.25", "47.25 - 47.30", "47.30 - 47.35",
               "47.35 - 47.40", "47.40 - 47.45", "47.45 - 47.50", "47.50 - 47.55",
               "47.55 - 47.60", "47.60 - 47.65", "47.65 - 47.70", "47.70 - 47.75",
               "47.75 - 47.80")
complete3$lat <- cut(complete3$lat, breaks = breaks_lat, labels = names_lat)

# Keeping only interesting columns
complete3 <- select(complete3, "price", "bedrooms", "bathrooms", "floors",
                       "waterfront", "view", "grade", "lat", "sqft_living", "sqft_living15",
                       "sqft_above", "sqft_basement")

# Transforming remaining varibles into factor for LR
complete3$bathrooms <- as.factor(complete2$bathrooms)
complete3$floors <- as.factor(complete2$floors)
complete3$waterfront <- as.factor(complete2$waterfront)
complete3$view <- as.factor(complete2$view)
complete3$grade <- as.factor(complete2$grade)

# Dummify variables
# complete2 <- dummy_cols(complete2, select_columns = c("bedrooms", "bathrooms",
#                           "floors", "waterfront", "view", "grade", "lat"))

# complete2$bedrooms = NULL
# complete2$bathrooms = NULL
# complete2$floors = NULL
# complete2$waterfront = NULL
# complete2$view = NULL
# complete2$grade = NULL
# complete2$lat = NULL

# Unstack train and test
train3 <- split(complete3, complete3$price > 0)
train3 <- train3[["TRUE"]]

test3 <- split(complete3, is.na(complete3$price))
test3 <- test3[["TRUE"]]
