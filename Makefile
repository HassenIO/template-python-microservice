tag = 0.1.0

compile:
	pip-compile --output-file=requirements.txt requirements.in &> /dev/null
.PHONY: compile

compile-dev:  # TODO: Fusion both operations, generating both .txt files
	pip-compile --output-file=requirements-dev.txt requirements-dev.in &> /dev/null
.PHONY: compile-dev

install:
	pip install -r requirements-dev.txt
.PHONY: install

start:
	python main.py
.PHONY: start

build:
	docker build --tag python-microservice:$(tag) .
.PHONY: build

run:
	docker run --rm -e PORT=8080 -p 8080:8080 --name python-microservice python-microservice:$(tag)