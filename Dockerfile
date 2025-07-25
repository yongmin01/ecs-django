FROM python:3.8-slim-buster as build

WORKDIR /usr/src/app

COPY requirements.txt ./

RUN apt-get update

COPY . .

EXPOSE 80

CMD ["python", "manage.py", "runserver", "0.0.0.0:80"]