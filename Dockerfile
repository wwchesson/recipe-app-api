FROM python:3.9-alpine3.13
LABEL maintainer="wwchesson"

ENV PYTHONUNBUFFERED 1

COPY ./requirements.tx /tmp/requirements.txt  
COPY ./app /app
WORKDIR /app
#expose is for port
EXPOSE 8000 

RUN pythom -m venv /py && \
    /py/bin/pip install --upgrade pip && \
    /py/bin/pip install -r /tmp/requirements.txt && \
    rm -rf /tmp && \
    adduser \
        --disabled-password \
        --no-create-home \
        django-user

ENV PATH="/py/bin:$PATH"

USER django-user