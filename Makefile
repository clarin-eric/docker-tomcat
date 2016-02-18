build:
	@docker build -t docker.clarin.eu/tomcat8:1.0.1 .

push:
	@docker push docker.clarin.eu/tomcat8:1.0.1

all: build
