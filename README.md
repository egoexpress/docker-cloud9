docker-cloud9
=============

Based on [Kevin Delfour](https://github.com/kdelfour/cloud9-docker)'s excellent [kdelfour/cloud9-docker](https://registry.hub.docker.com/u/kdelfour/cloud9-docker/) image, this version includes a docker-compose setup and various improvements (e.g. usage of nginx-proxy reserve proxy setup).

## Prerequisites

This docker setup requires a properly setup nginx reverse proxy setup as provided by [jwilder/nginx-proxy](https://github.com/jwilder/nginx-proxy). 

## Usage

Get the _egoexpress/cloud9_ container from [Docker Hub](https://hub.docker.com/r/egoexpress/cloud9) or build it yourself using _docker build_. Afterwards, set _DOCKER_CLOUD9_HOSTNAME_ to the hostname of your choice (that is reverse proxied by nginx-proxy), _DOCKER_CLOUD9_USERNAME_ and _DOCKER_CLOUD9_PASSWORD_ to your user data and start the container instances using _docker-compose_.
    
    docker build -t egoexpress/cloud9 .
    export DOCKER_CLOUD9_HOSTNAME=cloud9.example.com
    export DOCKER_CLOUD9_USERNAME=johndoe
    export DOCKER_CLOUD9_PASSWORD=foobar
    docker-compose up -d

Then use your browser to go to _http://cloud9.example.com_ (the host your specified in _DOCKER_CLOUD9_USERNAME_) and login.
