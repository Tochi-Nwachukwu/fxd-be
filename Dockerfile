# Here I am using  full Python 3.12 image -- the slim version does not contain all the dependencies needed to build the container
FROM --platform=linux/amd64 python:3.12

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Installing the  required system dependencies
RUN apt-get update && apt-get install -y \
    gdal-bin \
    libgdal-dev \
    python3-gdal \
    libkrb5-dev \
    libssl-dev \
    libffi-dev \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Ensure GDAL and Kerberos are properly configured -- this gave errors when trying to install dependencies
ENV GDAL_CONFIG=/usr/bin/gdal-config
ENV GDAL_VERSION=3.6.2

WORKDIR /app

COPY . /app

RUN pip install --upgrade pip && pip install --no-cache-dir -r requirements.txt

EXPOSE 8000

CMD ["sh", "-c", "python manage.py migrate && python manage.py runserver 0.0.0.0:8000"]