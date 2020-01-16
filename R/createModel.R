# Create the model to use
data <- mtcars

data$cyl <- as.factor(data$cyl)

library(randomForest)
rfModel <- randomForest(cyl ~ ., data = data)
saveRDS(rfModel, "./R/rfModel.RDS")

predict(rfModel, newdata = data[1,])
           