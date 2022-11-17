# [Template] Python Microservice

This repo should be used as a template to quickly bootstrap a Python Microservice.

## Features

- **FastAPI** is used to expose the microservice
- **Container ready** with Docker

## Setup

We highly recommand setting up a virtual environment for local development. First create the virtual environment with `venv` using the following:

```commandline
python3 -m venv venv
```

This will create a `venv` folder containing our virtual environment. This file is ignored by git and Docker with `.gitignore` and `.dockerignore` respectively.

Next, activate the virtual environment using this command:

```commandline
source venv/bin/activate
```

From that point, we are using `python` and `pip` of our virtual environment. Every `pip install` command will install the package in our `venv/` folder.

To exit the virtual environment, run `desactivate`.

## Using pip-tools

We use `pip-tools` to compile requirements in `.in` files into their corresponding `.txt` files:

- `requirements.in` -> `requirements.txt` which will contain production packages
- `requirements-dev.in` -> `requirements-dev.txt` which will contain development packages used for our local developments

Make sur to install pip-tools with `pip install pip-tools`

You can compile `requirements.in` into their corresponding `requirements.txt` with the following:

```commandline
make compile
```

For local development, `requirements-dev.in` has everything from app packages to testing and linting. Compile it into their `requirements-dev.txt` equivalent with:

```commandline
make compile-dev
```

To install development packages, simply run `make install`.

Have a look at [pip-tools](https://pypi.org/project/pip-tools/) for more information.

## Starting the server for local development

This Python microservice uses FastAPI and Uvicorn. To quickly start the server for local development, simply run:

```commandline
make start
```

This uses the `--reload` uvicorn flag which reloads the server when changes in the code are made.

Running a simple cURL command to port **8000** will show the following:

```txt
curl localhost:8080/

{"message":"Hello World!"}
```