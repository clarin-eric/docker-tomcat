# CLARIN docker tomcat image
Packages:

* openjdk8
* tomcat8

Volumes:

Ports:

* 8009: AJP connector
* 8080: HTTP connector
* 8443: HTTPS connector

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
Using the docker client you can easily start a container based on this image:

```
docker run \
	-ti \
	--rm \
	-p 8009 \
	-p 8080 \
	-p 8443 \
	-e PASSWORD="averysecurepassword" \
	docker.clarin.eu/tomcat8:1.0.1
```

# Other information
At startup a self signed SSL certificate is generated. By default the password `password` is used for the private key and java keystore. You can specify a custom password by setting the `PASSWORD` environment variable via the `-e` docker flag.

It turns out that having different passwords for the keystore and certificate private key results in issues ([more info](http://joewlarson.com/blog/2009/03/25/java-ssl-use-the-same-password-for-keystore-and-key/)).