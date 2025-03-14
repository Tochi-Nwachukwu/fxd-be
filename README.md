# ![FlexxyDrive](https://flexxydrive.com/logo.svg)

# FlexxyDrive Backend

A Django-based backend service for FlexxyDrive, providing robust API endpoints, authentication, and database management.

## 👥 Contributors

- **Tochi Nwachukwu** - Lead Backend Developer [Python]

## 🚀 Technologies Used

- **Python 3.12** - Programming Language
- **Django** - Web Framework
- **Django REST Framework (DRF)** - API Development
- **PostgreSQL** - Database
- **Docker** - Containerization
- **AWS ECS** - Container Orchestration
- **AWS Secrets Manager** - Secure Configuration Management
- **Gunicorn** - WSGI Server

## 🛠 Setup & Installation

### Prerequisites

Ensure you have the following installed:

- Python 3.12
- Docker & Docker Compose
- PostgreSQL (if running locally)

### 1️⃣ Clone the Repository

```bash
git clone https://github.com/your-repo/flexxydrive-backend.git
cd flexxydrive-backend
```

### 2️⃣ Set Up Environment Variables

Create a `.env` file in the project root and add the following:

```ini
SECRET_KEY=your-secret-key
DEBUG=1
DJANGO_ALLOWED_HOSTS=*
DATABASE_ENGINE=
DATABASE_NAME=
DATABASE_USERNAME=
DATABASE_PASSWORD=
DATABASE_HOST=
DATABASE_PORT=
```

### 3️⃣ Install Dependencies

```bash
pip install -r requirements.txt
```

### 4️⃣ Apply Migrations

```bash
python manage.py migrate
```

### 5️⃣ Run the Server

```bash
python manage.py runserver
```

## 🐳 Running with Docker

### Build & Run the Container

```bash
docker-compose up --build -d
```

### Stopping the Container

```bash
docker-compose down
```

## 📜 API Documentation

The API endpoints are documented using **Swagger**. Access it at:

```
http://127.0.0.1:8000/swagger/
```

## 🚀 Deployment on AWS ECS

1. **Push Docker Image to ECR**
2. **Deploy on AWS ECS with Fargate**
3. **Use AWS Secrets Manager for Database Configuration**




## 📄 License

This project is licensed under the **MIT License**.
