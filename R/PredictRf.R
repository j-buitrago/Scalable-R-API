library(randomForest)
rfModel <- readRDS("./rfModel.RDS")

#* @get /
startFunction <- function(){
  return('Api enabled')
}

#* @post /predpost
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
                                      carb = data$carb)
        )
      )
    )
}

#* @get /asynchronousTest
asynchronousTest <- function(){
  Sys.sleep(5)
  return('OK')
}

#* @get /prueba
ML2 <- function(mpg, disp, hp){
  out <- tryCatch(
    {
      datos <- data.frame(mpg = as.numeric(mpg),
                          disp = as.numeric(disp),
                          hp = as.numeric(hp))
      print(datos)
      predict(object = rfModel, newdata = datos)
    },
    error=function(cond) {
      x <- message(cond)
      # Choose a return value in case of error
      return(x)
    }
  )    
  return(out)

}

#* @post /predpost
ML3 <- function(data){
datos <- data.frame(mpg = data$mpg,
                    hp = data$hp,
                    disp = data$disp)
  
  return(
    as.character(predict(rfModel, newdata = datos))
    )
}
