build: docker-build
	docker run -v ${PWD}/configs:/work/configs -v ${PWD}/cache:/work/cache -v ${PWD}/build:/work/build -e MARLIN_VERSION=`cat .marlin.lock` -e MARLIN_ENVIRONMENT=sanguino_atmega1284p frbncis/marlin-build

docker-build:
	docker build . -t frbncis/marlin-build -f docker/Dockerfile
