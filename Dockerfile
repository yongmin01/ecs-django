FROM python:3.8-slim-buster as build

WORKDIR /usr/src/app

COPY requirements.txt ./

RUN pip install django

RUN pip install djangorestframework

COPY . .

EXPOSE 80

CMD ["python", "manage.py", "runserver", "0.0.0.0:80"]