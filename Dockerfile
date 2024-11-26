FROM --platform=linux/amd64 python:3.12-slim as build

RUN apt-get update && apt update

WORKDIR /usr/src/app
COPY requirements.txt ./
RUN pip install -r requirements.txt
RUN rm -rf /var/lib/apt/lists/*
COPY . .

EXPOSE 80
CMD ["python", "manage.py", "runserver", "0.0.0.0:80"]

