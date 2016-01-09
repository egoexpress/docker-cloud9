docker-cloud9
=============

Based on [Kevin Delfour](https://github.com/kdelfour/cloud9-docker)'s excellent [kdelfour/cloud9-docker](https://registry.hub.docker.com/u/kdelfour/cloud9-docker/) image, this version includes a docker-compose setup and various improvements (e.g. usage of nginx-proxy reserve proxy setup).

## Usage

Get egoexpress/cloud9 container from Docker Hub or build it yourself using 'docker build'. Afterwards, set DOCKER_CLOUD9_HOSTNAME to the hostname of your choice and start the container instance.
    
    docker build -t egoexpress/cloud9 .
    export DOCKER_CLOUD9_HOSTNAME=cloud9.example.com
    docker-compose up -d
