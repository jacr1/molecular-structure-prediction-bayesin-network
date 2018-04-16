
# Molecular Structure Prediction Using Bayesian Networks

This repo contains code to create a molecular strucutre graph wihtin an SQL database. While the user is drawing it takes the data and creates a baysin network to try and predict what the user is trying to create from past data.

![alt text](https://raw.githubusercontent.com/jacr1/molecular-structure-prediction-bayesin-network/master/documentation/readmeImage.png)

## Getting Started

 ### How to Build Rest API
Move into the /rest-api sub-directory

 1. Clone RDKit repo using command:  

> gradle cloneRDKit`

 2. you are required to generate the RDkit wrappers:

> buildRDKit.sh`

 3.  Build overall project:

> gradle build

### How to Build Front-end

Move into the /front-end sub-directory

1. run npm install

2. Apply for getting the Ketcher 2.0 code from: 
> http://lifescience.opensource.epam.com/download/ketcher.html

3. Place the ketcher lib into directory /front-end/lib/

## Run

### Run database

 1. You now need to download and run hsqldb.
> https://sourceforge.net/projects/hsqldb/files/
 2. Take database.script file from /rest-api folder.
 
3. run with command from hsqldb folder:
```
sudo java -cp hsqldb.jar org.hsqldb.Server -database.0 file:database.script -dbname.0 jacr_structure_prediction	
```
4. set /rest-api/application.properties 
```
spring.datasource.url=jdbc:hsqldb:hsql://localhost:9001/jacr_structure_prediction
```
 ### Run Rest API
```
bash /rest-api/run.sh
```

 ### How to run web page 
open file
```
front-end/struct-predicion.html 
```










