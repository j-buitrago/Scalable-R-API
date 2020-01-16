# Scalable-R-API

## Objective

The main purpouse of this project is provide a method to create a scalable API using R. The easiest way to create a API in R is using Plumber package <https://cran.r-project.org/web/packages/plumber/index.html>

If you are used this package you probably know that by default, plumber allows you to create a synchronous API. This is a serious problem if you want to use it in a production environment. There are probably many methods to avoid this, in this project I'm going to use Docker and Kubernetes for trying to fix this problem.


## Create a simple ML model

To use a real model, we can create it with the popular dataset ```mtcars```. The objective is not create a great model, we are just doing it to simulate a real situation of a ML model doing predictions via API.

Execute this command to create the object ```RfModel.RDS```

```
Rscript ./R/createModel.R
```

## Build a Docker container 

- I will use a previous image of R (3.5.0). To pull this image run:

```
docker pull rocker/r-ver:3.5.0
```

- Now we can create our docker container with our Plumber API. Necessary information to build the container is in 
```./Dockerfile```
```
docker build -t plumber-example .
```

To run our container we just have to execute:

```
docker run --rm -p 8000:8000 plumber-example
```

If everything is working correctly you should see something like this:

![DockerRunning](https://github.com/j-buitrago/Scalable-R-API/blob/master/images/DockerRunning.png)


It's time to use our API to make predictions, if you run the next command you have to receive: ["6"], the prediction of our Random Forest model.

```
curl -d '{"data":{"mpg":21,"disp":160,"hp":100,"drat":3.9,"wt":2.62,"qsec":16.46,"vs":0,"am":1,"gear":4,"carb":4}}' http://127.0.0.1/prediction
```
Nice, we can use our model but what happen if we do this request first and immediately we try to make a prediction? Our prediction will need five seconds...

```
curl http://127.0.0.1/asynchronousTest
```

If we go to the file ```./R/PredictRf``` we can check that asynchronousTest just wait 5 seconds and return "OK".
We can use this function to check that our API is synchronous.
