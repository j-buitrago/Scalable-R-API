library(randomForest)
rfModel <- readRDS("./rfModel.RDS")

#* @get /
startFunction <- function(){
  return('Api enabled')
}

#* @post /prediction
ML <- function(data){
  return(
    as.character(
      predict(
        rfModel, newdata = data.frame(mpg = data$mpg,
                                      hp = data$hp,
                                      disp = data$disp,
                                      hp = data$hp,
                                      drat = data$hp,
                                      qsec = data$hp,
                                      vs = data$vs,
                                      am = data$am,
                                      gear = data$gear,
                                      carb = data$carb,
                                      wt = data$carb)
        )
      )
    )
}

#* @get /asynchronousTest
asynchronousTest <- function(){
  Sys.sleep(5)
  return('OK')
}


