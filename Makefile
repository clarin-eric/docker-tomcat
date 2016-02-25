build:
	@docker build -t docker.clarin.eu/tomcat8:1.1.4 .

push:
	@docker push docker.clarin.eu/tomcat8:1.1.4

all: build
