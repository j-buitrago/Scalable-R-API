
FROM rocker/r-ver:3.5.0

RUN apt-get update -qq && apt-get install -y \
  libssl-dev \
  libcurl4-gnutls-dev

RUN R -e "install.packages(c('plumber','randomForest'))"

COPY /deployment.yaml / 
COPY ./R/PredictRf.R ./R/rfModel.RDS /

EXPOSE 8000

ENTRYPOINT ["R", "-e", "p <- plumber::plumb('./PredictRf.R'); pr$run(host='0.0.0.0', port=8000)"]
