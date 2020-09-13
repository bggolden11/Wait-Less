# Wait-less

![Docker CI](https://github.com/bggolden11/Group-22-Spring-2020/workflows/Docker%20CI/badge.svg)
![azure deploy CI](https://github.com/cs-440-at-uic/Group-22-Spring-2020/workflows/azure%20deploy%20CI/badge.svg)
![SQL build](https://github.com/cs-440-at-uic/Group-22-Spring-2020/workflows/SQL%20build/badge.svg)

![](https://media.giphy.com/media/jKaFXbKyZFja0/giphy.gif)

  - [How To Run Backend Locally](#how-to-run-backend-locally)
    - [Requirements](#requirements)
      - [Option 1 Manual Run](#option-1-manual-run)
      - [Option 2 Docker Run](#option-2-docker-run)
    - [Manual Run](#manual-run)
    - [Docker Run](#docker-run)

## How To Run Backend Locally
Running locally allows you to access all api through local host

### Requirements
#### Option 1 Manual Run

* [Java 1.8](https://www.oracle.com/java/technologies/javase-downloads.html)
* [Maven](https://maven.apache.org/download.cgi)
* [Azure Functions Core Tools](https://docs.microsoft.com/en-us/azure/azure-functions/functions-run-local?tabs=linux%2Ccsharp%2Cbash#v2)

#### Option 2 Docker Run
* [Docker](https://www.docker.com/products/docker-desktop)

### Manual Run
  1. Move into the ```Group-22-Spring-2020/Code/Backend/waitless-functions``` directory
  2. Package the application 
      * ```mvn clean package```
  3. Run the application 
      * ```mvn azure-functions:run```

### Docker Run
  1. Ensure Docker Desktop is Running
  2. Move into the 
      * ```Group-22-Spring-2020/Code/Backend/waitless-functions``` directory
  3. Build and tag the docker container 
      * ```docker build -t waitless-app .```
  4. Start the container 
      
      * ```docker run -p 7071:7071 waitless-app:latest ```
