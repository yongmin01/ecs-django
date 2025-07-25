FROM --platform=linux/amd64 python:3.8-slim-buster

# 필수 패키지 설치 (의존성 문제 방지)
RUN apt-get update && apt-get install -y gcc libpq-dev curl netcat && apt-get clean

# 작업 디렉토리 설정
WORKDIR /usr/src/app

# 의존성 설치
COPY requirements.txt .
RUN pip install --upgrade pip && pip install -r requirements.txt

# 프로젝트 복사
COPY . .

# 포트 설정
EXPOSE 8000

# 기본 명령
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
