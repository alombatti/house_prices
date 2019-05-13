# 3. DATA VISUALIZATION

# Creating a copy of the dataframe to apply EDA changes
complete2 <- complete

# Unstack train and test
train2 <- split(complete2, complete2$price > 0)
train2 <- train2[["TRUE"]]

test2 <- split(complete2, is.na(complete2$price))
test2 <- test2[["TRUE"]]

# Distribution of prices
graph1 <- ggplot(data = train, aes(x = price)) +    
  geom_histogram(alpha = 0.8, fill = "#F1C40F") +
  labs(x = "price", y = "houses", title = "Distribution of Prices") +
  theme_bw()
graph1

graph2 <- ggplot(data = train, aes(x = price)) +    
  geom_histogram(alpha = 0.8, fill = "#F1C40F") +
  scale_x_continuous(limits=c(0, 1.5e6)) +
  labs(x = "price", y = "houses", title = "Distribution of Prices (up to 2 million)") +
  theme_bw()
graph2 #Up to 1.5 million euros
