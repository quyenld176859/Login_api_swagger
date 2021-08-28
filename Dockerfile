FROM python:3.9.6-alpine
ENV PYTHONUNBUFFERED 1

# for cryptography and django-allauth
ENV CRYPTOGRAPHY_DONT_BUILD_RUST 1
ENV PYTHONDONTWRITEBYTECODE 1
RUN apk update \
    && apk add postgresql-dev gcc python3-dev musl-dev \
    && apk add libffi-dev openssl-dev cargo \
    && apk add netcat-openbsd

RUN mkdir /app
WORKDIR /app
COPY . /app
RUN pip install -r /app/requirements.txt



