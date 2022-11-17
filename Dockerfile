FROM python:3.9-slim-buster

WORKDIR /usr/src/app
ENV PORT 8080
ENV HOST 0.0.0.0

COPY requirements.txt ./
RUN pip install --no-cache-dir --upgrade -r requirements.txt

COPY . ./

EXPOSE $PORT
# CMD uvicorn main:app --host 0.0.0.0 --port $PORT
CMD python main.py