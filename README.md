[![auto-update](https://github.com/digrouz/docker-squid/actions/workflows/auto-update.yml/badge.svg)](https://github.com/digrouz/docker-squid/actions/workflows/auto-update.yml)
[![dockerhub](https://github.com/digrouz/docker-squid/actions/workflows/dockerhub.yml/badge.svg)](https://github.com/digrouz/docker-squid/actions/workflows/dockerhub.yml)
![Docker Pulls](https://img.shields.io/docker/pulls/digrouz/squid)

# docker-squid

Install Squid into a Linux container

![squid](https://www.squid-cache.org/Images/img4.jpg)

## Tag
Several tag are available:
* latest: see alpine
* alpine: [Dockerfile_alpine](https://github.com/digrouz/docker-squid/blob/master/Dockerfile_alpine)
* Any version specific tag is based on alpine.

## Description
Squid is a caching proxy for the Web supporting HTTP, HTTPS, FTP, and more. It reduces bandwidth and improves response times by caching and reusing frequently-requested web pages. Squid has extensive access controls and makes a great server accelerator. 

http://sabnzbd.org/

## Usage
    docker create --name=squid \
        -v <path to data>:/config \
        -v <path to cache>:/cache \
        -e UID=<UID default:12345> \
        -e GID=<GID default:12345> \
        -e AUTOUPGRADE=<0|1 default:0> \
        -e TZ=<timezone default:Europe/Brussels> \
        -p 3128:3128 \
        -p 9090:9090  \
    digrouz/squid
        
## Environment Variables

When you start the `squid` image, you can adjust the configuration of the `squid` instance by passing one or more environment variables on the `docker run` command line.

### `UID`

This variable is not mandatory and specifies the user id that will be set to run the application. It has default value `12345`.

### `GID`

This variable is not mandatory and specifies the group id that will be set to run the application. It has default value `12345`.

### `AUTOUPGRADE`

This variable is not mandatory and specifies if the container has to launch software update at startup or not. Valid values are `0` and `1`. It has default value `0`.

### `TZ`

This variable is not mandatory and specifies the timezone to be configured within the container. It has default value `Europe/Brussels`.

## Notes

* This container is built using [s6-overlay](https://github.com/just-containers/s6-overlay)
* The docker entrypoint can upgrade operating system at each startup. To enable this feature, just add `-e AUTOUPGRADE=1` at container creation.

## Issues

If you encounter an issue please open a ticket at [github](https://github.com/digrouz/docker-squid/issues)


