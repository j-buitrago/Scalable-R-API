# Scalable-R-API

## Objective

The main purpouse of this project is provide a method to create a scalable API using R. The easiest way to create a API in R is using Plumber package <https://cran.r-project.org/web/packages/plumber/index.html>

If you are used this package you probaly know that by default, plumber allows you to create an asynchronous API. This is a serious problem if you want to use it in a production environment. There are probably many methods to avoid this, in this project I'm going to use Docker and Kubernetes to make it possible.


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

- Now we can try our container
```
docker run --rm -p 8000:8000 plumber-example
```



https://raw.githubusercontent.com/j-buitrago//Scalable-R-API/master/images/DockerRunning.png
