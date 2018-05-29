.PHONY: run build

build:
	docker build --rm -t ericwang915/docker-airflow .

run: build
	docker run -d -p 8080:8080 ericwang915/docker-airflow
	@echo airflow running on http://localhost:8080

push:
	docker push ericwang915/docker-airflow
kill:
	@echo "Killing docker-airflow containers"
	docker kill $(shell docker ps -q --filter ancestor=puckel/docker-airflow)

tty:
	docker exec -i -t $(shell docker ps -q --filter ancestor=puckel/docker-airflow) /bin/bash
