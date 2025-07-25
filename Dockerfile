FROM --platform=linux/amd64 python:3.8-slim-buster as build

RUN apt-get update

WORKDIR /usr/src/app

COPY requirements.txt ./  

COPY . .

EXPOSE 80

CMD ["python", "manage.py", "runserver", "0.0.0.0:80"]