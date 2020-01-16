data <- mtcars

data$cyl <- as.factor(data$cyl)
if (!require("randomForest")){
  install.packages("randomForest")
}
library(randomForest)
set.seed(1234)
rfModel <- randomForest(cyl ~ ., data = data)
saveRDS(rfModel, "./rfModel.RDS")
           
