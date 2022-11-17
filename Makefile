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
	uvicorn main:app --reload
.PHONY: start