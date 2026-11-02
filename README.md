# 📚 LMS — Learning Management System

<div align="center">

![LMS Banner](https://via.placeholder.com/900x200/10b981/ffffff?text=Learning+Management+System)

[![Frontend](https://img.shields.io/badge/Frontend-React.js-61DAFB?style=for-the-badge&logo=react)](https://reactjs.org/)
[![Backend](https://img.shields.io/badge/Backend-Django-092E20?style=for-the-badge&logo=django)](https://www.djangoproject.com/)
[![Database](https://img.shields.io/badge/Database-MySQL-4479A1?style=for-the-badge&logo=mysql)](https://www.mysql.com/)
[![Python](https://img.shields.io/badge/Python-3.x-3776AB?style=for-the-badge&logo=python)](https://www.python.org/)
[![License](https://img.shields.io/badge/License-MIT-yellow?style=for-the-badge)](LICENSE)

**A full-stack Learning Management System built with React and Django.**

</div>

---

## 📌 Table of Contents

- [About the Project](#about-the-project)
- [Tech Stack](#tech-stack)
- [Project Structure](#project-structure)
- [Getting Started](#getting-started)
- [Author](#author)
- [License](#license)

---

## 📖 About the Project

A complete Learning Management System where students can access courses, track progress, and manage their learning journey. Built with a Django REST API backend and a React frontend.

---

## 🛠️ Tech Stack

| Layer | Technology |
|-------|-----------|
| Frontend | React.js |
| Backend | Django (Python) |
| Database | MySQL |
| API | Django REST Framework |
| API Base URL | `http://127.0.0.1:8000` |

---

## 📁 Project Structure

```
LMS_PROJECT - PYTHON/
├── frontend/          # React.js application
├── lms_backend/       # Django REST API
└── lms.sql            # MySQL database dump
```

---

## 🚀 Getting Started

### Prerequisites

- Node.js v18+
- Python 3.x
- MySQL 8+
- pip

---

### 1️⃣ Database Setup

```sql
-- Import the SQL file in MySQL Workbench
source lms.sql;
```

---

### 2️⃣ Backend Setup (Django)

```bash
cd lms_backend

# Create virtual environment
python -m venv venv

# Activate virtual environment
# Windows:
venv\Scripts\activate
# Mac/Linux:
source venv/bin/activate

# Install dependencies
pip install -r requirements.txt

# Apply migrations
python manage.py migrate

# Run the server
python manage.py runserver
# Runs on http://127.0.0.1:8000
```

---

### 3️⃣ Frontend Setup (React)

```bash
cd frontend
npm install
npm start
# Runs on http://localhost:3000
```

---

## 👨‍💻 Author

**Abdul Razak**

[![GitHub](https://img.shields.io/badge/GitHub-Abdul--razak98-181717?style=flat&logo=github)](https://github.com/Abdul-razak98)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-abdulrazak27-0A66C2?style=flat&logo=linkedin)](https://www.linkedin.com/in/abdulrazak27/)
[![Instagram](https://img.shields.io/badge/Instagram-abdulrazak27__-E4405F?style=flat&logo=instagram)](https://www.instagram.com/abdulrazak27_/)

---

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

---

<div align="center">
  Made with ❤️ by Abdul Razak
</div>
