REPOSITORY="docker.clarin.eu"
NAME="tomcat8"
VERSION="1.1.5"
IMAGE = "${REPOSITORY}/${NAME}:${VERSION}"

all: build

build:
	@docker build -t ${IMAGE} .

push:
	@docker push ${IMAGE}
