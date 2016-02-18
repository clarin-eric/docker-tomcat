# CLARIN docker tomcat image

Packages:

* openjdk8
* tomcat8

Volumes:

Ports:

* 8080: HTTP connector
* 8009: AJP connector

# Build

A make target is available to build this image:

```
make
```

# Deploy

A make target is available to push this image to the clarin docker repository:

```
make push
```

# Run

```
docker run -ti --rm -p 8080 -p 8009 docker.clarin.eu/tomcat8:1.0.0
```