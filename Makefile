all: build run

build:
	docker build . -t sample.flask

run: db
	docker run --rm --name sample --publish 8000:8000 -d sample.flask 

clean:
	docker stop sample
	docker stop mariadb
	docker rm sample
	docker image rm -f sample.flask

db:
	docker run  --rm --detach --name mariadb  -p 33306:3306 -e MARIADB_ROOT_PASSWORD='testpass'-d mariadb:latest