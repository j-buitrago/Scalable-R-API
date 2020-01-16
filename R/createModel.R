# Create the model to use
data <- mtcars

data$cyl <- as.factor(data$cyl)
if (!require("randomForest")){
  install.packages("randomForest")
}
library(randomForest)
rfModel <- randomForest(cyl ~ ., data = data)
saveRDS(rfModel, "./rfModel.RDS")
           
