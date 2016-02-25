build:
	@docker build -t docker.clarin.eu/tomcat8:1.1.5 .

push:
	@docker push docker.clarin.eu/tomcat8:1.1.5

all: build
