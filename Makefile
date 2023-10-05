all: build kubernetes-run

build:
	docker build . -t registry.localhost:5001/sample.flask:latest
	docker push registry.localhost:5001/sample.flask:latest

clean: kubernetes-delete
	docker image rm sample.flask
	docker image rm registry.localhost:5001/sample.flask:latest

#db:
#	docker run  --rm --detach --name mariadb  -p 33306:3306 -e MARIADB_ROOT_PASSWORD='testpass'-d mariadb:latest

kubernetes-run:
	cd kubernetes && for i in $$(ls -1|sort); do kubectl apply -f $$i;done

kubernetes-delete:
	cd kubernetes && for i in $$(ls -1|sort -r); do kubectl delete -f $$i;done
