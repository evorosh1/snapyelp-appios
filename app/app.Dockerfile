FROM python:3.9

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /var/app

RUN pip install --upgrade pip
COPY ./requirements.txt /var/tmp/requirements.txt
RUN pip install -r /var/tmp/requirements.txt
