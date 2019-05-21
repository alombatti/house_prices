# 3. DATA VISUALIZATION

# Creating a copy of the dataframe to apply EDA changes
complete2 <- complete

# Unstack train and test
train2 <- split(complete2, complete2$price > 0)
train2 <- train2[["TRUE"]]

test2 <- split(complete2, is.na(complete2$price))
test2 <- test2[["TRUE"]]

# Distribution of prices
graph1 <- ggplot(data = train2, aes(x = price)) +    
  geom_histogram(alpha = 0.8, fill = "#F1C40F") +
  labs(x = "price", y = "houses", title = "Distribution of Prices") +
  theme_bw()
graph1

graph2 <- ggplot(data = train2, aes(x = price)) +    
  geom_histogram(alpha = 0.8, fill = "#F1C40F") +
  scale_x_continuous(limits=c(0, 1.5e6)) +
  labs(x = "price", y = "houses", title = "Distribution of Prices (up to 2 million)") +
  theme_bw()
graph2 #Up to 1.5 million euros

# I transform the price with the log to have better graphs
train2$logprice = log(train2$price)

# Boxplot between price and bedrooms
graph3 <- boxplot(train2[, "logprice"] ~ train2[, "bedrooms"],
                  main = "Price vs Bedrooms", col=c("#F1C40F","#336633"),
                  xlab="bedrooms", ylab="log (price)")

print(subset(train2, train2$bedrooms > 10)) # We remove these values

# Boxplot between price and bathrooms
graph4 <- boxplot(train2[, "logprice"] ~ train2[, "bathrooms"],
                  main = "Price vs Bathrooms", col=c("#F1C40F","#336633"),
                  xlab="bathrooms", ylab="log (price)")

# Boxplot between price and floors
graph5 <- boxplot(train2[, "logprice"] ~ train2[, "floors"],
                  main = "Price vs Floors", col=c("#F1C40F","#336633"),
                  xlab="floors", ylab="log (price)")

# Boxplot between price and waterfront
graph6 <- boxplot(train2[, "logprice"] ~ train2[, "waterfront"],
                  main = "Price vs Waterfront", col=c("#F1C40F","#336633"),
                  xlab="waterfront", ylab="log (price)")

# Boxplot between price and view
graph7 <- boxplot(train2[, "logprice"] ~ train2[, "view"],
                  main = "Price vs View", col=c("#F1C40F","#336633"),
                  xlab="view", ylab="log (price)")

# Boxplot between price and condition
graph8 <- boxplot(train2[, "logprice"] ~ train2[, "condition"],
                  main = "Price vs Condition", col=c("#F1C40F","#336633"),
                  xlab="condition", ylab="log (price)")

# Boxplot between price and grade
graph9 <- boxplot(train2[, "logprice"] ~ train2[, "grade"],
                  main = "Price vs Grade", col=c("#F1C40F","#336633"),
                  xlab="grade", ylab="log (price)")

# Boxplot between price and sqft_living
graph10 <- boxplot(train2[, "logprice"] ~ train2[, "sqft_living"],
                  main = "Price vs sqft_Living", col=c("#F1C40F","#336633"),
                  xlab="sqft_living", ylab="log (price)")

# Boxplot between price and sqft_basement
graph11 <- boxplot(train2[, "logprice"] ~ train2[, "sqft_basement"],
                   main = "Price vs sqft_Basement", col=c("#F1C40F","#336633"),
                   xlab="sqft_basement", ylab="log (price)")

length(train2$sqft_basement[train2$sqft_basement == 0])
length(train2$sqft_basement[train2$sqft_basement != 0]) # Most of the houses do not have

# Boxplot between price and yr_renovated
graph12 <- boxplot(train2[, "logprice"] ~ train2[, "yr_renovated"],
                   main = "Price vs yr_Renovated", col=c("#F1C40F","#336633"),
                   xlab="yr_renovated", ylab="log (price)")

length(train2$yr_renovated[train2$yr_renovated == 0])
length(train2$yr_renovated[train2$yr_renovated != 0]) # Most of the houses do not have

# Boxplot between price and zipcode
graph13 <- boxplot(train2[, "logprice"] ~ train2[, "zipcode"],
                   main = "Price vs Zipcode", col=c("#F1C40F","#336633"),
                   xlab="zipcode", ylab="log (price)")

# Boxplot between price and sqft_living15
graph14 <- boxplot(train2[, "logprice"] ~ train2[, "sqft_living15"],
                   main = "Price vs sqft_Living(15)", col=c("#F1C40F","#336633"),
                   xlab="sqft_living(15)", ylab="log (price)")

# Last, we apply the changes to the dataset
train2 <- train2[-5419, ] # Eliminate bathrooms = 7.5

train2 <- train2[train2$bedrooms <= 10, ] # Keeping bedrooms <10

train2$sqft_basement[train2$sqft_basement != 0] = 1 # Dummify basement
test2$sqft_basement[test2$sqft_basement != 0] = 1

train2$yr_renovated[train2$yr_renovated != 0] = 1 #Dummify yr_renovated
test2$yr_renovated[test2$yr_renovated != 0] = 1

# And we stack back together train and test
train2$logprice <- NULL
complete2 <- Stack(train2, test2)