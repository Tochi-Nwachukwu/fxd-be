# Use full Python 3.12 image
FROM --platform=linux/amd64 python:3.12

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install required system dependencies
RUN apt-get update && apt-get install -y \
    gdal-bin \
    libgdal-dev \
    python3-gdal \
    libkrb5-dev \
    libssl-dev \
    libffi-dev \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Ensure GDAL and Kerberos are properly configured
ENV GDAL_CONFIG=/usr/bin/gdal-config
ENV GDAL_VERSION=3.6.2

# Set the working directory inside the container
WORKDIR /app

# Copy the entire project into the container
COPY . /app

# Install dependencies
RUN pip install --upgrade pip && pip install --no-cache-dir -r requirements.txt

# Expose port 8000 for Django
EXPOSE 8000

# Default command to apply migrations and start Django
CMD ["sh", "-c", "python manage.py migrate && python manage.py runserver 0.0.0.0:8000"]