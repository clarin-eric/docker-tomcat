build:
	@docker build -t docker.clarin.eu/tomcat8:1.1.0 .

push:
	@docker push docker.clarin.eu/tomcat8:1.1.0

all: build
