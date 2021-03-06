# Docker-Exhibitor

## Informations

* Install [Docker](https://www.docker.com/)
* This repository contains **Dockerfile** of [exhibitor](https://github.com/soabase/exhibitor)

## Build

    docker build lilidata/exhibitor:TAG .


## Configuration

Configuration could be attached to the machine via docker volumes and you can check a sample configuration file under the conf folder.

For more information about the configuration you can visit exhibitor's wiki: https://github.com/soabase/exhibitor/wiki


The container will require 3 parameters so start:
* HOSTNAME - hostname that will be used by exhibitor
* PORT - exhibitor web ui will listen on this port
* CONFIG - path for zookeeper configuration file

## How to run

Use-cases can differ but you can check how we use it [lilidata/dataplatform](https://github.com/lili-data/liligo-data-platform)

# License

Licensed under the Apache License, Version 2.0: http://www.apache.org/licenses/LICENSE-2.0
