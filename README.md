# Hướng dẫn build từ đầu

    - Link youtube: https://www.youtube.com/watch?v=KN8wuFi2RXM

## Dockerfile

    docker build .

    - content file:
        FROM python:3.9.6-alpine
        ENV PYTHONUNBUFFERED 1
        ENV CRYPTOGRAPHY_DONT_BUILD_RUST 1     => các biến môi trường để cài đặt các package
        ENV PYTHONDONTWRITEBYTECODE 1
        RUN apk update \
            && apk add postgresql-dev gcc python3-dev musl-dev \
            && apk add libffi-dev openssl-dev cargo \
            && apk add netcat-openbsd                => giống như update linux để cài các gói như "psycopg2, django-allauth

        RUN mkdir /app     => tạo folder mới trong container tên là "app" là một thư mục
        WORKDIR /app       => thông báo thư mục làm việc
        COPY . /app        => copy toàn bộ file thư mục cùng cấp với Dockerfile " . " vào thư mục /app trong container
        RUN pip install -r /app/requirements.txt        => cài package

## docker-compose.yml

    docker-compose build

## Command build django project

    docker-compose run [name_service] sh -c "django-admin startproject [project_name] ."

# Deploy on Heroku
