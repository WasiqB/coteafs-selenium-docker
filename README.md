# coteafs-selenium-docker
Testing Environment in Docker container which contains,
1. Google Chrome
1. JDK 1.8
1. Maven 3.5.3
1. VNC Server

## Usage
```bash
$ docker run --rm -p 5900:5900 -v "$PWD":/usr/src wasiqb/coteafs-selenium
```
