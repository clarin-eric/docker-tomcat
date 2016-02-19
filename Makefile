build:
	@docker build -t docker.clarin.eu/tomcat8:1.1.2 .

push:
	@docker push docker.clarin.eu/tomcat8:1.1.2

all: build
