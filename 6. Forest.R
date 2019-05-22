# Settings for the model
formula = price ~ .

ctrl <- trainControl(
  method = "cv",
  number = 10,
  savePredictions=TRUE
)

tuneGrid=data.table(expand.grid(mtry=c(5,15),
                                splitrule='variance',
                                min.node.size=c(2,5,10)))

# Linear Regression to predict price based on the folloeing variables
model1 <- train(formula,
                data = train4,
                method = "ranger",
                num.trees=50,
                preProc = NULL, 
                tuneGrid = tuneGrid,
                trControl = ctrl,
                metric = "MAPE")

# The model scores an R2 of 0.84
summary(model1)
model1