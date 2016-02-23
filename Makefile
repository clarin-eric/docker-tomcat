build:
	@docker build -t docker.clarin.eu/tomcat8:1.1.3 .

push:
	@docker push docker.clarin.eu/tomcat8:1.1.3

all: build
