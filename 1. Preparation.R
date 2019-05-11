# 1. PREPARATION

# Libraries
library(ggplot2)
library(corrplot)
library(Stack)
library(fastDummies)
library(dplyr)

# Read the data
train <- read.csv("house_price_train.csv")
test <- read.csv("house_price_test.csv")

# Glimps of the datasets
head(train)
str(train)

head(test)
str(test)

# Check for NAs and missing values
print(length(which(is.na(train) == T))) # No NAs in train
print(length(which(is.na(test) == T))) # No NAs in test

# Change the date format (for train)
train$date <- as.Date(train$date, "%m/%d/%Y")
df.date_train <- data.frame(date = train$date,
                      year = as.numeric(format(train$date, format = "%Y")),
                      month = as.numeric(format(train$date, format = "%m")),
                      day = as.numeric(format(train$date, format = "%d")))

train <- unique(merge(train, df.date_train))
rm(df.date_train)
train <- train[, c(2, 1, 22, 23, 24, 3:21)]

# Change the date format (for test)
test$date <- as.Date(test$date, "%m/%d/%Y")
df.date_test <- data.frame(date = test$date,
                           year = as.numeric(format(test$date, format = "%Y")),
                           month = as.numeric(format(test$date, format = "%m")),
                           day = as.numeric(format(test$date, format = "%d")))

test <- unique(merge(test, df.date_test))
rm(df.date_test)
test <- test[, c(2, 1, 21, 22, 23, 3:20)]

# Stacking the two datasets together
complete <- Stack(train, test)

# Remove ID column
complete$id = NULL

# Remove date column
complete$date = NULL